#!/bin/bash

# CS2I Development Startup Script (Local Mode)
# Usage: ./start-dev.sh [--fresh] [--docker]

set -e

echo "🚀 CS2I Development Environment Startup"
echo "========================================"

# Check for docker mode flag
if [ "$1" == "--docker" ] || [ "$2" == "--docker" ]; then
    DOCKER_MODE=true
    COMPOSE_FILE="docker-compose.yaml"
    echo "📦 Running in Docker mode"
else
    DOCKER_MODE=false
    echo "💻 Running in Local mode (DB & Redis in Docker)"
fi

# Check for fresh start flag
if [ "$1" == "--fresh" ] || [ "$2" == "--fresh" ]; then
    echo "🧹 Fresh start requested - removing volumes..."
    if [ "$DOCKER_MODE" = true ]; then
        docker compose -f $COMPOSE_FILE down -v --remove-orphans
    else
        docker compose down -v --remove-orphans
    fi
    echo "✅ Volumes removed"
fi

if [ "$DOCKER_MODE" = true ]; then
    # Full Docker mode
    echo "📦 Starting all containers..."
    docker compose -f $COMPOSE_FILE up -d
else
    # Local mode - only start DB and Redis
    echo "📦 Starting database and Redis containers..."
    docker compose up -d db redis

    # Wait for database to be healthy
    echo "⏳ Waiting for database to be healthy..."
    until docker exec cs2i-db mysqladmin ping -h localhost --silent 2>/dev/null; do
        echo "   Database not ready yet, waiting..."
        sleep 3
    done
    echo "✅ Database is healthy"

    # Run migrations
    echo "🔄 Running database migrations..."
    cd cs2i-api
    npx sequelize-cli db:migrate

    # Seed database if fresh start
    if [ "$1" == "--fresh" ] || [ "$2" == "--fresh" ]; then
        echo "🌱 Seeding database..."
        npx sequelize-cli db:seed:all
    fi
    cd ..

    # Start API
    echo "🚀 Starting API server..."
    cd cs2i-api && npm start &
    API_PID=$!
    cd ..
    sleep 3

    # Start Admin
    echo "🚀 Starting Admin frontend..."
    cd cs2i-admin && npm run dev &
    ADMIN_PID=$!
    cd ..
    sleep 2

    # Start Client
    echo "🚀 Starting Client frontend..."
    cd cs2i-client && npm run dev &
    CLIENT_PID=$!
    cd ..
    sleep 2
fi

# Show status
echo ""
echo "========================================"
echo "🎉 CS2I Development Environment Ready!"
echo "========================================"
echo ""

if [ "$DOCKER_MODE" = true ]; then
    docker compose -f $COMPOSE_FILE ps
else
    echo "📦 Docker services:"
    docker compose ps
    echo ""
    echo "💻 Local services running in background"
fi

echo ""
echo "📚 Services:"
echo "   API:    http://localhost:3000"
echo "   Admin:  http://localhost:3002"
echo "   Client: http://localhost:3001"
echo ""
echo "📝 Default Users:"
echo "   Admin:     admin@cs2i.org / password"
echo "   Counselor: counselor@cs2i.org / password"
echo "   Member:    member@cs2i.org / password"
echo ""
echo "💡 Tips:"
echo "   - Use --fresh flag to reset database: ./start-dev.sh --fresh"
echo "   - Use --docker flag for full Docker mode: ./start-dev.sh --docker"
echo "   - Stop local services: pkill -f 'node server.js' && docker compose down"
echo "   - Stop Docker: docker compose down"
