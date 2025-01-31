# ride_hailing_app

A new Flutter project.

## Documentation

This project is a starting point for a Flutter application.

### Steps for Login:

- email: eve.holt@reqres.in

- password: citylicka

## Ride-Hailing App Documentation and Explanation:

### Code Quality

GetX for State Management, Dependency Injection, and Navigation
State Management: GetX is used to manage authentication, ride states, and driver searching efficiently.
Dependency Injection: Services like authentication, map handling, and ride management are injected using GetX controllers to maintain a single source of truth.

Navigation: GetX simplifies navigation throughout the app, making transitions seamless and reducing unnecessary boilerplate code.
Clean and Modular Code Structure
Feature-based folder structure ensures modularity and maintainability.

Separation of concerns: Controllers handle logic, views handle UI, and services handle API calls.
Reusable widgets and modals like Driver List, Ride Info, and Notification Modal enhance reusability.

2. Functionality
   The app covers all required features and implements additional enhancements:

## Core Features

- Login & Sign-Up
- Users can register and log in using their email and password.
- Sign-up requires Name, Email, Phone Number, and Password.
- Authentication & Navigation with GetX
- User authentication state is managed via GetX.
- Navigation routes handle login, signup, and dashboard flow efficiently.
- Map Display & Location Handling
- Displays a map using Flutter Maps.
- Fetches and shows the user’s current location.
- Users can select pickup and drop-off locations by tapping on the map.

## Finding and Assigning Drivers

- A mock list of available drivers is generated dynamically.
- A driver is assigned within 15 seconds; otherwise, users can retry or cancel the request.
- Ride Progression and Completion
- The app displays driver details (name, vehicle type, rating) once found.
- The ride progresses until the drop-off location is reached.
  The user marks the ride as completed after reaching the destination.

## Ride History Management

- Users can view ride history categorized as Completed, Canceled, or In Progress.

## Local Notifications

- Users receive notifications when a driver is found and when the ride is near completion.
- Modals for Better UX
- Location & Instruction Modal: Guides users in selecting locations.
- Driver List & Driver Info Modal: Shows available drivers.
- Ride Info Modal: Displays ride details during the trip.

## UI/UX

- Intuitive & Visually Appealing Design
- Material Design principles followed to ensure a familiar experience.
- Consistent color scheme and typography for brand identity.
- User-friendly buttons and icons for navigation.

- Smooth Transitions & Animations:
  Animated page transitions using GetX for a smoother experience.
  Progress indicators during driver search for better feedback.
  Animated markers on the map to show driver movement dynamically.

## Performance

- Efficient State Handling & Real-time Updates
- GetX ensures reactive state management, preventing unnecessary rebuilds.
- Optimized API calls and caching minimize network usage.
- Efficient polling mechanism for driver searching ensures quick responses.
- Minimal Lag or Delays
- Asynchronous operations using Futures and Streams ensure smooth execution.
- Lightweight assets and lazy loading enhance startup performance.

## Running the App

Prerequisites:

- Install Flutter SDK (latest stable version)
- Enable location permissions on your device/emulator

## Installation:

flutter pub get

flutter run

## App Architecture

- Presentation Layer: Screens, widgets, and modals.
- Business Logic Layer: GetX controllers handling user actions and state updates.
- Data Layer: Services managing API calls and local storage.

## Additional Implementations

- Local Notifications with awesome_notifications
  Sends local push notifications for driver assignment and ride progress.
- Custom App Icon using flutter_launcher_icons
- Updates the app icon using the Flutter Launcher Icons package.
  This documentation provides a structured breakdown of the app, ensuring clarity on implementation and best practices.
