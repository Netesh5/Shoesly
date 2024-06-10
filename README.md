# Shoely App
An shoes Ecommerce application created with flutter and firebase.

## Package used
  cupertino_icons: ^1.0.6\
  equatable: ^2.0.5\
  flutter_bloc: ^8.1.5\
  dartz: ^0.10.1\
  get_it: ^7.7.0\
  firebase_core: ^3.0.0\
  lucide_icons: ^0.257.0\
  flutter_svg: ^2.0.10+1\
  firebase_storage: ^12.0.0\
  cloud_firestore: ^5.0.0\
  shimmer: ^3.0.0\
  cached_network_image: ^3.3.1\
  intl: ^0.19.0\
  flutter_pannable_rating_bar: ^2.7.2+1\
  syncfusion_flutter_sliders: ^24.2.9\
  uuid: ^4.4.0\
  flutter_slidable: ^3.1.0\

## Folder Structure 
The project follows the clean architecture principles. Below is an overview of the folder structure:


.
├── .dart_tool/  \
├── .idea/ \
├── android/ \
├── assets/\
├── build/\
├── ios/\
├── lib/\
│ ├── core/\
│ │ ├── constants/\
│ │ ├── cubit/\
│ │ ├── enums/\
│ │ ├── error/\
│ │ ├── extension/\
│ │ ├── injector/\
│ │ ├── navigation/\
│ │ ├── routes/\
│ │ ├── services/\
│ │ ├── themes/\
│ │ ├── usecases/\
│ │ ├── utils/\
│ │ └── widgets/\
│ ├── features/\
│ │ ├── cart/\
│ │ ├── filter_page/\
│ │ │ └── presentation/\
│ │ ├── homepage/\
│ │ └── review/\
│ ├── firebase_options.dart\
│ └── main.dart\
├── test/\
└── README.md\




### lib/core

This directory contains core functionalities and shared resources across the application.

- **constants**: Contains constant values used throughout the app.
- **cubit**: Contains Cubit state management classes.
- **enums**: Contains enumerations used across the app.
- **error**: Contains error handling classes.
- **extension**: Contains extension methods.
- **injector**: Contains dependency injection setup.
- **navigation**: Contains navigation-related classes.
- **routes**: Contains route definitions.
- **services**: Contains service classes, such as API clients or database services.
- **themes**: Contains theme and styling related classes.
- **usecases**: Contains use case classes, representing the business logic.
- **utils**: Contains utility classes and functions.
- **widgets**: Contains shared UI widgets.

### lib/features

This directory contains feature-specific code, divided into subdirectories for each feature.

- **cart**: Contains code related to the cart functionality.
- **filter_page/presentation**: Contains code related to the filter page's presentation layer.
- **homepage**: Contains code related to the homepage.
- **review**: Contains code related to reviews.

### lib/firebase_options.dart

Configuration file for Firebase.

### lib/main.dart

The main entry point of the application.

## Getting Started

Instructions on setting up your project locally.

### Prerequisites

- Flutter SDK
- Dart
- Any other dependencies

### Download Link 
```
https://drive.google.com/file/d/1GQyh06T5jSDlwOdHagogg4t72Nv700b6/view?usp=sharing
```

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/netesh5/Shoesly.git
    ```
2. Navigate to the project directory:
    ```bash
    cd repo
    ```
3. Install dependencies:
    ```bash
    flutter pub get
    ```

### Running the App

To run the app on an emulator or connected device, use:

```bash
flutter run
```

