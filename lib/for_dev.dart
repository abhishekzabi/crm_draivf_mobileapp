////////**************************file heirarchy*************************** */


// lib/
// │── main.dart                  # Entry point of the app
// │
// ├── core/                      # Global utilities & constants
// │   ├── constants/             # App-wide constants (strings, colors, styles)
// │   ├── utils/                 # Helper functions (formatters, validators, etc.)
// │   ├── theme/                 # Theme data (light, dark, typography)
// │   └── routes/                # Route management / navigation
// │
// ├── data/                      # Data layer (API, local storage, models)
// │   ├── models/                # Data models (User, Product, etc.)
// │   ├── services/              # External services (API, Firebase, DB)
// │   ├── repositories/          # Repository pattern (combine services + local DB)
// │   └── local/                 # Shared preferences / Hive / SQLite
// │
// ├── domain/                    # Business logic layer (optional for bigger apps)
// │   ├── entities/              # Pure domain objects (no framework dependency)
// │   ├── usecases/              # Application-specific business logic
// │   └── interfaces/            # Abstract repos / contracts
// │
// ├── presentation/              # UI Layer
// │   ├── pages/                 # Screens (HomePage, LoginPage, etc.)
// │   │   └── home/
// │   │       ├── home_page.dart
// │   │       ├── widgets/       # Widgets only for this page
// │   │       └── controller.dart # Page-specific controller (if using GetX/MVC)
// │   │
// │   ├── widgets/               # Reusable shared widgets (buttons, loaders, etc.)
// │   ├── animations/            # Custom animations / transitions
// │   └── dialogs/               # Reusable dialogs, bottom sheets, snackbars
// │
// ├── state/                     # State management (depends on what you use)
// │   ├── blocs/                 # If using BLoC
// │   ├── providers/             # If using Provider
// │   └── controllers/           # If using GetX
// │
// └── config/                    # Environment configs
//     ├── environment.dart       # dev, staging, prod
//     └── flavor.dart            # Multiple app flavors
