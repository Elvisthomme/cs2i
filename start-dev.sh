#!/bin/bash

# CS2I Development Startup Script
# Usage: ./start-dev.sh [--fresh]

set -e

COMPOSE_FILE="docker-compose.dev.yaml"

echo "🚀 CS2I Development Environment Startup"
echo "========================================"

# Check for fresh start flag
if [ "$1" == "--fresh" ]; then
    echo "🧹 Fresh start requested - removing volumes..."
    docker compose -f $COMPOSE_FILE down -v --remove-orphans
    echo "✅ Volumes removed"
fi

# Start containers
echo "📦 Starting containers..."
docker compose -f $COMPOSE_FILE up -d

# Wait for database to be healthy
echo "⏳ Waiting for database to be healthy..."
until docker exec cs2i-db mysqladmin ping -h localhost --silent 2>/dev/null; do
    echo "   Database not ready yet, waiting..."
    sleep 5
done
echo "✅ Database is healthy"

# Wait for API to be ready
echo "⏳ Waiting for API to be ready..."
MAX_WAIT=300
WAITED=0
while [ $WAITED -lt $MAX_WAIT ]; do
    if docker exec cs2i-api ps aux | grep -q "node server.js"; then
        echo "✅ API is running"
        break
    fi

    if docker exec cs2i-api ps aux | grep -q "npm install"; then
        echo "   API is installing dependencies... ($WAITED seconds)"
    fi

    sleep 10
    WAITED=$((WAITED + 10))
done

if [ $WAITED -ge $MAX_WAIT ]; then
    echo "⚠️ API took too long to start, continuing anyway..."
fi

# Run migrations
echo "🔄 Running database migrations..."
docker exec cs2i-api npx sequelize-cli db:migrate

# Seed database if fresh start
if [ "$1" == "--fresh" ]; then
    echo "🌱 Seeding database..."
    docker exec cs2i-api npx sequelize-cli db:seed:all
fi

# Wait for admin to be ready
echo "⏳ Waiting for Admin panel to be ready..."
MAX_WAIT=300
WAITED=0
while [ $WAITED -lt $MAX_WAIT ]; do
    if docker exec cs2i-admin ps aux | grep -q "node server.js"; then
        echo "✅ Admin panel is running"
        break
    fi

    if docker exec cs2i-admin ps aux | grep -q "npm install"; then
        echo "   Admin is installing dependencies... ($WAITED seconds)"
    fi

    sleep 10
    WAITED=$((WAITED + 10))
done

# Wait for client to be ready
echo "⏳ Waiting for Client to be ready..."
MAX_WAIT=300
WAITED=0
while [ $WAITED -lt $MAX_WAIT ]; do
    if docker exec cs2i-client ps aux | grep -q "node server.js"; then
        echo "✅ Client is running"
        break
    fi

    if docker exec cs2i-client ps aux | grep -q "npm install"; then
        echo "   Client is installing dependencies... ($WAITED seconds)"
    fi

    sleep 10
    WAITED=$((WAITED + 10))
done

# Show status
echo ""
echo "========================================"
echo "🎉 CS2I Development Environment Ready!"
echo "========================================"
echo ""
docker compose -f $COMPOSE_FILE ps
echo ""
echo "📚 Services:"
echo "   API:    http://192.168.1.253:3000"
echo "   Admin:  http://192.168.1.253:3002"
echo "   Client: http://192.168.1.253:3001"
echo ""
echo "📝 Default Users:"
echo "   Admin:     admin@cs2i.org / password"
echo "   Counselor: counselor@cs2i.org / password"
echo "   Member:    member@cs2i.org / password"
echo ""
echo "💡 Tips:"
echo "   - Use --fresh flag to reset database: ./start-dev.sh --fresh"
echo "   - View logs: docker compose -f $COMPOSE_FILE logs -f [service]"
echo "   - Stop: docker compose -f $COMPOSE_FILE down"
