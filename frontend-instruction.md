# 🎨 FRONTEND DEVELOPMENT SPECIFICATION - CS2I Training Module (Next.js)

## 📋 Overview

This document provides comprehensive instructions for developing a **beautiful, modern, and highly interactive** frontend for the CS2I Training Management Module using **Next.js**. The UI must be **alive** with smooth animations, engaging transitions, and an exceptional user experience that feels premium and professional.

---

## 🎯 Design Principles

### Core Philosophy: "Alive & Engaging"

1. **Motion Design**: Every interaction has purposeful animation
2. **Smooth Transitions**: Page changes feel seamless and fluid
3. **Micro-interactions**: Buttons, cards, and elements respond to hover/click
4. **Progressive Disclosure**: Information reveals elegantly
5. **Feedback**: Every action has immediate visual feedback
6. **Delight**: Unexpected touches that make users smile

### Visual Identity

**Modern Professional with Warmth**:
- Clean, spacious layouts
- Vibrant but professional color palette
- Smooth gradients and subtle shadows
- Rounded corners for friendly feel
- High contrast for accessibility
- Consistent spacing system

---

## 🎨 Design System

### Color Palette

```javascript
// tailwind.config.js extensions
colors: {
  primary: {
    50: '#f0f9ff',
    100: '#e0f2fe',
    200: '#bae6fd',
    300: '#7dd3fc',
    400: '#38bdf8',
    500: '#0ea5e9', // Main primary
    600: '#0284c7',
    700: '#0369a1',
    800: '#075985',
    900: '#0c4a6e',
  },
  accent: {
    50: '#fdf4ff',
    100: '#fae8ff',
    200: '#f5d0fe',
    300: '#f0abfc',
    400: '#e879f9',
    500: '#d946ef', // Main accent
    600: '#c026d3',
    700: '#a21caf',
    800: '#86198f',
    900: '#701a75',
  },
  success: {
    500: '#10b981',
    600: '#059669',
  },
  warning: {
    500: '#f59e0b',
    600: '#d97706',
  },
  error: {
    500: '#ef4444',
    600: '#dc2626',
  },
  neutral: {
    50: '#fafafa',
    100: '#f5f5f5',
    200: '#e5e5e5',
    300: '#d4d4d4',
    400: '#a3a3a3',
    500: '#737373',
    600: '#525252',
    700: '#404040',
    800: '#262626',
    900: '#171717',
  }
}
```

### Typography Scale

```javascript
fontFamily: {
  sans: ['Inter', 'system-ui', 'sans-serif'],
  display: ['Cal Sans', 'Inter', 'sans-serif'], // For headings
  mono: ['Fira Code', 'monospace'],
},
fontSize: {
  'xs': ['0.75rem', { lineHeight: '1rem' }],
  'sm': ['0.875rem', { lineHeight: '1.25rem' }],
  'base': ['1rem', { lineHeight: '1.5rem' }],
  'lg': ['1.125rem', { lineHeight: '1.75rem' }],
  'xl': ['1.25rem', { lineHeight: '1.75rem' }],
  '2xl': ['1.5rem', { lineHeight: '2rem' }],
  '3xl': ['1.875rem', { lineHeight: '2.25rem' }],
  '4xl': ['2.25rem', { lineHeight: '2.5rem' }],
  '5xl': ['3rem', { lineHeight: '1' }],
  '6xl': ['3.75rem', { lineHeight: '1' }],
}
```

### Spacing System

```javascript
// Consistent spacing using Tailwind's default scale
// Use: 2, 4, 6, 8, 12, 16, 20, 24, 32, 40, 48, 64
// For component spacing, prefer: 4, 6, 8, 12, 16
```

### Shadow System

```javascript
boxShadow: {
  'soft': '0 2px 8px rgba(0, 0, 0, 0.04)',
  'card': '0 4px 16px rgba(0, 0, 0, 0.08)',
  'hover': '0 8px 24px rgba(0, 0, 0, 0.12)',
  'modal': '0 20px 60px rgba(0, 0, 0, 0.2)',
  'glow': '0 0 20px rgba(14, 165, 233, 0.3)',
  'glow-accent': '0 0 20px rgba(217, 70, 239, 0.3)',
}
```

---

## 🎬 Animation Library

### Required Dependencies

```json
{
  "dependencies": {
    "framer-motion": "^10.16.0",
    "react-spring": "^9.7.3",
    "react-intersection-observer": "^9.5.2",
    "lottie-react": "^2.4.0",
    "@react-spring/parallax": "^9.7.3"
  }
}
```

### Standard Animation Variants

Create file: `/lib/animations.js`

```javascript
// Page transitions
export const pageTransition = {
  initial: { opacity: 0, y: 20 },
  animate: { opacity: 1, y: 0 },
  exit: { opacity: 0, y: -20 },
  transition: { duration: 0.3, ease: 'easeInOut' }
};

// Card entrance
export const cardVariants = {
  hidden: { opacity: 0, y: 20, scale: 0.95 },
  visible: { 
    opacity: 1, 
    y: 0, 
    scale: 1,
    transition: { duration: 0.4, ease: 'easeOut' }
  },
  hover: { 
    y: -8, 
    scale: 1.02,
    boxShadow: '0 20px 40px rgba(0,0,0,0.15)',
    transition: { duration: 0.2 }
  },
  tap: { scale: 0.98 }
};

// Stagger children
export const containerVariants = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: {
      staggerChildren: 0.1,
      delayChildren: 0.2
    }
  }
};

// Slide from side
export const slideIn = (direction = 'left') => ({
  hidden: { 
    x: direction === 'left' ? -100 : 100, 
    opacity: 0 
  },
  visible: { 
    x: 0, 
    opacity: 1,
    transition: { duration: 0.5, ease: 'easeOut' }
  }
});

// Scale in
export const scaleIn = {
  hidden: { scale: 0.8, opacity: 0 },
  visible: { 
    scale: 1, 
    opacity: 1,
    transition: { duration: 0.4, ease: 'easeOut' }
  }
};

// Fade in up
export const fadeInUp = {
  hidden: { opacity: 0, y: 30 },
  visible: { 
    opacity: 1, 
    y: 0,
    transition: { duration: 0.5, ease: 'easeOut' }
  }
};

// Button press
export const buttonVariants = {
  rest: { scale: 1 },
  hover: { 
    scale: 1.05,
    transition: { duration: 0.2 }
  },
  press: { scale: 0.95 }
};

// Shimmer effect (loading)
export const shimmer = {
  hidden: { x: '-100%' },
  visible: {
    x: '100%',
    transition: {
      repeat: Infinity,
      duration: 1.5,
      ease: 'linear'
    }
  }
};

// Pulse (notification badge)
export const pulse = {
  scale: [1, 1.1, 1],
  opacity: [1, 0.8, 1],
  transition: {
    repeat: Infinity,
    duration: 2,
    ease: 'easeInOut'
  }
};

// Modal backdrop
export const backdropVariants = {
  hidden: { opacity: 0 },
  visible: { opacity: 1 }
};

// Modal content
export const modalVariants = {
  hidden: { 
    opacity: 0, 
    scale: 0.9, 
    y: 50 
  },
  visible: { 
    opacity: 1, 
    scale: 1, 
    y: 0,
    transition: { 
      duration: 0.3,
      ease: [0.4, 0, 0.2, 1]
    }
  },
  exit: { 
    opacity: 0, 
    scale: 0.9, 
    y: 50,
    transition: { duration: 0.2 }
  }
};
```


## 🎨 COMPONENT SPECIFICATIONS

### 🏢 MODULE 1: ROOMS (Salles)

#### Component: RoomCard

**Purpose**: Display room information with beautiful hover effects

**File**: `/components/rooms/RoomCard.jsx`

**Design**:
```
┌─────────────────────────────────────┐
│  [Image/Icon]                       │
│                                     │
│  Room Name                    [🔵] │ <- Status badge
│  Building • Floor • Room #          │
│                                     │
│  👥 Capacity: 20 people             │
│  📍 City, Location                  │
│                                     │
│  [Equipment badges]                 │
│  Projector WiFi Whiteboard          │
│                                     │
│  ───────────────────────────────── │
│  [View Calendar] [Book Now →]      │
└─────────────────────────────────────┘

Hover: Lift up + glow + show availability preview
```

**Implementation**:
```jsx
import { motion } from 'framer-motion';
import { cardVariants } from '@/lib/animations';

export default function RoomCard({ room, onBook, onViewCalendar }) {
  return (
    <motion.div
      variants={cardVariants}
      initial="hidden"
      whileInView="visible"
      whileHover="hover"
      whileTap="tap"
      viewport={{ once: true }}
      className="bg-white rounded-2xl shadow-card overflow-hidden cursor-pointer"
    >
      {/* Room Image/Icon */}
      <div className="relative h-48 bg-gradient-to-br from-primary-400 to-primary-600 overflow-hidden">
        <motion.div
          className="absolute inset-0"
          whileHover={{ scale: 1.1 }}
          transition={{ duration: 0.4 }}
        >
          {room.imageUrl ? (
            <img 
              src={room.imageUrl} 
              alt={room.name}
              className="w-full h-full object-cover"
            />
          ) : (
            <div className="w-full h-full flex items-center justify-center">
              <Building2 className="w-20 h-20 text-white/30" />
            </div>
          )}
        </motion.div>
        
        {/* Status Badge */}
        <div className="absolute top-4 right-4">
          <StatusBadge status={room.status} />
        </div>

        {/* Capacity Badge */}
        <div className="absolute bottom-4 left-4 bg-white/90 backdrop-blur-sm px-3 py-1.5 rounded-full flex items-center gap-2">
          <Users className="w-4 h-4 text-primary-600" />
          <span className="text-sm font-medium">{room.capacity} people</span>
        </div>
      </div>

      {/* Content */}
      <div className="p-6">
        <h3 className="text-xl font-bold text-neutral-900 mb-2">
          {room.name}
        </h3>
        
        <div className="flex items-center text-neutral-600 text-sm mb-4">
          <MapPin className="w-4 h-4 mr-1" />
          <span>{room.location.building} • Floor {room.location.floor} • Room {room.location.roomNumber}</span>
        </div>

        {/* Equipment */}
        <div className="flex flex-wrap gap-2 mb-4">
          {room.equipment.map((item) => (
            <motion.span
              key={item}
              whileHover={{ scale: 1.05 }}
              className="px-3 py-1 bg-primary-50 text-primary-700 rounded-full text-xs font-medium"
            >
              {item}
            </motion.span>
          ))}
        </div>

        {/* Availability Preview */}
        <motion.div 
          initial={{ opacity: 0, height: 0 }}
          whileHover={{ opacity: 1, height: 'auto' }}
          className="mb-4 text-sm text-neutral-600"
        >
          <div className="flex items-center gap-2">
            <Clock className="w-4 h-4" />
            <span>Next available: {room.nextAvailable || 'Loading...'}</span>
          </div>
        </motion.div>

        {/* Actions */}
        <div className="flex gap-3">
          <motion.button
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.98 }}
            onClick={onViewCalendar}
            className="flex-1 px-4 py-2.5 border-2 border-primary-200 text-primary-700 rounded-xl font-medium hover:bg-primary-50 transition-colors"
          >
            View Calendar
          </motion.button>
          <motion.button
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.98 }}
            onClick={onBook}
            className="flex-1 px-4 py-2.5 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-xl font-medium hover:shadow-glow transition-shadow"
          >
            Book Now →
          </motion.button>
        </div>
      </div>
    </motion.div>
  );
}
```

#### Component: RoomCalendar

**Purpose**: Interactive calendar showing room availability

**Design**: Full calendar view with:
- Month/week/day views
- Available slots in green
- Booked slots in red
- Hover shows booking details
- Click to book

**Implementation**: Use `react-big-calendar` with custom styling

```jsx
import { Calendar, momentLocalizer } from 'react-big-calendar';
import moment from 'moment';
import { motion } from 'framer-motion';

const localizer = momentLocalizer(moment);

export default function RoomCalendar({ room, bookings, onSelectSlot }) {
  // Custom event styling
  const eventStyleGetter = (event) => {
    const style = {
      backgroundColor: event.type === 'available' ? '#10b981' : '#ef4444',
      borderRadius: '8px',
      border: 'none',
      display: 'block',
    };
    return { style };
  };

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      className="bg-white rounded-2xl shadow-card p-6"
    >
      <div className="mb-6">
        <h2 className="text-2xl font-bold text-neutral-900 mb-2">
          {room.name} Calendar
        </h2>
        <p className="text-neutral-600">
          Click on available slots to book
        </p>
      </div>

      <Calendar
        localizer={localizer}
        events={bookings}
        startAccessor="start"
        endAccessor="end"
        style={{ height: 600 }}
        eventPropGetter={eventStyleGetter}
        onSelectSlot={onSelectSlot}
        selectable
        className="custom-calendar"
      />
    </motion.div>
  );
}
```

**CSS** (`globals.css`):
```css
.custom-calendar {
  @apply rounded-xl overflow-hidden;
}

.rbc-calendar {
  @apply font-sans;
}

.rbc-header {
  @apply bg-primary-50 border-primary-200 py-3 font-semibold text-primary-900;
}

.rbc-today {
  @apply bg-primary-50;
}

.rbc-event {
  @apply shadow-sm;
  transition: transform 0.2s, box-shadow 0.2s;
}

.rbc-event:hover {
  @apply shadow-md;
  transform: scale(1.02);
}
```

#### Component: RoomBookingModal

**Purpose**: Modal for booking a room

**Design**: Beautiful modal with:
- Room details summary
- Date/time picker
- Duration selector
- Purpose textarea
- Conflict detection
- Confirmation animation

```jsx
import { motion, AnimatePresence } from 'framer-motion';
import { modalVariants, backdropVariants } from '@/lib/animations';
import { useState } from 'react';
import Lottie from 'lottie-react';
import successAnimation from '@/public/animations/success.json';

export default function RoomBookingModal({ room, isOpen, onClose, onConfirm }) {
  const [step, setStep] = useState('form'); // 'form' | 'confirming' | 'success'
  const [formData, setFormData] = useState({
    date: '',
    startTime: '',
    endTime: '',
    purpose: ''
  });

  const handleSubmit = async () => {
    setStep('confirming');
    
    try {
      await onConfirm(formData);
      setStep('success');
      
      // Auto-close after success animation
      setTimeout(() => {
        onClose();
        setStep('form');
      }, 2500);
    } catch (error) {
      setStep('form');
      // Show error toast
    }
  };

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          {/* Backdrop */}
          <motion.div
            variants={backdropVariants}
            initial="hidden"
            animate="visible"
            exit="hidden"
            className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50"
            onClick={onClose}
          />

          {/* Modal */}
          <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
            <motion.div
              variants={modalVariants}
              initial="hidden"
              animate="visible"
              exit="exit"
              className="bg-white rounded-3xl shadow-modal max-w-2xl w-full max-h-[90vh] overflow-hidden"
              onClick={(e) => e.stopPropagation()}
            >
              {step === 'form' && (
                <div className="p-8">
                  {/* Header */}
                  <div className="flex items-start justify-between mb-6">
                    <div>
                      <h2 className="text-3xl font-bold text-neutral-900 mb-2">
                        Book {room.name}
                      </h2>
                      <p className="text-neutral-600">
                        Complete the form to reserve this room
                      </p>
                    </div>
                    <button
                      onClick={onClose}
                      className="p-2 hover:bg-neutral-100 rounded-full transition-colors"
                    >
                      <X className="w-6 h-6" />
                    </button>
                  </div>

                  {/* Form */}
                  <div className="space-y-6">
                    {/* Date Picker */}
                    <div>
                      <label className="block text-sm font-medium text-neutral-700 mb-2">
                        Date
                      </label>
                      <input
                        type="date"
                        value={formData.date}
                        onChange={(e) => setFormData({...formData, date: e.target.value})}
                        min={new Date().toISOString().split('T')[0]}
                        className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                      />
                    </div>

                    {/* Time Pickers */}
                    <div className="grid grid-cols-2 gap-4">
                      <div>
                        <label className="block text-sm font-medium text-neutral-700 mb-2">
                          Start Time
                        </label>
                        <input
                          type="time"
                          value={formData.startTime}
                          onChange={(e) => setFormData({...formData, startTime: e.target.value})}
                          className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                        />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-neutral-700 mb-2">
                          End Time
                        </label>
                        <input
                          type="time"
                          value={formData.endTime}
                          onChange={(e) => setFormData({...formData, endTime: e.target.value})}
                          className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                        />
                      </div>
                    </div>

                    {/* Purpose */}
                    <div>
                      <label className="block text-sm font-medium text-neutral-700 mb-2">
                        Purpose
                      </label>
                      <textarea
                        value={formData.purpose}
                        onChange={(e) => setFormData({...formData, purpose: e.target.value})}
                        rows={4}
                        placeholder="Describe the purpose of this booking..."
                        className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all resize-none"
                      />
                    </div>

                    {/* Availability Check */}
                    <motion.div
                      initial={{ opacity: 0, height: 0 }}
                      animate={{ opacity: 1, height: 'auto' }}
                      className="bg-green-50 border-2 border-green-200 rounded-xl p-4 flex items-center gap-3"
                    >
                      <CheckCircle className="w-6 h-6 text-green-600 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-green-900">Room is available</p>
                        <p className="text-sm text-green-700">No conflicts detected for this time slot</p>
                      </div>
                    </motion.div>
                  </div>

                  {/* Actions */}
                  <div className="flex gap-4 mt-8">
                    <motion.button
                      whileHover={{ scale: 1.02 }}
                      whileTap={{ scale: 0.98 }}
                      onClick={onClose}
                      className="flex-1 px-6 py-3 border-2 border-neutral-200 text-neutral-700 rounded-xl font-medium hover:bg-neutral-50 transition-colors"
                    >
                      Cancel
                    </motion.button>
                    <motion.button
                      whileHover={{ scale: 1.02 }}
                      whileTap={{ scale: 0.98 }}
                      onClick={handleSubmit}
                      className="flex-1 px-6 py-3 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-xl font-medium hover:shadow-glow transition-shadow"
                    >
                      Confirm Booking
                    </motion.button>
                  </div>
                </div>
              )}

              {step === 'confirming' && (
                <div className="p-8 flex flex-col items-center justify-center h-96">
                  <motion.div
                    animate={{ rotate: 360 }}
                    transition={{ duration: 1, repeat: Infinity, ease: 'linear' }}
                  >
                    <Loader className="w-16 h-16 text-primary-500" />
                  </motion.div>
                  <p className="mt-6 text-lg font-medium text-neutral-700">
                    Processing your booking...
                  </p>
                </div>
              )}

              {step === 'success' && (
                <div className="p-8 flex flex-col items-center justify-center h-96">
                  ```jsx
                  <Lottie 
                    animationData={successAnimation} 
                    loop={false}
                    style={{ width: 200, height: 200 }}
                  />
                  <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ delay: 0.5 }}
                    className="text-center"
                  >
                    <h3 className="text-2xl font-bold text-neutral-900 mb-2">
                      Booking Confirmed! 🎉
                    </h3>
                    <p className="text-neutral-600">
                      You'll receive a confirmation email shortly
                    </p>
                  </motion.div>
                </div>
              )}
            </motion.div>
          </div>
        </>
      )}
    </AnimatePresence>
  );
}
```

---

### 📚 MODULE 2: LESSONS (Leçons)

#### Component: LessonCard

**Purpose**: Beautiful card displaying lesson with animations

**Design**:
```
┌─────────────────────────────────────┐
│  [Category Badge]      [Type Badge] │
│                                     │
│  ╔═══════════════════════════════╗ │
│  ║   Lesson Image/Thumbnail      ║ │
│  ║   with gradient overlay       ║ │
│  ║                               ║ │
│  ║   [Duration] [Level]          ║ │
│  ╚═══════════════════════════════╝ │
│                                     │
│  Lesson Title (Bold, 2 lines max)   │
│  Short description...               │
│                                     │
│  👤 Trainer Name                    │
│  📅 Next session: Tomorrow 14h      │
│                                     │
│  ─────────────────────────────────  │
│  €150  €120 (member)   [Enroll →]  │
└─────────────────────────────────────┘

Hover: Lift, glow, show preview button
```

**Implementation**:
```jsx
import { motion } from 'framer-motion';
import { cardVariants } from '@/lib/animations';
import { BookOpen, Video, Users, Calendar, Clock } from 'lucide-react';

export default function LessonCard({ lesson, onEnroll, onPreview }) {
  const getTypeIcon = (type) => {
    switch(type) {
      case 'lesson': return BookOpen;
      case 'activity': return Users;
      case 'workshop': return Video;
      default: return BookOpen;
    }
  };

  const getDeliveryModeBadge = (mode) => {
    const badges = {
      online_on_demand: { text: 'On Demand', color: 'bg-blue-100 text-blue-700' },
      in_person: { text: 'In Person', color: 'bg-green-100 text-green-700' },
      remote: { text: 'Remote', color: 'bg-purple-100 text-purple-700' },
      hybrid: { text: 'Hybrid', color: 'bg-orange-100 text-orange-700' }
    };
    return badges[mode] || badges.online_on_demand;
  };

  const TypeIcon = getTypeIcon(lesson.lesson_type);
  const deliveryBadge = getDeliveryModeBadge(lesson.delivery_mode);

  return (
    <motion.div
      variants={cardVariants}
      initial="hidden"
      whileInView="visible"
      whileHover="hover"
      whileTap="tap"
      viewport={{ once: true, margin: '-50px' }}
      className="bg-white rounded-2xl shadow-card overflow-hidden group cursor-pointer"
    >
      {/* Header Badges */}
      <div className="p-4 flex items-center justify-between">
        <motion.span
          whileHover={{ scale: 1.05 }}
          className="px-3 py-1.5 bg-primary-50 text-primary-700 rounded-full text-xs font-semibold flex items-center gap-1.5"
        >
          <span className="w-2 h-2 rounded-full bg-primary-500" />
          {lesson.category_name}
        </motion.span>

        <motion.span
          whileHover={{ scale: 1.05 }}
          className={`px-3 py-1.5 rounded-full text-xs font-semibold flex items-center gap-1.5 ${deliveryBadge.color}`}
        >
          <TypeIcon className="w-3 h-3" />
          {deliveryBadge.text}
        </motion.span>
      </div>

      {/* Image/Thumbnail */}
      <div className="relative h-48 overflow-hidden">
        <motion.div
          whileHover={{ scale: 1.1 }}
          transition={{ duration: 0.6 }}
          className="w-full h-full"
        >
          <img
            src={lesson.thumbnail || '/images/lesson-placeholder.jpg'}
            alt={lesson.title}
            className="w-full h-full object-cover"
          />
          <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent" />
        </motion.div>

        {/* Preview Button (shows on hover) */}
        <motion.button
          initial={{ opacity: 0, y: 20 }}
          whileHover={{ opacity: 1, y: 0 }}
          className="absolute inset-0 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity"
          onClick={(e) => {
            e.stopPropagation();
            onPreview(lesson);
          }}
        >
          <motion.div
            whileHover={{ scale: 1.1 }}
            whileTap={{ scale: 0.9 }}
            className="bg-white/90 backdrop-blur-sm rounded-full p-4 shadow-xl"
          >
            <Video className="w-8 h-8 text-primary-600" />
          </motion.div>
        </motion.button>

        {/* Info Badges */}
        <div className="absolute bottom-4 left-4 flex gap-2">
          <motion.div
            whileHover={{ scale: 1.05 }}
            className="bg-white/90 backdrop-blur-sm px-3 py-1.5 rounded-full flex items-center gap-1.5"
          >
            <Clock className="w-3.5 h-3.5 text-primary-600" />
            <span className="text-xs font-medium">{lesson.duration_minutes} min</span>
          </motion.div>

          <motion.div
            whileHover={{ scale: 1.05 }}
            className="bg-white/90 backdrop-blur-sm px-3 py-1.5 rounded-full text-xs font-medium"
          >
            {lesson.level}
          </motion.div>
        </div>
      </div>

      {/* Content */}
      <div className="p-6">
        <h3 className="text-xl font-bold text-neutral-900 mb-2 line-clamp-2 group-hover:text-primary-600 transition-colors">
          {lesson.title}
        </h3>

        <p className="text-neutral-600 text-sm mb-4 line-clamp-2">
          {lesson.short_description}
        </p>

        {/* Trainer */}
        <div className="flex items-center gap-3 mb-3">
          <div className="w-8 h-8 rounded-full bg-gradient-to-br from-primary-400 to-primary-600 flex items-center justify-center">
            <span className="text-white text-xs font-bold">
              {lesson.trainer_name?.charAt(0) || 'T'}
            </span>
          </div>
          <span className="text-sm text-neutral-700 font-medium">
            {lesson.trainer_name || 'CS2I Team'}
          </span>
        </div>

        {/* Next Session (if applicable) */}
        {lesson.next_session && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: 'auto' }}
            className="flex items-center gap-2 text-sm text-neutral-600 mb-4"
          >
            <Calendar className="w-4 h-4 text-primary-500" />
            <span>Next session: {lesson.next_session}</span>
          </motion.div>
        )}

        {/* Footer */}
        <div className="flex items-center justify-between pt-4 border-t border-neutral-100">
          {/* Pricing */}
          <div className="flex items-baseline gap-2">
            {lesson.is_free ? (
              <span className="text-2xl font-bold text-green-600">FREE</span>
            ) : (
              <>
                {lesson.member_price && lesson.member_price < lesson.price && (
                  <span className="text-sm text-neutral-400 line-through">
                    €{lesson.price}
                  </span>
                )}
                <span className="text-2xl font-bold text-neutral-900">
                  €{lesson.member_price || lesson.price}
                </span>
                {lesson.member_price && (
                  <span className="text-xs text-green-600 font-medium">
                    member
                  </span>
                )}
              </>
            )}
          </div>

          {/* Enroll Button */}
          <motion.button
            whileHover={{ scale: 1.05, x: 5 }}
            whileTap={{ scale: 0.95 }}
            onClick={(e) => {
              e.stopPropagation();
              onEnroll(lesson);
            }}
            className="px-4 py-2 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-xl font-medium flex items-center gap-2 hover:shadow-glow transition-shadow"
          >
            Enroll
            <ArrowRight className="w-4 h-4" />
          </motion.button>
        </div>
      </div>
    </motion.div>
  );
}
```

#### Component: LessonCreationWizard

**Purpose**: Multi-step wizard for creating lessons with beautiful transitions

**Design**: 5-step wizard with progress indicator

**Steps**:
1. **Type Selection** - Choose lesson/activity/workshop
2. **Basic Info** - Title, description, category
3. **Delivery Mode** - Online/In-person/Remote/Hybrid
4. **Content** - Slides/Video/Template upload
5. **Review & Publish**

**Implementation**:
```jsx
import { motion, AnimatePresence } from 'framer-motion';
import { useState } from 'react';
import { slideIn } from '@/lib/animations';

const steps = [
  { id: 1, name: 'Type', description: 'Choose lesson type' },
  { id: 2, name: 'Info', description: 'Basic information' },
  { id: 3, name: 'Delivery', description: 'How it will be delivered' },
  { id: 4, name: 'Content', description: 'Add your content' },
  { id: 5, name: 'Review', description: 'Review and publish' }
];

export default function LessonCreationWizard({ onComplete, onCancel }) {
  const [currentStep, setCurrentStep] = useState(1);
  const [formData, setFormData] = useState({
    lesson_type: '',
    title: '',
    description: '',
    category_id: '',
    delivery_mode: '',
    online_mode: '',
    // ... other fields
  });

  const nextStep = () => {
    if (currentStep < steps.length) {
      setCurrentStep(currentStep + 1);
    }
  };

  const prevStep = () => {
    if (currentStep > 1) {
      setCurrentStep(currentStep - 1);
    }
  };

  return (
    <div className="max-w-4xl mx-auto">
      {/* Progress Indicator */}
      <div className="mb-12">
        <div className="flex items-center justify-between">
          {steps.map((step, index) => (
            <div key={step.id} className="flex items-center flex-1">
              {/* Step Circle */}
              <div className="relative">
                <motion.div
                  initial={false}
                  animate={{
                    scale: currentStep === step.id ? 1.2 : 1,
                    backgroundColor: currentStep >= step.id ? '#0ea5e9' : '#e5e5e5'
                  }}
                  className="w-12 h-12 rounded-full flex items-center justify-center relative z-10"
                >
                  {currentStep > step.id ? (
                    <motion.div
                      initial={{ scale: 0 }}
                      animate={{ scale: 1 }}
                      transition={{ type: 'spring', stiffness: 500, damping: 30 }}
                    >
                      <CheckCircle className="w-6 h-6 text-white" />
                    </motion.div>
                  ) : (
                    <span className={`font-bold ${currentStep >= step.id ? 'text-white' : 'text-neutral-400'}`}>
                      {step.id}
                    </span>
                  )}
                </motion.div>

                {/* Step Label */}
                <div className="absolute top-14 left-1/2 -translate-x-1/2 whitespace-nowrap text-center">
                  <p className={`font-semibold ${currentStep >= step.id ? 'text-primary-600' : 'text-neutral-400'}`}>
                    {step.name}
                  </p>
                  <p className="text-xs text-neutral-500 mt-1">
                    {step.description}
                  </p>
                </div>
              </div>

              {/* Connector Line */}
              {index < steps.length - 1 && (
                <div className="flex-1 h-1 mx-4 bg-neutral-200 relative overflow-hidden">
                  <motion.div
                    initial={{ width: '0%' }}
                    animate={{ 
                      width: currentStep > step.id ? '100%' : '0%' 
                    }}
                    transition={{ duration: 0.5 }}
                    className="absolute inset-0 bg-primary-500"
                  />
                </div>
              )}
            </div>
          ))}
        </div>
      </div>

      {/* Step Content */}
      <AnimatePresence mode="wait">
        <motion.div
          key={currentStep}
          initial={{ opacity: 0, x: 20 }}
          animate={{ opacity: 1, x: 0 }}
          exit={{ opacity: 0, x: -20 }}
          transition={{ duration: 0.3 }}
          className="bg-white rounded-2xl shadow-card p-8 min-h-[500px]"
        >
          {/* Step 1: Type Selection */}
          {currentStep === 1 && (
            <div>
              <h2 className="text-3xl font-bold text-neutral-900 mb-3">
                What type of content are you creating?
              </h2>
              <p className="text-neutral-600 mb-8">
                Select the type that best describes your content
              </p>

              <div className="grid grid-cols-3 gap-6">
                {[
                  {
                    value: 'lesson',
                    icon: BookOpen,
                    title: 'Lesson',
                    description: 'Traditional course with slides or video',
                    color: 'from-blue-400 to-blue-600'
                  },
                  {
                    value: 'activity',
                    icon: Users,
                    title: 'Activity',
                    description: 'Interactive group activity or field trip',
                    color: 'from-green-400 to-green-600'
                  },
                  {
                    value: 'workshop',
                    icon: Video,
                    title: 'Workshop',
                    description: 'Hands-on practical workshop',
                    color: 'from-purple-400 to-purple-600'
                  }
                ].map((type) => {
                  const Icon = type.icon;
                  const isSelected = formData.lesson_type === type.value;

                  return (
                    <motion.button
                      key={type.value}
                      whileHover={{ scale: 1.05, y: -5 }}
                      whileTap={{ scale: 0.95 }}
                      onClick={() => setFormData({ ...formData, lesson_type: type.value })}
                      className={`relative p-6 rounded-2xl border-2 transition-all ${
                        isSelected
                          ? 'border-primary-500 bg-primary-50 shadow-lg'
                          : 'border-neutral-200 hover:border-primary-200'
                      }`}
                    >
                      {/* Selected Indicator */}
                      {isSelected && (
                        <motion.div
                          initial={{ scale: 0 }}
                          animate={{ scale: 1 }}
                          className="absolute top-4 right-4 w-6 h-6 bg-primary-500 rounded-full flex items-center justify-center"
                        >
                          <Check className="w-4 h-4 text-white" />
                        </motion.div>
                      )}

                      {/* Icon */}
                      <div className={`w-16 h-16 rounded-2xl bg-gradient-to-br ${type.color} flex items-center justify-center mb-4 mx-auto`}>
                        <Icon className="w-8 h-8 text-white" />
                      </div>

                      {/* Content */}
                      <h3 className="text-xl font-bold text-neutral-900 mb-2">
                        {type.title}
                      </h3>
                      <p className="text-sm text-neutral-600">
                        {type.description}
                      </p>
                    </motion.button>
                  );
                })}
              </div>
            </div>
          )}

          {/* Step 2: Basic Info */}
          {currentStep === 2 && (
            <div>
              <h2 className="text-3xl font-bold text-neutral-900 mb-3">
                Tell us about your {formData.lesson_type}
              </h2>
              <p className="text-neutral-600 mb-8">
                Provide the essential information
              </p>

              <div className="space-y-6">
                {/* Title */}
                <div>
                  <label className="block text-sm font-semibold text-neutral-700 mb-2">
                    Title <span className="text-red-500">*</span>
                  </label>
                  <input
                    type="text"
                    value={formData.title}
                    onChange={(e) => setFormData({ ...formData, title: e.target.value })}
                    placeholder="e.g., Introduction to French Language"
                    className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all text-lg"
                  />
                </div>

                {/* Category */}
                <div>
                  <label className="block text-sm font-semibold text-neutral-700 mb-2">
                    Category <span className="text-red-500">*</span>
                  </label>
                  <CategorySelector
                    value={formData.category_id}
                    onChange={(id) => setFormData({ ...formData, category_id: id })}
                  />
                </div>

                {/* Short Description */}
                <div>
                  <label className="block text-sm font-semibold text-neutral-700 mb-2">
                    Short Description <span className="text-red-500">*</span>
                  </label>
                  <textarea
                    value={formData.short_description}
                    onChange={(e) => setFormData({ ...formData, short_description: e.target.value })}
                    placeholder="A brief overview that will appear on the card..."
                    maxLength={200}
                    rows={3}
                    className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all resize-none"
                  />
                  <div className="text-right text-sm text-neutral-500 mt-1">
                    {formData.short_description?.length || 0}/200
                  </div>
                </div>

                {/* Full Description */}
                <div>
                  <label className="block text-sm font-semibold text-neutral-700 mb-2">
                    Full Description <span className="text-red-500">*</span>
                  </label>
                  <RichTextEditor
                    value={formData.description}
                    onChange={(content) => setFormData({ ...formData, description: content })}
                    placeholder="Provide a detailed description of the lesson, what students will learn, prerequisites, etc."
                  />
                </div>

                {/* Level & Duration */}
                <div className="grid grid-cols-2 gap-6">
                  <div>
                    <label className="block text-sm font-semibold text-neutral-700 mb-2">
                      Level <span className="text-red-500">*</span>
                    </label>
                    <select
                      value={formData.level}
                      onChange={(e) => setFormData({ ...formData, level: e.target.value })}
                      className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                    >
                      <option value="">Select level...</option>
                      <option value="beginner">Beginner</option>
                      <option value="intermediate">Intermediate</option>
                      <option value="advanced">Advanced</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-sm font-semibold text-neutral-700 mb-2">
                      Estimated Duration (minutes)
                    </label>
                    <input
                      type="number"
                      value={formData.duration_minutes}
                      onChange={(e) => setFormData({ ...formData, duration_minutes: e.target.value })}
                      placeholder="e.g., 90"
                      min="15"
                      step="15"
                      className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                    />
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* Step 3: Delivery Mode */}
          {currentStep === 3 && (
            <DeliveryModeSelector
              lessonType={formData.lesson_type}
              selectedMode={formData.delivery_mode}
              selectedOnlineMode={formData.online_mode}
              onChange={(mode, onlineMode) => setFormData({ 
                ...formData, 
                delivery_mode: mode,
                online_mode: onlineMode 
              })}
            />
          )}

          {/* Step 4: Content */}
          {currentStep === 4 && (
            <ContentUploader
              deliveryMode={formData.delivery_mode}
              onlineMode={formData.online_mode}
              formData={formData}
              setFormData={setFormData}
            />
          )}

          {/* Step 5: Review */}
          {currentStep === 5 && (
            <LessonReview
              formData={formData}
              onPublish={() => onComplete(formData)}
            />
          )}
        </motion.div>
      </AnimatePresence>

      {/* Navigation */}
      <div className="flex items-center justify-between mt-8">
        <motion.button
          whileHover={{ scale: 1.02, x: -5 }}
          whileTap={{ scale: 0.98 }}
          onClick={prevStep}
          disabled={currentStep === 1}
          className="px-6 py-3 border-2 border-neutral-200 text-neutral-700 rounded-xl font-medium hover:bg-neutral-50 transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
        >
          <ArrowLeft className="w-4 h-4" />
          Previous
        </motion.button>

        <motion.button
          whileHover={{ scale: 1.02, x: 5 }}
          whileTap={{ scale: 0.98 }}
          onClick={nextStep}
          disabled={currentStep === steps.length}
          className="px-6 py-3 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-xl font-medium hover:shadow-glow transition-shadow disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
        >
          {currentStep === steps.length ? 'Complete' : 'Next'}
          <ArrowRight className="w-4 h-4" />
        </motion.button>
      </div>
    </div>
  );
}
```

#### Component: SlideEditor

**Purpose**: Interactive slide editor for slider-mode lessons

**Design**: Drag-and-drop slide creator with live preview

```jsx
import { motion, Reorder } from 'framer-motion';
import { useState } from 'react';
import { GripVertical, Plus, Trash2, Eye } from 'lucide-react';

export default function SlideEditor({ slides, onChange }) {
  const [selectedSlide, setSelectedSlide] = useState(0);
  const [previewMode, setPreviewMode] = useState(false);

  const addSlide = () => {
    onChange([...slides, {
      id: Date.now().toString(),
      title: '',
      content: '',
      duration_seconds: 60,
      image_url: null,
      has_quiz: false
    }]);
  };

  const updateSlide = (index, updates) => {
    const newSlides = [...slides];
    newSlides[index] = { ...newSlides[index], ...updates };
    onChange(newSlides);
  };

  const deleteSlide = (index) => {
    onChange(slides.filter((_, i) => i !== index));
    if (selectedSlide >= slides.length - 1) {
      setSelectedSlide(Math.max(0, slides.length - 2));
    }
  };

  return (
    <div className="grid grid-cols-12 gap-6 h-[600px]">
      {/* Slide List */}
      <div className="col-span-3 bg-neutral-50 rounded-2xl p-4 overflow-y-auto">
        <div className="flex items-center justify-between mb-4">
          <h3 className="font-semibold text-neutral-900">Slides</h3>
          <motion.button
            whileHover={{ scale: 1.1, rotate: 90 }}
            whileTap={{ scale: 0.9 }}
            onClick={addSlide}
            className="w-8 h-8 bg-primary-500 text-white rounded-lg flex items-center justify-center hover:bg-primary-600 transition-colors"
          >
            <Plus className="w-5 h-5" />
          </motion.button>
        </div>

        <Reorder.Group
          axis="y"
          values={slides}
          onReorder={onChange}
          className="space-y-2"
        >
          {slides.map((slide, index) => (
            <Reorder.Item
              key={slide.id}
              value={slide}
              className="group"
            >
              <motion.button
                whileHover={{ scale: 1.02, x: 4 }}
                onClick={() => setSelectedSlide(index)}
                className={`w-full p-3 rounded-xl text-left transition-all flex items-center gap-3 ${
                  selectedSlide === index
                    ? 'bg-white shadow-md ring-2 ring-primary-500'
                    : 'bg-white/50 hover:bg-white hover:shadow'
                }`}
              >
                <GripVertical className="w-4 h-4 text-neutral-400 flex-shrink-0 cursor-grab active:cursor-grabbing" />
                
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2 mb-1">
                    <span className="text-xs font-semibold text-primary-600">
                      Slide {index + 1}
                    </span>
                    {slide.has_quiz && (
                      <span className="text-xs bg-accent-100 text-accent-700 px-2 py-0.5 rounded-full">
                        Quiz
                      </span>
                    )}
                  </div>
                  <p className="text-sm font-medium text-neutral-900 truncate">
                    {slide.title || 'Untitled Slide'}
                  </p>
                </div>

                <motion.button
                  whileHover={{ scale: 1.2 }}
                  whileTap={{ scale: 0.8 }}
                  onClick={(e) => {
                    e.stopPropagation();
                    deleteSlide(index);
                  }}
                  className="opacity-0 group-hover:opacity-100 p-1.5 hover:bg-red-50 rounded-lg transition-all"
                >
                  <Trash2 className="w-4 h-4 text-red-500" />
                </motion.button>
              </motion.button>
            </Reorder.Item>
          ))}
        </Reorder.Group>
      </div>

      {/* Slide Editor */}
      <div className="col-span-9 bg-white rounded-2xl p-6 overflow-y-auto">
        {slides.length === 0 ? (
          <div className="h-full flex flex-col items-center justify-center text-center">
            <motion.div
              initial={{ scale: 0 }}
              animate={{ scale: 1 }}
              transition={{ type: 'spring', stiffness: 200 }}
            >
              <FileText className="w-20 h-20 text-neutral-300 mb-4 mx-auto" />
            </motion.div>
            <h3 className="text-xl font-semibold text-neutral-900 mb-2">
              No slides yet
            </h3>
            <p className="text-neutral-600 mb-6">
              Create your first slide to get started
            </p>
            <motion.button
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
              onClick={addSlide}
              className="px-6 py-3 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-xl font-medium flex items-center gap-2"
            >
              ```jsx
              <Plus className="w-5 h-5" />
              Create First Slide
            </motion.button>
          </div>
        ) : (
          <div>
            {/* Editor Header */}
            <div className="flex items-center justify-between mb-6">
              <div>
                <h3 className="text-2xl font-bold text-neutral-900">
                  Slide {selectedSlide + 1}
                </h3>
                <p className="text-sm text-neutral-600">
                  Edit your slide content below
                </p>
              </div>

              <motion.button
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
                onClick={() => setPreviewMode(!previewMode)}
                className={`px-4 py-2 rounded-xl font-medium flex items-center gap-2 transition-colors ${
                  previewMode
                    ? 'bg-primary-500 text-white'
                    : 'bg-neutral-100 text-neutral-700 hover:bg-neutral-200'
                }`}
              >
                <Eye className="w-4 h-4" />
                {previewMode ? 'Edit Mode' : 'Preview'}
              </motion.button>
            </div>

            {previewMode ? (
              /* Preview Mode */
              <motion.div
                initial={{ opacity: 0, scale: 0.95 }}
                animate={{ opacity: 1, scale: 1 }}
                className="bg-gradient-to-br from-neutral-900 to-neutral-800 rounded-2xl p-12 aspect-video flex flex-col items-center justify-center text-white"
              >
                <h2 className="text-4xl font-bold mb-4 text-center">
                  {slides[selectedSlide].title || 'Untitled Slide'}
                </h2>
                {slides[selectedSlide].image_url && (
                  <img
                    src={slides[selectedSlide].image_url}
                    alt="Slide"
                    className="max-h-64 rounded-xl mb-4"
                  />
                )}
                <div 
                  className="text-lg text-center max-w-3xl"
                  dangerouslySetInnerHTML={{ __html: slides[selectedSlide].content }}
                />
              </motion.div>
            ) : (
              /* Edit Mode */
              <div className="space-y-6">
                {/* Title */}
                <div>
                  <label className="block text-sm font-semibold text-neutral-700 mb-2">
                    Slide Title
                  </label>
                  <input
                    type="text"
                    value={slides[selectedSlide].title}
                    onChange={(e) => updateSlide(selectedSlide, { title: e.target.value })}
                    placeholder="Enter slide title..."
                    className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all text-lg font-semibold"
                  />
                </div>

                {/* Content */}
                <div>
                  <label className="block text-sm font-semibold text-neutral-700 mb-2">
                    Content
                  </label>
                  <RichTextEditor
                    value={slides[selectedSlide].content}
                    onChange={(content) => updateSlide(selectedSlide, { content })}
                    placeholder="Enter slide content..."
                    height={250}
                  />
                </div>

                {/* Image Upload */}
                <div>
                  <label className="block text-sm font-semibold text-neutral-700 mb-2">
                    Image (Optional)
                  </label>
                  <ImageUploader
                    value={slides[selectedSlide].image_url}
                    onChange={(url) => updateSlide(selectedSlide, { image_url: url })}
                    aspectRatio="16:9"
                  />
                </div>

                {/* Duration */}
                <div>
                  <label className="block text-sm font-semibold text-neutral-700 mb-2">
                    Display Duration (seconds)
                  </label>
                  <div className="flex items-center gap-4">
                    <input
                      type="range"
                      min="15"
                      max="300"
                      step="15"
                      value={slides[selectedSlide].duration_seconds}
                      onChange={(e) => updateSlide(selectedSlide, { duration_seconds: parseInt(e.target.value) })}
                      className="flex-1"
                    />
                    <span className="text-lg font-semibold text-primary-600 min-w-[60px]">
                      {slides[selectedSlide].duration_seconds}s
                    </span>
                  </div>
                </div>

                {/* Quiz Toggle */}
                <div className="flex items-center justify-between p-4 bg-accent-50 border-2 border-accent-200 rounded-xl">
                  <div>
                    <h4 className="font-semibold text-neutral-900 mb-1">
                      Add Quiz to this Slide
                    </h4>
                    <p className="text-sm text-neutral-600">
                      Test learner's understanding after this slide
                    </p>
                  </div>
                  <label className="relative inline-flex items-center cursor-pointer">
                    <input
                      type="checkbox"
                      checked={slides[selectedSlide].has_quiz}
                      onChange={(e) => updateSlide(selectedSlide, { has_quiz: e.target.checked })}
                      className="sr-only peer"
                    />
                    <div className="w-14 h-8 bg-neutral-200 peer-focus:ring-4 peer-focus:ring-primary-100 rounded-full peer peer-checked:after:translate-x-6 peer-checked:after:border-white after:content-[''] after:absolute after:top-1 after:left-1 after:bg-white after:rounded-full after:h-6 after:w-6 after:transition-all peer-checked:bg-primary-500"></div>
                  </label>
                </div>

                {/* Quiz Builder (if enabled) */}
                {slides[selectedSlide].has_quiz && (
                  <motion.div
                    initial={{ opacity: 0, height: 0 }}
                    animate={{ opacity: 1, height: 'auto' }}
                    exit={{ opacity: 0, height: 0 }}
                  >
                    <QuizBuilder
                      slideId={slides[selectedSlide].id}
                      quiz={slides[selectedSlide].quiz}
                      onChange={(quiz) => updateSlide(selectedSlide, { quiz })}
                    />
                  </motion.div>
                )}
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
```

---

### 👨‍🏫 MODULE 3: TRAINERS (Formateurs)

#### Component: TrainerProfileForm

**Purpose**: Beautiful multi-section form for trainer profile completion

**Design**: Sections with smooth accordion animations

```jsx
import { motion } from 'framer-motion';
import { useState } from 'react';
import { ChevronDown, Upload, Check, AlertCircle } from 'lucide-react';

const sections = [
  { id: 'personal', title: 'Personal Information', icon: User },
  { id: 'experience', title: 'Experience & Qualifications', icon: Award },
  { id: 'teaching', title: 'Teaching Preferences', icon: BookOpen },
  { id: 'documents', title: 'Documents & Certificates', icon: FileText }
];

export default function TrainerProfileForm({ initialData, onSave, onSubmitForReview }) {
  const [formData, setFormData] = useState(initialData || {});
  const [expandedSection, setExpandedSection] = useState('personal');
  const [completedSections, setCompletedSections] = useState([]);

  const isSectionComplete = (sectionId) => {
    // Validation logic for each section
    return completedSections.includes(sectionId);
  };

  const toggleSection = (sectionId) => {
    setExpandedSection(expandedSection === sectionId ? null : sectionId);
  };

  return (
    <div className="max-w-4xl mx-auto">
      {/* Progress Overview */}
      <motion.div
        initial={{ opacity: 0, y: -20 }}
        animate={{ opacity: 1, y: 0 }}
        className="bg-gradient-to-r from-primary-500 to-primary-600 rounded-2xl p-6 mb-8 text-white"
      >
        <div className="flex items-center justify-between mb-4">
          <div>
            <h2 className="text-2xl font-bold mb-1">Complete Your Profile</h2>
            <p className="text-primary-100">
              Fill in all sections to activate your trainer account
            </p>
          </div>
          <div className="text-right">
            <div className="text-4xl font-bold">
              {Math.round((completedSections.length / sections.length) * 100)}%
            </div>
            <p className="text-sm text-primary-100">Complete</p>
          </div>
        </div>

        {/* Progress Bar */}
        <div className="relative h-3 bg-primary-400/30 rounded-full overflow-hidden">
          <motion.div
            initial={{ width: 0 }}
            animate={{ width: `${(completedSections.length / sections.length) * 100}%` }}
            transition={{ duration: 0.5, ease: 'easeOut' }}
            className="absolute inset-y-0 left-0 bg-white rounded-full"
          />
        </div>
      </motion.div>

      {/* Sections */}
      <div className="space-y-4">
        {sections.map((section, index) => {
          const Icon = section.icon;
          const isExpanded = expandedSection === section.id;
          const isComplete = isSectionComplete(section.id);

          return (
            <motion.div
              key={section.id}
              initial={false}
              animate={{
                backgroundColor: isExpanded ? '#ffffff' : '#fafafa'
              }}
              className="rounded-2xl border-2 border-neutral-200 overflow-hidden transition-shadow hover:shadow-lg"
            >
              {/* Section Header */}
              <button
                onClick={() => toggleSection(section.id)}
                className="w-full p-6 flex items-center justify-between text-left"
              >
                <div className="flex items-center gap-4">
                  {/* Icon Circle */}
                  <motion.div
                    animate={{
                      backgroundColor: isComplete ? '#10b981' : isExpanded ? '#0ea5e9' : '#e5e5e5'
                    }}
                    className="w-12 h-12 rounded-full flex items-center justify-center"
                  >
                    {isComplete ? (
                      <Check className="w-6 h-6 text-white" />
                    ) : (
                      <Icon className={`w-6 h-6 ${isExpanded ? 'text-white' : 'text-neutral-400'}`} />
                    )}
                  </motion.div>

                  {/* Section Info */}
                  <div>
                    <h3 className="text-lg font-bold text-neutral-900">
                      {section.title}
                    </h3>
                    {isComplete && (
                      <p className="text-sm text-green-600 font-medium">
                        ✓ Completed
                      </p>
                    )}
                  </div>
                </div>

                {/* Expand Icon */}
                <motion.div
                  animate={{ rotate: isExpanded ? 180 : 0 }}
                  transition={{ duration: 0.3 }}
                >
                  <ChevronDown className="w-6 h-6 text-neutral-400" />
                </motion.div>
              </button>

              {/* Section Content */}
              <motion.div
                initial={false}
                animate={{
                  height: isExpanded ? 'auto' : 0,
                  opacity: isExpanded ? 1 : 0
                }}
                transition={{ duration: 0.3, ease: 'easeInOut' }}
                className="overflow-hidden"
              >
                <div className="px-6 pb-6 border-t border-neutral-100">
                  {/* Personal Information */}
                  {section.id === 'personal' && (
                    <PersonalInfoSection
                      data={formData}
                      onChange={setFormData}
                    />
                  )}

                  {/* Experience & Qualifications */}
                  {section.id === 'experience' && (
                    <ExperienceSection
                      data={formData}
                      onChange={setFormData}
                    />
                  )}

                  {/* Teaching Preferences */}
                  {section.id === 'teaching' && (
                    <TeachingPreferencesSection
                      data={formData}
                      onChange={setFormData}
                    />
                  )}

                  {/* Documents */}
                  {section.id === 'documents' && (
                    <DocumentsSection
                      data={formData}
                      onChange={setFormData}
                    />
                  )}
                </div>
              </motion.div>
            </motion.div>
          );
        })}
      </div>

      {/* Submit Actions */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.3 }}
        className="mt-8 flex gap-4"
      >
        <motion.button
          whileHover={{ scale: 1.02 }}
          whileTap={{ scale: 0.98 }}
          onClick={() => onSave(formData)}
          className="flex-1 px-6 py-4 border-2 border-neutral-200 text-neutral-700 rounded-xl font-semibold hover:bg-neutral-50 transition-colors"
        >
          Save as Draft
        </motion.button>

        <motion.button
          whileHover={{ scale: 1.02 }}
          whileTap={{ scale: 0.98 }}
          onClick={() => onSubmitForReview(formData)}
          disabled={completedSections.length !== sections.length}
          className="flex-1 px-6 py-4 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-xl font-semibold hover:shadow-glow transition-shadow disabled:opacity-50 disabled:cursor-not-allowed"
        >
          Submit for Review
        </motion.button>
      </motion.div>

      {/* Warning if incomplete */}
      {completedSections.length !== sections.length && (
        <motion.div
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          className="mt-4 p-4 bg-amber-50 border-2 border-amber-200 rounded-xl flex items-start gap-3"
        >
          <AlertCircle className="w-5 h-5 text-amber-600 flex-shrink-0 mt-0.5" />
          <div>
            <p className="font-semibold text-amber-900 mb-1">
              Profile Incomplete
            </p>
            <p className="text-sm text-amber-700">
              Please complete all sections before submitting for review. 
              Missing: {sections.filter(s => !isSectionComplete(s.id)).map(s => s.title).join(', ')}
            </p>
          </div>
        </motion.div>
      )}
    </div>
  );
}
```

#### Component: TrainerAvailabilityCalendar

**Purpose**: Interactive calendar for trainers to set their availability

**Design**: Weekly view with time slots, drag to select

```jsx
import { motion } from 'framer-motion';
import { useState } from 'react';
import { Plus, Trash2, Clock } from 'lucide-react';

const daysOfWeek = [
  { id: 0, name: 'Sunday', short: 'Sun' },
  { id: 1, name: 'Monday', short: 'Mon' },
  { id: 2, name: 'Tuesday', short: 'Tue' },
  { id: 3, name: 'Wednesday', short: 'Wed' },
  { id: 4, name: 'Thursday', short: 'Thu' },
  { id: 5, name: 'Friday', short: 'Fri' },
  { id: 6, name: 'Saturday', short: 'Sat' }
];

const timeSlots = Array.from({ length: 24 }, (_, i) => {
  const hour = i.toString().padStart(2, '0');
  return { hour: i, label: `${hour}:00` };
});

export default function TrainerAvailabilityCalendar({ availability, onChange }) {
  const [selectedDay, setSelectedDay] = useState(null);
  const [isDragging, setIsDragging] = useState(false);
  const [dragStart, setDragStart] = useState(null);

  const addTimeSlot = (dayId, startTime, endTime) => {
    const newSlot = {
      id: Date.now().toString(),
      day_of_week: dayId,
      start_time: startTime,
      end_time: endTime,
      is_available: true
    };

    onChange([...availability, newSlot]);
  };

  const removeTimeSlot = (slotId) => {
    onChange(availability.filter(slot => slot.id !== slotId));
  };

  const getSlotForDay = (dayId) => {
    return availability.filter(slot => slot.day_of_week === dayId);
  };

  return (
    <div className="bg-white rounded-2xl shadow-card p-6">
      <div className="mb-6">
        <h2 className="text-2xl font-bold text-neutral-900 mb-2">
          Set Your Weekly Availability
        </h2>
        <p className="text-neutral-600">
          Click and drag on time slots to mark when you're available to teach
        </p>
      </div>

      {/* Calendar Grid */}
      <div className="grid grid-cols-8 gap-px bg-neutral-200 rounded-xl overflow-hidden">
        {/* Header - Time Labels */}
        <div className="bg-neutral-50 p-4">
          <Clock className="w-5 h-5 text-neutral-400" />
        </div>
        {daysOfWeek.map(day => (
          <div key={day.id} className="bg-neutral-50 p-4 text-center">
            <div className="font-bold text-neutral-900">{day.short}</div>
            <div className="text-xs text-neutral-500">{day.name}</div>
          </div>
        ))}

        {/* Time Slots */}
        {timeSlots.map(time => (
          <>
            {/* Time Label */}
            <div className="bg-neutral-50 p-2 text-sm text-neutral-600 flex items-center justify-center">
              {time.label}
            </div>

            {/* Day Slots */}
            {daysOfWeek.map(day => {
              const daySlots = getSlotForDay(day.id);
              const isAvailable = daySlots.some(slot => {
                const slotStart = parseInt(slot.start_time.split(':')[0]);
                const slotEnd = parseInt(slot.end_time.split(':')[0]);
                return time.hour >= slotStart && time.hour < slotEnd;
              });

              return (
                <motion.div
                  key={`${day.id}-${time.hour}`}
                  whileHover={{ scale: 1.05 }}
                  onClick={() => {
                    // Toggle availability for this hour
                    if (isAvailable) {
                      // Remove slot
                      const slotToRemove = daySlots.find(slot => {
                        const slotStart = parseInt(slot.start_time.split(':')[0]);
                        const slotEnd = parseInt(slot.end_time.split(':')[0]);
                        return time.hour >= slotStart && time.hour < slotEnd;
                      });
                      if (slotToRemove) removeTimeSlot(slotToRemove.id);
                    } else {
                      // Add slot
                      addTimeSlot(
                        day.id,
                        `${time.hour.toString().padStart(2, '0')}:00`,
                        `${(time.hour + 1).toString().padStart(2, '0')}:00`
                      );
                    }
                  }}
                  className={`bg-white p-2 cursor-pointer transition-all ${
                    isAvailable
                      ? 'bg-green-100 hover:bg-green-200'
                      : 'hover:bg-primary-50'
                  }`}
                >
                  {isAvailable && (
                    <motion.div
                      initial={{ scale: 0 }}
                      animate={{ scale: 1 }}
                      className="w-full h-full bg-green-500 rounded"
                    />
                  )}
                </motion.div>
              );
            })}
          </>
        ))}
      </div>

      {/* Legend */}
      <div className="mt-6 flex items-center gap-6">
        <div className="flex items-center gap-2">
          <div className="w-6 h-6 bg-green-500 rounded" />
          <span className="text-sm text-neutral-600">Available</span>
        </div>
        <div className="flex items-center gap-2">
          <div className="w-6 h-6 bg-white border-2 border-neutral-200 rounded" />
          <span className="text-sm text-neutral-600">Unavailable</span>
        </div>
      </div>

      {/* Quick Actions */}
      <div className="mt-6 flex gap-3">
        <motion.button
          whileHover={{ scale: 1.02 }}
          whileTap={{ scale: 0.98 }}
          onClick={() => {
            // Set typical work hours (9-17) for weekdays
            const workDaySlots = [];
            for (let day = 1; day <= 5; day++) {
              workDaySlots.push({
                id: `${day}-work`,
                day_of_week: day,
                start_time: '09:00',
                end_time: '17:00',
                is_available: true
              });
            }
            onChange([...availability, ...workDaySlots]);
          }}
          className="px-4 py-2 bg-primary-100 text-primary-700 rounded-xl font-medium hover:bg-primary-200 transition-colors"
        >
          Set Typical Work Hours
        </motion.button>

        <motion.button
          whileHover={{ scale: 1.02 }}
          whileTap={{ scale: 0.98 }}
          onClick={() => onChange([])}
          className="px-4 py-2 bg-red-100 text-red-700 rounded-xl font-medium hover:bg-red-200 transition-colors"
        >
          Clear All
        </motion.button>
      </div>
    </div>
  );
}
```

#### Component: PaymentHistory

**Purpose**: Beautiful payment history with stats

```jsx
import { motion } from 'framer-motion';
import { TrendingUp, Clock, CheckCircle, DollarSign } from 'lucide-react';
import { Line } from 'react-chartjs-2';

export default function PaymentHistory({ payments, stats }) {
  return (
    <div className="space-y-6">
      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        {[
          {
            title: 'Total Earned',
            value: `€${stats.totalEarned.toLocaleString()}`,
            icon: DollarSign,
            color: 'from-green-400 to-green-600',
            trend: '+12%'
          },
          {
            title: 'This Month',
            value: `€${stats.thisMonth.toLocaleString()}`,
            icon: TrendingUp,
            color: 'from-blue-400 to-blue-600',
            trend: '+5%'
          },
          {
            title: 'Pending',
            value: `€${stats.pending.toLocaleString()}`,
            icon: Clock,
            color: 'from-amber-400 to-amber-600',
            count: stats.pendingCount
          },
          {
            title: 'Hours Taught',
            value: stats.totalHours,
            icon: CheckCircle,
            color: 'from-purple-400 to-purple-600',
            subtitle: 'sessions'
          }
        ].map((stat, index) => {
          const Icon = stat.icon;
          return (
            <motion.div
              key={stat.title}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.1 }}
              whileHover={{ y: -5, scale: 1.02 }}
              className="bg-white rounded-2xl shadow-card p-6 relative overflow-hidden"
            >
              {/* Background Gradient */}
              <div className={`absolute top-0 right-0 w-32 h-32 bg-gradient-to-br ${stat.color} opacity-10 rounded-full -mr-8 -mt-8`} />

              {/* Icon */}
              <div className={`w-12 h-12 rounded-xl bg-gradient-to-br ${stat.color} flex items-center justify-center mb-4`}>
                <Icon className="w-6 h-6 text-white" />
              </div>

              {/* Content */}
              <div>
                <p className="text-sm text-neutral-600 mb-1">{stat.title}</p>
                <div className="flex items-baseline gap-2">
                  <p className="text-3xl font-bold text-neutral-900">{stat.value}</p>
                  {stat.trend && (
                    <span className="text-sm font-semibold text-green-600">
                      {stat.trend}
                    </span>
                  )}
                </div>
                {stat.count && (
                  <p className="text-xs text-neutral-500 mt-1">{stat.count} payments</p>
                )}
                {stat.subtitle && (
                  <p className="text-xs text-neutral-500 mt-1">{stat.subtitle}</p>
                )}
              </div>
            </motion.div>
          );
        })}
      </div>

      {/* Earnings Chart */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.4 }}
        className="bg-white rounded-2xl shadow-card p-6"
      >
        <h3 className="text-xl font-bold text-neutral-900 mb-6">
          Earnings Over Time
        </h3>
        <Line
          data={stats.chartData}
          options={{
            responsive: true,
            plugins: {
              legend: { display: false },
              tooltip: {
                backgroundColor: '#1f2937',
                padding: 12,
                borderRadius: 8,
                titleFont: { size: 14, weight: 'bold' },
                bodyFont: { size: 13 }
              }
            },
            scales: {
              y: {
                beginAtZero: true,
                ticks: {
                  callback: (value) => `€${value}`
                }
              }
            }
          }}
        />
      </motion.div>

      {/* Payment List */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.5 }}
        className="bg-white rounded-2xl shadow-card overflow-hidden"
      >
        <div className="p-6 border-b border-neutral-100">
          <h3 className="text-xl font-bold text-neutral-900">
            Payment History
          </h3>
        </div>

        <div className="divide-y divide-neutral-100">
          {payments.map((payment, index) => (
            <motion.div
              key={payment.id}
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: index * 0.05 }}
              whileHover={{ backgroundColor: '#fafafa' }}
              className="p-6 flex items-center justify-between cursor-pointer transition-colors"
            >
              <div className="flex items-center gap-4">
                {/* Status Icon */}
                <div className={`w-12 h-12 rounded-xl flex items-center justify-center ${
                  payment.status === 'paid'
                    ? 'bg-green-100'
                    : payment.status === 'approved'
                    ? 'bg-blue-100'
                    : 'bg-amber-100'
                }`}>
                  {payment.status === 'paid' ? (
                    <CheckCircle className="w-6 h-6 text-green-600" />
                  ) : payment.status === 'approved' ? (
                    <Clock className="w-6 h-6 text-blue-600" />
                  ) : (
                    <Clock className="w-6 h-6 text-amber-600" />
                  )}
                </div>

                {/* Info */}
                <div>
                  <h4 className="font-semibold text-neutral-900 mb-1">
                    {payment.lesson_title}
                  </h4>
                  <div className="flex items-center gap-3 text-sm text-neutral-600">
                    <span>{payment.session_date}</span>
                    <span>•</span>
                    <span>{payment.duration_minutes} minutes</span>
                    <span>•</span>
                    <span>€{payment.hourly_rate}/hour</span>
                  </div>
                </div>
              </div>

              {/* Amount & Status */}
              <div className="text-right">
                <div className="text-2xl font-bold text-neutral-900 mb-1">
                  €{payment.total_amount}
                </div>
                <span className={`inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold ${
                  payment.status === 'paid'
                    ? 'bg-green-100 text-green-700'
                    : payment.status === 'approved'
                    ? 'bg-blue-100 text-blue-700'
                    : 'bg-amber-100 text-amber-700'
                }`}>
                  {payment.status === 'paid' ? 'Paid' : payment.status === 'approved' ? 'Approved' : 'Pending'}
                </span>
              </div>
            </motion.div>
          ))}
        ```jsx
        </div>

        {/* Load More */}
        {payments.length >= 10 && (
          <div className="p-6 border-t border-neutral-100 text-center">
            <motion.button
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              className="px-6 py-3 bg-neutral-100 text-neutral-700 rounded-xl font-medium hover:bg-neutral-200 transition-colors"
            >
              Load More
            </motion.button>
          </div>
        )}
      </motion.div>
    </div>
  );
}
```

---

### 👥 MODULE 4: STUDENTS/USERS (Utilisateurs)

#### Component: Cart

**Purpose**: Beautiful shopping cart with smooth animations

**Design**: Slide-in panel with items, totals, and checkout

```jsx
import { motion, AnimatePresence } from 'framer-motion';
import { X, ShoppingCart, Trash2, AlertCircle, Sparkles } from 'lucide-react';
import { useState } from 'react';

export default function Cart({ isOpen, onClose, items, onRemoveItem, onCheckout }) {
  const [isCheckingOut, setIsCheckingOut] = useState(false);

  const calculateTotal = () => {
    return items.reduce((sum, item) => sum + (item.price_at_addition || 0), 0);
  };

  const adminAssignedCount = items.filter(item => item.is_admin_assigned).length;

  const handleCheckout = async () => {
    setIsCheckingOut(true);
    try {
      await onCheckout();
    } finally {
      setIsCheckingOut(false);
    }
  };

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          {/* Backdrop */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
            className="fixed inset-0 bg-black/50 backdrop-blur-sm z-40"
          />

          {/* Cart Panel */}
          <motion.div
            initial={{ x: '100%' }}
            animate={{ x: 0 }}
            exit={{ x: '100%' }}
            transition={{ type: 'spring', damping: 30, stiffness: 300 }}
            className="fixed right-0 top-0 bottom-0 w-full max-w-lg bg-white shadow-2xl z-50 flex flex-col"
          >
            {/* Header */}
            <div className="p-6 border-b border-neutral-200 flex items-center justify-between bg-gradient-to-r from-primary-500 to-primary-600 text-white">
              <div className="flex items-center gap-3">
                <ShoppingCart className="w-6 h-6" />
                <div>
                  <h2 className="text-2xl font-bold">Your Cart</h2>
                  <p className="text-sm text-primary-100">
                    {items.length} {items.length === 1 ? 'item' : 'items'}
                  </p>
                </div>
              </div>

              <motion.button
                whileHover={{ scale: 1.1, rotate: 90 }}
                whileTap={{ scale: 0.9 }}
                onClick={onClose}
                className="p-2 hover:bg-white/20 rounded-full transition-colors"
              >
                <X className="w-6 h-6" />
              </motion.button>
            </div>

            {/* Admin Assigned Notice */}
            {adminAssignedCount > 0 && (
              <motion.div
                initial={{ opacity: 0, y: -20 }}
                animate={{ opacity: 1, y: 0 }}
                className="mx-6 mt-6 p-4 bg-accent-50 border-2 border-accent-200 rounded-xl flex items-start gap-3"
              >
                <Sparkles className="w-5 h-5 text-accent-600 flex-shrink-0 mt-0.5" />
                <div>
                  <p className="font-semibold text-accent-900 mb-1">
                    Special Assignment
                  </p>
                  <p className="text-sm text-accent-700">
                    {adminAssignedCount} {adminAssignedCount === 1 ? 'item was' : 'items were'} specially assigned to you by an administrator
                  </p>
                </div>
              </motion.div>
            )}

            {/* Items List */}
            <div className="flex-1 overflow-y-auto p-6">
              {items.length === 0 ? (
                <div className="h-full flex flex-col items-center justify-center text-center">
                  <motion.div
                    initial={{ scale: 0 }}
                    animate={{ scale: 1 }}
                    transition={{ type: 'spring', stiffness: 200 }}
                  >
                    <ShoppingCart className="w-20 h-20 text-neutral-300 mb-4 mx-auto" />
                  </motion.div>
                  <h3 className="text-xl font-semibold text-neutral-900 mb-2">
                    Your cart is empty
                  </h3>
                  <p className="text-neutral-600 mb-6">
                    Browse our catalog and add lessons to get started
                  </p>
                  <motion.button
                    whileHover={{ scale: 1.05 }}
                    whileTap={{ scale: 0.95 }}
                    onClick={onClose}
                    className="px-6 py-3 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-xl font-medium"
                  >
                    Browse Lessons
                  </motion.button>
                </div>
              ) : (
                <div className="space-y-4">
                  <AnimatePresence>
                    {items.map((item, index) => (
                      <motion.div
                        key={item.id}
                        initial={{ opacity: 0, x: 20 }}
                        animate={{ opacity: 1, x: 0 }}
                        exit={{ opacity: 0, x: -20, height: 0 }}
                        transition={{ delay: index * 0.05 }}
                        layout
                        className="bg-neutral-50 rounded-2xl p-4 relative group"
                      >
                        {/* Admin Assigned Badge */}
                        {item.is_admin_assigned && (
                          <motion.div
                            initial={{ scale: 0, rotate: -45 }}
                            animate={{ scale: 1, rotate: 0 }}
                            className="absolute top-2 right-2 bg-accent-500 text-white px-2 py-1 rounded-full text-xs font-semibold flex items-center gap-1"
                          >
                            <Sparkles className="w-3 h-3" />
                            Assigned
                          </motion.div>
                        )}

                        <div className="flex gap-4">
                          {/* Thumbnail */}
                          <div className="w-20 h-20 rounded-xl bg-gradient-to-br from-primary-400 to-primary-600 flex-shrink-0 overflow-hidden">
                            {item.lesson_thumbnail ? (
                              <img
                                src={item.lesson_thumbnail}
                                alt={item.lesson_title}
                                className="w-full h-full object-cover"
                              />
                            ) : (
                              <div className="w-full h-full flex items-center justify-center">
                                <BookOpen className="w-8 h-8 text-white" />
                              </div>
                            )}
                          </div>

                          {/* Info */}
                          <div className="flex-1 min-w-0">
                            <h4 className="font-semibold text-neutral-900 mb-1 truncate">
                              {item.lesson_title}
                            </h4>
                            <p className="text-sm text-neutral-600 mb-2">
                              {item.lesson_type} • {item.delivery_mode}
                            </p>

                            {item.session_date && (
                              <div className="flex items-center gap-1 text-xs text-neutral-600">
                                <Calendar className="w-3 h-3" />
                                <span>{item.session_date}</span>
                              </div>
                            )}

                            {/* Price */}
                            <div className="mt-2">
                              {item.is_free ? (
                                <span className="text-lg font-bold text-green-600">FREE</span>
                              ) : (
                                <span className="text-lg font-bold text-neutral-900">
                                  €{item.price_at_addition}
                                </span>
                              )}
                            </div>
                          </div>

                          {/* Remove Button */}
                          {!item.is_admin_assigned && (
                            <motion.button
                              whileHover={{ scale: 1.2, rotate: 5 }}
                              whileTap={{ scale: 0.8 }}
                              onClick={() => onRemoveItem(item.id)}
                              className="opacity-0 group-hover:opacity-100 p-2 hover:bg-red-100 rounded-lg transition-all self-start"
                            >
                              <Trash2 className="w-5 h-5 text-red-500" />
                            </motion.button>
                          )}
                        </div>

                        {/* Notes for assigned items */}
                        {item.is_admin_assigned && item.notes && (
                          <div className="mt-3 pt-3 border-t border-neutral-200">
                            <p className="text-xs text-neutral-600 italic">
                              Note: {item.notes}
                            </p>
                          </div>
                        )}
                      </motion.div>
                    ))}
                  </AnimatePresence>
                </div>
              )}
            </div>

            {/* Footer - Checkout */}
            {items.length > 0 && (
              <div className="border-t border-neutral-200 p-6 bg-neutral-50">
                {/* Total */}
                <div className="mb-4">
                  <div className="flex items-center justify-between text-lg mb-2">
                    <span className="text-neutral-600">Subtotal</span>
                    <span className="font-semibold text-neutral-900">
                      €{calculateTotal().toFixed(2)}
                    </span>
                  </div>
                  
                  {/* Discount info */}
                  {items.some(item => item.is_member_price) && (
                    <div className="flex items-center justify-between text-sm text-green-600">
                      <span>Member discount applied</span>
                      <span className="font-semibold">
                        -€{items.reduce((sum, item) => sum + (item.discount || 0), 0).toFixed(2)}
                      </span>
                    </div>
                  )}

                  <div className="mt-3 pt-3 border-t border-neutral-200 flex items-center justify-between">
                    <span className="text-xl font-bold text-neutral-900">Total</span>
                    <span className="text-3xl font-bold text-primary-600">
                      €{calculateTotal().toFixed(2)}
                    </span>
                  </div>
                </div>

                {/* Checkout Button */}
                <motion.button
                  whileHover={{ scale: 1.02 }}
                  whileTap={{ scale: 0.98 }}
                  onClick={handleCheckout}
                  disabled={isCheckingOut}
                  className="w-full px-6 py-4 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-xl font-bold text-lg hover:shadow-glow transition-shadow disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center gap-2"
                >
                  {isCheckingOut ? (
                    <>
                      <motion.div
                        animate={{ rotate: 360 }}
                        transition={{ duration: 1, repeat: Infinity, ease: 'linear' }}
                      >
                        <Loader className="w-5 h-5" />
                      </motion.div>
                      Processing...
                    </>
                  ) : (
                    <>
                      Proceed to Checkout
                      <ArrowRight className="w-5 h-5" />
                    </>
                  )}
                </motion.button>

                {/* Security notice */}
                <div className="mt-3 flex items-center justify-center gap-2 text-xs text-neutral-600">
                  <Lock className="w-3 h-3" />
                  <span>Secure checkout powered by Stripe</span>
                </div>
              </div>
            )}
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
}
```

#### Component: ProgressTimeline

**Purpose**: Visual timeline showing enrollment progress

**Design**: Vertical timeline with animated checkpoints

```jsx
import { motion } from 'framer-motion';
import { Check, Clock, Play, Award } from 'lucide-react';

const milestoneIcons = {
  assigned: AlertCircle,
  validated: Check,
  started: Play,
  quiz_completed: BookOpen,
  session_attended: Users,
  completed: Award,
  certificate_issued: Award
};

const milestoneColors = {
  assigned: 'from-blue-400 to-blue-600',
  validated: 'from-green-400 to-green-600',
  started: 'from-purple-400 to-purple-600',
  quiz_completed: 'from-orange-400 to-orange-600',
  session_attended: 'from-pink-400 to-pink-600',
  completed: 'from-green-400 to-green-600',
  certificate_issued: 'from-yellow-400 to-yellow-600'
};

export default function ProgressTimeline({ progress, enrollmentStatus }) {
  const sortedProgress = [...progress].sort((a, b) => 
    new Date(a.milestone_date) - new Date(b.milestone_date)
  );

  const currentIndex = sortedProgress.length - 1;

  return (
    <div className="bg-white rounded-2xl shadow-card p-8">
      <h3 className="text-2xl font-bold text-neutral-900 mb-8">
        Your Progress
      </h3>

      <div className="relative">
        {/* Progress Line */}
        <div className="absolute left-6 top-0 bottom-0 w-0.5 bg-neutral-200" />
        <motion.div
          initial={{ height: 0 }}
          animate={{ 
            height: `${(currentIndex / (sortedProgress.length - 1)) * 100}%` 
          }}
          transition={{ duration: 1, ease: 'easeOut' }}
          className="absolute left-6 top-0 w-0.5 bg-gradient-to-b from-primary-500 to-primary-600"
        />

        {/* Milestones */}
        <div className="space-y-8">
          {sortedProgress.map((item, index) => {
            const Icon = milestoneIcons[item.milestone] || Clock;
            const colorClass = milestoneColors[item.milestone];
            const isLast = index === sortedProgress.length - 1;
            const isPast = index < currentIndex;
            const isCurrent = index === currentIndex;

            return (
              <motion.div
                key={item.id}
                initial={{ opacity: 0, x: -20 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: index * 0.1 }}
                className="relative flex gap-6"
              >
                {/* Icon */}
                <motion.div
                  initial={{ scale: 0 }}
                  animate={{ scale: 1 }}
                  transition={{ delay: index * 0.1 + 0.2, type: 'spring', stiffness: 200 }}
                  className={`relative z-10 w-12 h-12 rounded-full bg-gradient-to-br ${colorClass} flex items-center justify-center flex-shrink-0 ${
                    isCurrent ? 'ring-4 ring-primary-200' : ''
                  }`}
                >
                  <Icon className="w-6 h-6 text-white" />
                  
                  {/* Pulse animation for current */}
                  {isCurrent && (
                    <motion.div
                      animate={{
                        scale: [1, 1.5, 1],
                        opacity: [0.5, 0, 0.5]
                      }}
                      transition={{
                        duration: 2,
                        repeat: Infinity,
                        ease: 'easeInOut'
                      }}
                      className={`absolute inset-0 rounded-full bg-gradient-to-br ${colorClass}`}
                    />
                  )}
                </motion.div>

                {/* Content */}
                <motion.div
                  initial={{ opacity: 0, y: 10 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: index * 0.1 + 0.3 }}
                  className="flex-1 pb-8"
                >
                  <div className="flex items-start justify-between mb-2">
                    <h4 className={`font-bold text-lg ${
                      isCurrent ? 'text-primary-600' : 'text-neutral-900'
                    }`}>
                      {item.milestone.split('_').map(word => 
                        word.charAt(0).toUpperCase() + word.slice(1)
                      ).join(' ')}
                    </h4>
                    <span className="text-sm text-neutral-600">
                      {new Date(item.milestone_date).toLocaleDateString('en-US', {
                        month: 'short',
                        day: 'numeric',
                        year: 'numeric'
                      })}
                    </span>
                  </div>

                  {item.notes && (
                    <p className="text-neutral-600 text-sm leading-relaxed">
                      {item.notes}
                    </p>
                  )}

                  {/* Additional info for specific milestones */}
                  {item.milestone === 'session_attended' && item.duration && (
                    <div className="mt-2 flex items-center gap-4 text-sm">
                      <span className="text-neutral-600">
                        Duration: {item.duration} minutes
                      </span>
                    </div>
                  )}

                  {/* Current indicator */}
                  {isCurrent && (
                    <motion.div
                      initial={{ opacity: 0, scale: 0.8 }}
                      animate={{ opacity: 1, scale: 1 }}
                      className="mt-3 inline-flex items-center gap-2 px-3 py-1.5 bg-primary-50 text-primary-700 rounded-full text-sm font-semibold"
                    >
                      <div className="w-2 h-2 rounded-full bg-primary-500 animate-pulse" />
                      Current Stage
                    </motion.div>
                  )}
                </motion.div>
              </motion.div>
            );
          })}
        </div>
      </div>

      {/* Next Steps */}
      {enrollmentStatus !== 'completed' && (
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: sortedProgress.length * 0.1 + 0.5 }}
          className="mt-8 p-6 bg-gradient-to-r from-primary-50 to-accent-50 rounded-2xl border-2 border-primary-200"
        >
          <div className="flex items-start gap-4">
            <div className="w-10 h-10 rounded-full bg-primary-500 flex items-center justify-center flex-shrink-0">
              <ArrowRight className="w-5 h-5 text-white" />
            </div>
            <div>
              <h4 className="font-bold text-neutral-900 mb-2">
                What's Next?
              </h4>
              <p className="text-neutral-700 text-sm">
                {getNextStepMessage(sortedProgress[currentIndex].milestone)}
              </p>
            </div>
          </div>
        </motion.div>
      )}
    </div>
  );
}

function getNextStepMessage(currentMilestone) {
  const messages = {
    assigned: 'Review the lesson details and validate your enrollment',
    validated: 'Access your lesson content and begin learning',
    started: 'Complete the lesson materials and quizzes',
    quiz_completed: 'Attend your scheduled session or continue learning',
    session_attended: 'Complete any remaining materials',
    completed: 'Your certificate is being prepared'
  };
  return messages[currentMilestone] || 'Continue your learning journey';
}
```

#### Component: LessonCatalog

**Purpose**: Beautiful browsable catalog with filters

**Design**: Grid layout with advanced filtering

```jsx
import { motion, AnimatePresence } from 'framer-motion';
import { useState } from 'react';
import { Search, Filter, SlidersHorizontal, Grid, List } from 'lucide-react';

export default function LessonCatalog({ onAddToCart }) {
  const [viewMode, setViewMode] = useState('grid'); // 'grid' | 'list'
  const [searchQuery, setSearchQuery] = useState('');
  const [filters, setFilters] = useState({
    category: 'all',
    lesson_type: 'all',
    delivery_mode: 'all',
    level: 'all',
    price: 'all'
  });
  const [showFilters, setShowFilters] = useState(false);

  return (
    <div className="space-y-6">
      {/* Hero Section */}
      <motion.div
        initial={{ opacity: 0, y: -20 }}
        animate={{ opacity: 1, y: 0 }}
        className="bg-gradient-to-r from-primary-500 via-primary-600 to-accent-500 rounded-3xl p-12 text-white relative overflow-hidden"
      >
        {/* Animated Background Pattern */}
        <motion.div
          animate={{
            backgroundPosition: ['0% 0%', '100% 100%'],
          }}
          transition={{
            duration: 20,
            repeat: Infinity,
            repeatType: 'reverse'
          }}
          className="absolute inset-0 opacity-10"
          style={{
            backgroundImage: 'url("data:image/svg+xml,%3Csvg width="60" height="60" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg"%3E%3Cg fill="none" fill-rule="evenodd"%3E%3Cg fill="%23ffffff" fill-opacity="1"%3E%3Cpath d="M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z"/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")',
            backgroundSize: '60px 60px'
          }}
        />

        <div className="relative z-10">
          <h1 className="text-5xl font-bold mb-4">
            Discover Your Next Learning Journey
          </h1>
          <p className="text-xl text-primary-100 mb-8">
            Browse through our extensive catalog of lessons, activities, and workshops
          </p>

          {/* Search Bar */}
          <div className="max-w-2xl">
            <div className="relative">
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-6 h-6 text-neutral-400" />
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                placeholder="Search for lessons, topics, or trainers..."
                className="w-full pl-14 pr-4 py-4 rounded-2xl text-lg text-neutral-900 placeholder-neutral-400 focus:ring-4 focus:ring-white/30 transition-all"
              />
            </div>
          </div>
        </div>
      </motion.div>

      {/* Toolbar */}
      <div className="flex items-center justify-between gap-4 flex-wrap">
        {/* Filter Toggle */}
        <div className="flex items-center gap-3">
          <motion.button
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            onClick={() => setShowFilters(!showFilters)}
            className={`px-4 py-2.5 rounded-xl font-medium flex items-center gap-2 transition-colors ${
              showFilters
                ? 'bg-primary-500 text-white'
                : 'bg-neutral-100 text-neutral-700 hover:bg-neutral-200'
            }`}
          >
            <SlidersHorizontal className="w-5 h-5" />
            Filters
            {Object.values(filters).filter(v => v !== 'all').length > 0 && (
              <span className="ml-1 px-2 py-0.5 bg-white/20 rounded-full text-xs">
                {Object.values(filters).filter(v => v !== 'all').length}
              </span>
            )}
          </motion.button>

          {/* Active Filters */}
          {Object.entries(filters).filter(([_, v]) => v !== 'all').length > 0 && (
            <motion.div
              initial={{ opacity: 0, scale: 0.8 }}
              animate={{ opacity: 1, scale: 1 }}
              className="flex items-center gap-2"
            >
              {Object.entries(filters)
                .filter(([_, value]) => value !== 'all')
                .map(([key, value]) => (
                  <motion.span
                    key={key}
                    initial={{ scale: 0 }}
                    animate={{ scale: 1 }}
                    exit={{ scale: 0 }}
                    className="px-3 py-1.5 bg-primary-100 text-primary-700 rounded-full text-sm font-medium flex items-center gap-2"
                  >
                    {value}
                    <button
                      onClick={() => setFilters({ ...filters, [key]: 'all' })}
                      className="hover:bg-primary-200 rounded-full p-0.5 transition-colors"
                    >
                      <X className="w-3 h-3" />
                    </button>
                  </motion.span>
                ))}
              <button
                onClick={() => setFilters({
                  category: 'all',
                  lesson_type: 'all',
                  delivery_mode: 'all',
                  level: 'all',
                  price: 'all'
                })}
                className="text-sm text-neutral-600 hover:text-neutral-900 font-medium"
              >
                Clear all
              </button>
            </motion.div>
          )}
        </div>

        {/* View Mode Toggle */}
        <div className="flex items-center gap-2 bg-neutral-100 p-1 rounded-xl">
          <motion.button
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            onClick={() => setViewMode('grid')}
            className={`p-2 rounded-lg transition-colors ${
              viewMode === 'grid'
                ? 'bg-white text-primary-600 shadow-sm'
                : 'text-neutral-600 hover:text-neutral-900'
            }`}
          >
            <Grid className="w-5 h-5" />
          </motion.button>
          <motion.button
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
            onClick={() => setViewMode('list')}
            className={`p-2 rounded-lg transition-colors ${
              viewMode === 'list'
                ? 'bg-white text-primary-600 shadow-sm'
                : 'text-neutral-600 hover:text-neutral-900'
            }`}
          >
            <List className="w-5 h-5" />
          </motion.button>
        </div>
      </div>

      {/* Filters Panel */}
      <AnimatePresence>
        {showFilters && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: 'auto' }}
            exit={{ opacity: 0, height: 0 }}
            transition={{ duration: 0.3 }}
            className="bg-white rounded-2xl shadow-card p-6 overflow-hidden"
          >
            <div className="grid grid-cols-1 md:grid-cols-5 gap-6">
              {/* Category */}
              <div>
                <label className="block text-sm font-semibold text-neutral-700 mb-2">
                  Category
                </label>
                <select
                  value={filters.category}
                  onChange={(e) => setFilters({ ...filters, category: e.target.value })}
                  className="w-full px-4 py-2.5 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                >
                  <option value="all">All Categories</option>
                  <option value="french">French</option>
                  <option value="english">English</option>
                  <option value="computer">Computer Science</option>
                  {/* Add more categories */}
                </select>
              </div>

              {/* Type */}
              <div>
                <label className="block text-sm font-semibold text-neutral-700 mb-2">
                  Type
                </label>
                <select
                  value={filters.lesson_type}
                  onChange={(e) => setFilters({ ...filters, lesson_type: e.target.value })}
                  className="w-full px-4 py-2.5 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                >
                  <option value="all">All Types</option>
                  <option value="lesson">Lesson</option>
                  <option value="activity">Activity</option>
                  <option value="workshop">Workshop</option>
                </select>
              </div>

              {/* Delivery Mode */}
              <div>
                ```jsx
                <label className="block text-sm font-semibold text-neutral-700 mb-2">
                  Delivery
                </label>
                <select
                  value={filters.delivery_mode}
                  onChange={(e) => setFilters({ ...filters, delivery_mode: e.target.value })}
                  className="w-full px-4 py-2.5 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                >
                  <option value="all">All Modes</option>
                  <option value="online_on_demand">On Demand</option>
                  <option value="in_person">In Person</option>
                  <option value="remote">Remote</option>
                  <option value="hybrid">Hybrid</option>
                </select>
              </div>

              {/* Level */}
              <div>
                <label className="block text-sm font-semibold text-neutral-700 mb-2">
                  Level
                </label>
                <select
                  value={filters.level}
                  onChange={(e) => setFilters({ ...filters, level: e.target.value })}
                  className="w-full px-4 py-2.5 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                >
                  <option value="all">All Levels</option>
                  <option value="beginner">Beginner</option>
                  <option value="intermediate">Intermediate</option>
                  <option value="advanced">Advanced</option>
                </select>
              </div>

              {/* Price */}
              <div>
                <label className="block text-sm font-semibold text-neutral-700 mb-2">
                  Price
                </label>
                <select
                  value={filters.price}
                  onChange={(e) => setFilters({ ...filters, price: e.target.value })}
                  className="w-full px-4 py-2.5 border-2 border-neutral-200 rounded-xl focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                >
                  <option value="all">All Prices</option>
                  <option value="free">Free</option>
                  <option value="0-50">€0 - €50</option>
                  <option value="50-100">€50 - €100</option>
                  <option value="100+">€100+</option>
                </select>
              </div>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Lessons Grid/List */}
      <motion.div
        layout
        className={viewMode === 'grid' 
          ? 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6'
          : 'space-y-4'
        }
      >
        <AnimatePresence mode="popLayout">
          {/* Map lessons here - using LessonCard component */}
          {/* This will be populated with actual lesson data */}
        </AnimatePresence>
      </motion.div>
    </div>
  );
}
```

---

## 🎨 SHARED COMPONENTS LIBRARY

### Component: AnimatedCounter

**Purpose**: Smooth number animation for stats

```jsx
import { motion, useMotionValue, useTransform, animate } from 'framer-motion';
import { useEffect } from 'react';

export default function AnimatedCounter({ value, duration = 1, decimals = 0, prefix = '', suffix = '' }) {
  const count = useMotionValue(0);
  const rounded = useTransform(count, (latest) => {
    return prefix + latest.toFixed(decimals) + suffix;
  });

  useEffect(() => {
    const controls = animate(count, value, { duration });
    return controls.stop;
  }, [value]);

  return <motion.span>{rounded}</motion.span>;
}
```

### Component: EmptyState

**Purpose**: Beautiful empty states with Lottie animations

```jsx
import { motion } from 'framer-motion';
import Lottie from 'lottie-react';
import emptyAnimation from '@/public/animations/empty-state.json';

export default function EmptyState({ 
  title, 
  description, 
  actionText, 
  onAction,
  animation = emptyAnimation 
}) {
  return (
    <motion.div
      initial={{ opacity: 0, scale: 0.9 }}
      animate={{ opacity: 1, scale: 1 }}
      className="flex flex-col items-center justify-center py-16 px-4 text-center"
    >
      <div className="w-64 h-64 mb-8">
        <Lottie animationData={animation} loop={true} />
      </div>

      <h3 className="text-2xl font-bold text-neutral-900 mb-3">
        {title}
      </h3>
      
      <p className="text-neutral-600 max-w-md mb-8">
        {description}
      </p>

      {actionText && onAction && (
        <motion.button
          whileHover={{ scale: 1.05 }}
          whileTap={{ scale: 0.95 }}
          onClick={onAction}
          className="px-6 py-3 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-xl font-medium"
        >
          {actionText}
        </motion.button>
      )}
    </motion.div>
  );
}
```

### Component: StatusBadge

**Purpose**: Consistent status badges across app

```jsx
import { motion } from 'framer-motion';

const statusConfig = {
  active: { color: 'bg-green-100 text-green-700 border-green-200', icon: '●' },
  pending: { color: 'bg-amber-100 text-amber-700 border-amber-200', icon: '◐' },
  inactive: { color: 'bg-neutral-100 text-neutral-700 border-neutral-200', icon: '○' },
  completed: { color: 'bg-blue-100 text-blue-700 border-blue-200', icon: '✓' },
  cancelled: { color: 'bg-red-100 text-red-700 border-red-200', icon: '✕' },
  draft: { color: 'bg-neutral-100 text-neutral-700 border-neutral-200', icon: '◌' }
};

export default function StatusBadge({ status, size = 'md', animated = true }) {
  const config = statusConfig[status] || statusConfig.active;
  
  const sizeClasses = {
    sm: 'px-2 py-0.5 text-xs',
    md: 'px-3 py-1 text-sm',
    lg: 'px-4 py-1.5 text-base'
  };

  const Badge = (
    <span className={`inline-flex items-center gap-1.5 font-semibold rounded-full border-2 ${config.color} ${sizeClasses[size]}`}>
      <span className={animated ? 'animate-pulse' : ''}>{config.icon}</span>
      {status.charAt(0).toUpperCase() + status.slice(1).replace('_', ' ')}
    </span>
  );

  return animated ? (
    <motion.div
      initial={{ scale: 0, opacity: 0 }}
      animate={{ scale: 1, opacity: 1 }}
      transition={{ type: 'spring', stiffness: 500, damping: 30 }}
    >
      {Badge}
    </motion.div>
  ) : Badge;
}
```

### Component: ConfirmDialog

**Purpose**: Reusable confirmation modals

```jsx
import { motion, AnimatePresence } from 'framer-motion';
import { modalVariants, backdropVariants } from '@/lib/animations';
import { AlertTriangle, Info, CheckCircle, XCircle } from 'lucide-react';

const variantConfig = {
  danger: {
    icon: AlertTriangle,
    color: 'text-red-600',
    buttonClass: 'bg-red-600 hover:bg-red-700'
  },
  warning: {
    icon: AlertTriangle,
    color: 'text-amber-600',
    buttonClass: 'bg-amber-600 hover:bg-amber-700'
  },
  info: {
    icon: Info,
    color: 'text-blue-600',
    buttonClass: 'bg-blue-600 hover:bg-blue-700'
  },
  success: {
    icon: CheckCircle,
    color: 'text-green-600',
    buttonClass: 'bg-green-600 hover:bg-green-700'
  }
};

export default function ConfirmDialog({
  isOpen,
  onClose,
  onConfirm,
  title,
  message,
  confirmText = 'Confirm',
  cancelText = 'Cancel',
  variant = 'info',
  requireInput = false,
  inputPlaceholder = 'Type to confirm'
}) {
  const [inputValue, setInputValue] = useState('');
  const config = variantConfig[variant];
  const Icon = config.icon;

  const handleConfirm = () => {
    if (requireInput && !inputValue) return;
    onConfirm();
    setInputValue('');
  };

  return (
    <AnimatePresence>
      {isOpen && (
        <>
          <motion.div
            variants={backdropVariants}
            initial="hidden"
            animate="visible"
            exit="hidden"
            className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50"
            onClick={onClose}
          />

          <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
            <motion.div
              variants={modalVariants}
              initial="hidden"
              animate="visible"
              exit="exit"
              className="bg-white rounded-2xl shadow-modal max-w-md w-full p-6"
              onClick={(e) => e.stopPropagation()}
            >
              <div className="flex items-start gap-4 mb-6">
                <motion.div
                  animate={{
                    scale: [1, 1.1, 1],
                    rotate: [0, 5, -5, 0]
                  }}
                  transition={{
                    duration: 0.5,
                    repeat: variant === 'danger' ? Infinity : 0,
                    repeatDelay: 2
                  }}
                  className={`w-12 h-12 rounded-full bg-${variant === 'danger' ? 'red' : variant === 'warning' ? 'amber' : variant === 'success' ? 'green' : 'blue'}-100 flex items-center justify-center flex-shrink-0`}
                >
                  <Icon className={`w-6 h-6 ${config.color}`} />
                </motion.div>

                <div className="flex-1">
                  <h3 className="text-xl font-bold text-neutral-900 mb-2">
                    {title}
                  </h3>
                  <p className="text-neutral-600 leading-relaxed">
                    {message}
                  </p>
                </div>
              </div>

              {requireInput && (
                <input
                  type="text"
                  value={inputValue}
                  onChange={(e) => setInputValue(e.target.value)}
                  placeholder={inputPlaceholder}
                  className="w-full px-4 py-3 border-2 border-neutral-200 rounded-xl mb-6 focus:border-primary-500 focus:ring-4 focus:ring-primary-100 transition-all"
                />
              )}

              <div className="flex gap-3">
                <motion.button
                  whileHover={{ scale: 1.02 }}
                  whileTap={{ scale: 0.98 }}
                  onClick={onClose}
                  className="flex-1 px-6 py-3 border-2 border-neutral-200 text-neutral-700 rounded-xl font-medium hover:bg-neutral-50 transition-colors"
                >
                  {cancelText}
                </motion.button>

                <motion.button
                  whileHover={{ scale: 1.02 }}
                  whileTap={{ scale: 0.98 }}
                  onClick={handleConfirm}
                  disabled={requireInput && !inputValue}
                  className={`flex-1 px-6 py-3 text-white rounded-xl font-medium transition-colors disabled:opacity-50 disabled:cursor-not-allowed ${config.buttonClass}`}
                >
                  {confirmText}
                </motion.button>
              </div>
            </motion.div>
          </div>
        </>
      )}
    </AnimatePresence>
  );
}
```

---

## 🎬 PAGE TRANSITIONS

### Layout with Page Transitions

**File**: `/app/layout.js`

```jsx
'use client';

import { motion, AnimatePresence } from 'framer-motion';
import { usePathname } from 'next/navigation';
import { pageTransition } from '@/lib/animations';

export default function RootLayout({ children }) {
  const pathname = usePathname();

  return (
    <html lang="en">
      <body>
        <AnimatePresence mode="wait">
          <motion.div
            key={pathname}
            initial="initial"
            animate="animate"
            exit="exit"
            variants={pageTransition}
          >
            {children}
          </motion.div>
        </AnimatePresence>
      </body>
    </html>
  );
}
```

---

## 📱 RESPONSIVE DESIGN GUIDELINES

### Breakpoints
```javascript
// tailwind.config.js
screens: {
  'sm': '640px',   // Mobile landscape
  'md': '768px',   // Tablet
  'lg': '1024px',  // Desktop
  'xl': '1280px',  // Large desktop
  '2xl': '1536px'  // Extra large
}
```

### Mobile-First Approach

```jsx
// Example responsive component
<div className="
  // Mobile (default)
  flex flex-col gap-4 p-4
  
  // Tablet
  md:flex-row md:gap-6 md:p-6
  
  // Desktop
  lg:gap-8 lg:p-8
  
  // Large Desktop
  xl:max-w-7xl xl:mx-auto
">
  {/* Content */}
</div>
```

### Touch-Friendly Targets

- Minimum tap target: 44x44px
- Add padding to buttons for easier tapping
- Swipe gestures for mobile navigation

```jsx
// Mobile menu with swipe
import { motion, PanInfo } from 'framer-motion';

const [isOpen, setIsOpen] = useState(false);

<motion.div
  drag="x"
  dragConstraints={{ left: 0, right: 0 }}
  dragElastic={0.2}
  onDragEnd={(e, info) => {
    if (info.offset.x > 100) {
      setIsOpen(true);
    } else if (info.offset.x < -100) {
      setIsOpen(false);
    }
  }}
>
  {/* Menu content */}
</motion.div>
```

---

## 🎯 PERFORMANCE OPTIMIZATION

### Image Optimization

```jsx
import Image from 'next/image';

<Image
  src="/images/lesson.jpg"
  alt="Lesson"
  width={600}
  height={400}
  placeholder="blur"
  blurDataURL="data:image/jpeg;base64,..."
  loading="lazy"
  className="rounded-xl"
/>
```

### Lazy Loading Components

```jsx
import dynamic from 'next/dynamic';

const HeavyComponent = dynamic(
  () => import('@/components/HeavyComponent'),
  { 
    loading: () => <LoadingSpinner />,
    ssr: false 
  }
);
```

### Animation Performance

```jsx
// Use transform and opacity for best performance
// ✅ Good
<motion.div
  animate={{ x: 100, opacity: 1 }}
/>

// ❌ Avoid
<motion.div
  animate={{ left: '100px', display: 'block' }}
/>
```

---

## 📋 IMPLEMENTATION CHECKLIST

### Setup Phase
- [ ] Install Next.js 14+ with App Router
- [ ] Setup Tailwind CSS with custom config
- [ ] Install Framer Motion
- [ ] Install React Spring
- [ ] Install Lottie React
- [ ] Install Chart.js / Recharts
- [ ] Setup API client with axios
- [ ] Configure environment variables

### Design System
- [ ] Create color palette
- [ ] Setup typography scale
- [ ] Define spacing system
- [ ] Create shadow system
- [ ] Setup animation library
- [ ] Create icon system

### Base Components (Priority 1)
- [ ] Button with variants
- [ ] Input with validation
- [ ] Select/Dropdown
- [ ] Modal/Dialog
- [ ] Toast notifications
- [ ] Loading spinners
- [ ] Skeleton loaders
- [ ] Status badges
- [ ] Empty states

### Layout Components (Priority 1)
- [ ] Header with navigation
- [ ] Sidebar (admin/trainer/student)
- [ ] Footer
- [ ] Breadcrumbs
- [ ] Page transitions

### Rooms Module (Priority 2)
- [ ] RoomCard
- [ ] RoomCalendar
- [ ] RoomBookingModal
- [ ] AvailabilitySlot
- [ ] RoomSearchFilter
- [ ] Room management pages

### Lessons Module (Priority 2)
- [ ] LessonCard
- [ ] LessonGrid
- [ ] LessonCreationWizard
- [ ] SlideEditor
- [ ] QuizBuilder
- [ ] TemplateUploader
- [ ] CategorySelector
- [ ] LessonFilters
- [ ] Lesson pages

### Trainers Module (Priority 3)
- [ ] TrainerCard
- [ ] TrainerProfileForm
- [ ] TrainerAvailabilityCalendar
- [ ] DiplomaUploader
- [ ] CVUploader
- [ ] PaymentHistory
- [ ] SessionList
- [ ] Trainer dashboard

### Students Module (Priority 3)
- [ ] Cart
- [ ] CartItem
- [ ] LessonCatalog
- [ ] EnrollmentCard
- [ ] ProgressTimeline
- [ ] CertificateCard
- [ ] DashboardWidgets
- [ ] Student pages

### Testing
- [ ] Unit tests for utilities
- [ ] Component tests with React Testing Library
- [ ] E2E tests with Playwright/Cypress
- [ ] Accessibility testing
- [ ] Performance testing
- [ ] Mobile testing (real devices)

### Documentation
- [ ] Component documentation (Storybook)
- [ ] API integration guide
- [ ] Style guide
- [ ] Animation guide
- [ ] Deployment guide

---

## 🚀 DEPLOYMENT

### Build Optimization

```bash
# Production build
npm run build

# Analyze bundle
npm run analyze
```

### Environment Setup

```env
# .env.production
NEXT_PUBLIC_API_URL=https://api.cs2i.org
NEXT_PUBLIC_CDN_URL=https://cdn.cs2i.org
```

### Performance Targets

- First Contentful Paint: < 1.5s
- Largest Contentful Paint: < 2.5s
- Time to Interactive: < 3.5s
- Lighthouse Score: > 90

---

**END OF FRONTEND SPECIFICATION**

This comprehensive guide provides everything needed to build a beautiful, modern, and highly interactive frontend for the CS2I Training Module. Follow the component specifications, use the animation library consistently, and always prioritize user experience with smooth transitions and delightful micro-interactions. 🎨✨