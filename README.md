

# Technical Documentation for Flutter Car Rental App

## Project Overview
The Flutter Car Rental app interacts with a backend API to provide car rental functionalities. It includes features for viewing car details, user registration, and booking cars. The app consists of the following Dart files:

- `Car.dart`
- `Cardetails.dart`
- `Form.dart`
- `Main.dart`
- `Sign_up.dart`

## Table of Contents
- [Technical Documentation for Flutter Car Rental App](#technical-documentation-for-flutter-car-rental-app)
  - [Project Overview](#project-overview)
  - [Table of Contents](#table-of-contents)
  - [Installation and Setup](#installation-and-setup)
  - [Dart Files Overview](#dart-files-overview)
    - [Car.dart](#cardart)
    - [Cardetails.dart](#cardetailsdart)
    - [Form.dart](#formdart)
    - [Main.dart](#maindart)
    - [Sign\_up.dart](#sign_updart)
  - [API Integration](#api-integration)
  - [User Interface](#user-interface)

## Installation and Setup

1. **Clone the repository:**

   ```bash
   git clone <repository_url>
   cd car_rental_flutter
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Run the app:**

   ```bash
   flutter run
   ```

## Dart Files Overview

### Car.dart

- **Purpose:** Defines the `Car` class representing car objects in the app.
- **Key Features:**
  - Fields: `id`, `brand`, `imageUrl`, `carEngineSize`, `price`, `description`, `availablity`.
  - Methods: Standard getter and setter methods.

### Cardetails.dart

- **Purpose:** Displays detailed information about a car.
- **Key Features:**
  - Shows car details such as image, brand, rental price, engine capacity, status, and description.
  - Includes a button for booking the car that navigates to the sign-up screen.

### Form.dart

- **Purpose:** Provides forms for user input, such as registration or booking forms.
- **Key Features:**
  - Form fields for capturing user data.
  - Validation logic and submission handling.

### Main.dart

- **Purpose:** The entry point of the application.
- **Key Features:**
  - Initializes the app and sets up routes.
  - Configures themes and application-wide settings.

### Sign_up.dart

- **Purpose:** Handles user sign-up and registration.
- **Key Features:**
  - Provides a user interface for new user registration.
  - Integrates with backend API for user creation and authentication.

## API Integration

- **API Endpoints:**
  - **Car Details:** Fetch car details from the backend API.
  - **User Registration:** Send registration data to the backend API.
  - **Booking:** Submit booking requests to the backend API.

- **Networking Package:** Use `http` or `dio` package for API communication.

## User Interface

- **MainCarDetail Widget:**
  - Displays car details, including images, brand, price, engine size, availability, and description.
  - Provides a button to book the car, which navigates to the sign-up screen.




