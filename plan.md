# Dive Log App - Project Plan

## Project Description
A mobile application for divers to register and track their diving sessions. The app allows users to log comprehensive dive details including client information, diving operator, location, dive type, equipment, water conditions, dive details, and safety information. It provides a professional dive logbook that helps divers maintain detailed records for certification, safety, and regulatory compliance.

## App Architecture

### Core Structure
- **main.dart**: App entry point with Material App configuration
- **theme.dart**: Centralized theme and color definitions

### Data Layer
- **models/**: Data models for dive sessions, diver profile, dive sites
  - `dive_session.dart`: Comprehensive dive session data model with all required fields (see Dive Session Fields below)
  - `user_profile.dart`: User/diver profile information
  - `dive_operator.dart`: Diving operator information

- **services/**: Business logic and data operations
  - `dive_service.dart`: CRUD operations for dive sessions
  - `storage_service.dart`: Local storage management
  - `user_service.dart`: User profile management

### Presentation Layer
- **screens/**: Main app screens
  - `splash_screen.dart`: Initial loading and auth state check
  - `login_screen.dart`: User login with email/password
  - `register_screen.dart`: New user registration
  - `forgot_password_screen.dart`: Password reset functionality
  - `home_screen.dart`: Dashboard with recent dives and quick actions
  - `dive_list_screen.dart`: List view of all logged dives
  - `dive_detail_screen.dart`: Detailed view of a single dive session
  - `add_edit_dive_screen.dart`: Form to add or edit dive sessions
  - `profile_screen.dart`: User profile and settings
  - `statistics_screen.dart`: Dive statistics and analytics

- **widgets/**: Reusable UI components
  - `dive_card.dart`: Card widget to display dive summary
  - `stat_card.dart`: Widget for displaying statistics
  - `quick_action_card.dart`: Card widget for quick actions
  - `empty_state_card.dart`: Widget for empty states
  - `custom_text_field.dart`: Styled input fields

### Utilities
- **utils/**: Helper functions and constants
  - `constants.dart`: App-wide constants
  - `formatters.dart`: Data formatting utilities
  - `validators.dart`: Input validation functions

## Dive Session Fields

Each dive session will capture the following information:

### General Information
- **Cliente**: Client name
- **Operadora de Buceo**: Diving operator name
- **Dirección de la Operadora**: Operator address
- **Lugar de Buceo**: Dive location/site
- **Tipo de Buceo**: Dive type (Scuba, Asist. Superficie, Altura Geográfica, Saturación)
- **Nombre de Buzos**: Diver names (multiple divers can be registered)
- **Supervisor de Buceo**: Dive supervisor

### Equipment and Conditions
- **Tabla de Buceo**: Dive table used
- **Aparato Respiratorio**: Breathing apparatus type
- **Presión Cilindro**: Cylinder pressure
- **Tipo de Traje**: Suit type
- **Mezcla Utilizada**: Gas mixture used

### Water Conditions
- **Estado del Mar**: Sea state (Escala Beaufort)
- **Visibilidad**: Visibility
- **Temperatura Superior**: Surface temperature
- **Temperatura Agua**: Water temperature
- **Corriente Agua**: Water current
- **Tipo de Agua**: Water type (fresh, salt, etc.)

### Dive Details (Detalles de la Sesión)
- **Hora de Entrada**: Entry time
- **Máxima Profundidad**: Maximum depth
- **Tiempo de Intervalo en Superficie**: Surface interval time
- **Tiempo de Fondo**: Bottom time
- **Inicio de Descompresión**: Decompression start
- **Descompresión Completa**: Complete decompression
- **Tiempo Total de Inmersión**: Total immersion time
- **Hora de Salida**: Exit time

### Work and Safety
- **Descripción de Trabajo**: Work description
- **Descompresión Utilizada**: Decompression method used
- **Enfermedad o Lesión**: Illness or injury
- **Tiempo de Supervisión Acumulado**: Accumulated supervision time
- **Tiempo de Buceo Acumulado**: Accumulated dive time

## Tasks and Subtasks

### Phase 1: Project Setup and Data Models ✓
- [x] Initialize Flutter project
- [x] Set up theme configuration with ocean/diving color palette
- [x] Create data models
  - [x] Dive session model with toJson/fromJson
  - [x] User profile model
  - [x] Dive operator model
- [x] Set up local storage (shared_preferences dependency added)

### Phase 2: Core Services ✓
- [x] Implement DiveService
  - [x] Create dive session
  - [x] Read dive sessions (all, by date, by location)
  - [x] Update dive session
  - [x] Delete dive session
  - [x] Load sample data
- [x] Implement UserService
  - [x] Create/update user profile
  - [x] Get user profile
  - [x] Track total dives, total bottom time
- [x] Implement StorageService
  - [x] Save/load data from local storage
  - [x] Data serialization/deserialization
  - [x] Error handling for corrupted data

### Phase 3: UI Implementation
- [x] Home Screen ✓
  - [x] Display recent dives
  - [x] Show quick statistics (total dives, deepest dive, etc.)
  - [x] Quick action buttons
  - [x] Reusable widgets extracted (quick_action_card.dart, stat_card.dart, dive_card.dart, empty_state_card.dart)
- [x] Dive List Screen ✓
  - [x] Scrollable list of all dives
  - [x] Search and filter functionality (search by location, operator, description)
  - [x] Sort options (date, depth, duration)
  - [x] Advanced filters (location, operator, date range)
  - [x] Active filter chips with removal
  - [x] Empty states for no dives and no results
- [x] Add/Edit Dive Screen ✓
  - [x] General Information Section (Cliente, Operadora, Dirección, Lugar, Tipo de Buceo, Buzos, Supervisor)
  - [x] Equipment Section (Tabla, Aparato Respiratorio, Presión Cilindro, Tipo de Traje, Mezcla)
  - [x] Water Conditions Section (Estado del Mar, Visibilidad, Temperaturas, Corriente, Tipo de Agua)
  - [x] Dive Details Section (Horas, Profundidad, Tiempos, Descompresión)
  - [x] Work and Safety Section (Descripción, Enfermedad/Lesión, Tiempos Acumulados)
  - [x] Date/time pickers for entry/exit times
  - [x] Dropdown selectors for Tipo de Buceo, Estado del Mar, etc.
  - [x] Multiple diver name inputs with add/remove functionality
  - [x] Form validation for all required fields
  - [x] Save/Update functionality integrated with DiveService
  - [x] Modern, scrollable form layout with organized sections
- [x] Navigation Structure ✓
  - [x] Bottom Tab Navigation
    - [x] Home tab
    - [x] Dive List tab
    - [x] Statistics tab
    - [x] Profile tab
  - [x] Drawer Navigation
    - [x] User profile section with avatar and user info
    - [x] App navigation menu with selected state
    - [x] Settings menu item
    - [x] About dialog with app information
- [ ] Dive Detail Screen
  - [ ] Display all dive information
  - [ ] Edit option
  - [ ] Share dive log
  - [ ] Export single dive session (PDF/CSV)
- [ ] Profile Screen
  - [ ] User information
  - [ ] Certifications
  - [ ] Preferences/settings
- [ ] Statistics Screen
  - [ ] Total dives count
  - [ ] Total bottom time
  - [ ] Deepest dive
  - [ ] Favorite dive sites
  - [ ] Visual charts/graphs

### Phase 4: Firebase Integration
- [ ] Firebase Setup
  - [ ] Connect Firebase project in Dreamflow
  - [ ] Configure Firebase for target platforms
  - [ ] Add Firebase dependencies
  - [ ] Create AuthManager service for Firebase authentication
- [ ] Authentication Screens
  - [ ] Splash Screen
    - [ ] Check authentication state on app launch
    - [ ] Navigate to Login or Home based on auth state
    - [ ] Display app logo and loading indicator
  - [ ] Login Screen
    - [ ] Email/password input fields
    - [ ] Form validation (email format, password requirements)
    - [ ] Login button with loading state
    - [ ] "Forgot Password?" link
    - [ ] "Don't have an account? Register" link
    - [ ] Error handling and user feedback
  - [ ] Register Screen
    - [ ] User information fields (name, email, password, confirm password)
    - [ ] Form validation (password match, email format, required fields)
    - [ ] Register button with loading state
    - [ ] "Already have an account? Login" link
    - [ ] Terms and conditions acceptance
    - [ ] Error handling and user feedback
  - [ ] Forgot Password Screen
    - [ ] Email input field
    - [ ] Send reset email button
    - [ ] Success confirmation message
    - [ ] Back to login link
    - [ ] Error handling
- [ ] Firebase Authentication Backend
  - [ ] Implement user registration with Firebase Auth
  - [ ] Implement user login/logout
  - [ ] Email/password authentication
  - [ ] Password reset functionality
  - [ ] Email verification (optional)
  - [ ] Session management and persistence
- [ ] Cloud Firestore Database
  - [ ] Migrate data models to Firestore
  - [ ] Update DiveService to use Firestore
  - [ ] Update UserService to use Firestore
  - [ ] Implement real-time sync
  - [ ] Data security rules
- [ ] Offline Support and Sync
  - [ ] Use local storage (SharedPreferences) when offline or no internet connection
  - [ ] Detect internet connectivity status
  - [ ] Queue dive sessions created/updated while offline
  - [ ] Automatically sync queued data to Firestore when internet connection is restored
  - [ ] Handle sync conflicts and merge strategies
  - [ ] Show sync status indicator in UI
- [ ] Export Dive Logs (Mandatory)
  - [ ] Export single dive session to PDF format (from Dive Detail Screen)
  - [ ] Export single dive session to CSV format (from Dive Detail Screen)
  - [ ] Implement sharing/download functionality for single dive
- [ ] Additional Features (Optional)
  - [ ] Batch export from Dive List Screen (export filtered/all dives to PDF/CSV)
  - [ ] Dive buddy tracking
  - [ ] GPS integration for dive sites
  - [ ] Dive planning tools
  - [ ] Safety stop timer
  - [ ] Decompression calculator

### Phase 5: Enhanced Features
- [ ] Reusable Widgets
  - [ ] DiveCard component
  - [ ] StatCard component
  - [ ] Custom form fields
- [ ] Data Validation
  - [ ] Input validators
  - [ ] Safety checks (depth limits, etc.)
- [ ] Error Handling
  - [ ] User-friendly error messages
  - [ ] Logging with debugPrint

### Phase 6: Polish and Optimization
- [ ] UI/UX refinement
  - [ ] Consistent styling
  - [ ] Smooth transitions
  - [ ] Loading states
  - [ ] Empty states
- [ ] Testing
  - [ ] Test all CRUD operations
  - [ ] Test data persistence
  - [ ] Test edge cases
- [ ] Performance optimization
  - [ ] Efficient list rendering
  - [ ] Optimize image loading
- [ ] Platform permissions
  - [ ] Camera access (for photos)
  - [ ] Storage access

### Phase 7: Payments and Subscriptions
- [ ] Payment Integration Setup
  - [ ] Choose payment provider (Stripe recommended for Flutter)
  - [ ] Set up payment provider account and API keys
  - [ ] Add payment dependencies (e.g., stripe_flutter, in_app_purchase)
- [ ] Subscription Management
  - [ ] Define subscription tiers (e.g., Free, Pro, Premium)
  - [ ] Implement subscription model in data layer
  - [ ] Create subscription service for managing user subscriptions
  - [ ] Store subscription status in Firestore
- [ ] Payment UI
  - [ ] Create subscription plans screen
  - [ ] Implement payment checkout flow
  - [ ] Add payment method management screen
  - [ ] Display current subscription status in profile
- [ ] Payment Processing
  - [ ] Integrate Stripe payment processing
  - [ ] Handle successful payments
  - [ ] Handle failed payments and retries
  - [ ] Implement webhook handling for subscription events
- [ ] Feature Gating
  - [ ] Implement feature restrictions based on subscription tier
  - [ ] Add upgrade prompts for premium features
  - [ ] Handle subscription expiration and renewals
- [ ] Payment Security
  - [ ] Secure API key storage
  - [ ] Implement server-side payment validation
  - [ ] Add receipt verification

## Firestore Database Schema

### Collections Structure

#### 1. **users** Collection
Stores user profile and authentication information.

**Document ID**: Firebase Auth UID (auto-generated by Firebase Auth)

**Fields**:
```
{
  "id": string,                      // Same as document ID (Firebase Auth UID)
  "name": string,                    // User's full name
  "email": string,                   // User's email address (unique)
  "certificationLevel": string?,     // Certification level (e.g., "Open Water", "Advanced", "Divemaster")
  "certificationNumber": string?,    // Certification ID number
  "certificationDate": timestamp?,   // Date of certification
  "totalDives": number,              // Total count of logged dives (calculated)
  "totalBottomTime": number,         // Total bottom time in minutes (calculated)
  "deepestDive": number,             // Deepest dive depth in meters (calculated)
  "createdAt": timestamp,            // Account creation timestamp
  "updatedAt": timestamp             // Last profile update timestamp
}
```

**Indexes**:
- `email` (ascending) - for user lookup by email
- `createdAt` (descending) - for user registration analytics

**Security Rules**:
- Users can only read/write their own document
- Email field is immutable after creation
- Authentication required for all operations

---

#### 2. **dive_sessions** Collection
Stores individual dive session records.

**Document ID**: Auto-generated by Firestore

**Fields**:
```
{
  "id": string,                            // Same as document ID
  "userId": string,                        // Reference to users collection (Firebase Auth UID)
  
  // General Information
  "cliente": string,                       // Client name
  "operadoraBuceo": string,                // Diving operator name
  "direccionOperadora": string,            // Operator address
  "lugarBuceo": string,                    // Dive location/site name
  "tipoBuceo": string,                     // Dive type: "Scuba", "Asist. Superficie", "Altura Geográfica", "Saturación"
  "nombreBuzos": array<string>,            // List of diver names participating
  "supervisorBuceo": string,               // Dive supervisor name
  
  // Water Conditions
  "estadoMar": number,                     // Sea state (Beaufort scale 0-12)
  "visibilidad": number,                   // Visibility in meters
  "temperaturaSuperior": number,           // Surface temperature in Celsius
  "temperaturaAgua": number,               // Water temperature in Celsius
  "corrienteAgua": string,                 // Water current description
  "tipoAgua": string,                      // Water type: "Dulce", "Salada", "Salobre"
  
  // Dive Details
  "horaEntrada": timestamp,                // Entry time (dive start)
  "maximaProfundidad": number,             // Maximum depth reached in meters
  "tiempoIntervaloSuperficie": number,     // Surface interval time in minutes
  "tiempoFondo": number,                   // Bottom time in minutes
  "inicioDescompresion": timestamp?,       // Decompression start time (optional)
  "descompresionCompleta": timestamp?,     // Decompression complete time (optional)
  "tiempoTotalInmersion": number,          // Total immersion time in minutes
  "horaSalida": timestamp,                 // Exit time (dive end)
  
  // Work and Safety
  "descripcionTrabajo": string,            // Description of work performed
  "descompresionUtilizada": string,        // Decompression method used
  "enfermedadLesion": string?,             // Illness or injury notes (optional)
  "tiempoSupervisionAcumulado": number,    // Accumulated supervision time in hours
  "tiempoBuceoAcumulado": number,          // Accumulated dive time in hours
  
  // Metadata
  "createdAt": timestamp,                  // Record creation timestamp
  "updatedAt": timestamp                   // Last update timestamp
}
```

**Indexes**:
- `userId` (ascending) + `horaEntrada` (descending) - for user's dives sorted by date
- `userId` (ascending) + `lugarBuceo` (ascending) - for filtering by location
- `userId` (ascending) + `operadoraBuceo` (ascending) - for filtering by operator
- `userId` (ascending) + `tipoBuceo` (ascending) - for filtering by dive type
- `userId` (ascending) + `maximaProfundidad` (descending) - for deepest dives
- `horaEntrada` (descending) - for recent dives across all users (admin view)

**Security Rules**:
- Users can only read/write their own dive sessions (where userId == auth.uid)
- `userId` field is immutable after creation
- Authentication required for all operations

---

#### 3. **dive_operators** Collection (Future Enhancement)
Stores diving operator information for autocomplete and data consistency.

**Document ID**: Auto-generated by Firestore

**Fields**:
```
{
  "id": string,                      // Same as document ID
  "name": string,                    // Operator business name
  "address": string,                 // Physical address
  "phone": string?,                  // Contact phone number
  "email": string?,                  // Contact email address
  "createdAt": timestamp,            // Record creation timestamp
  "updatedAt": timestamp             // Last update timestamp
}
```

**Indexes**:
- `name` (ascending) - for autocomplete search

**Security Rules**:
- Read: all authenticated users
- Write: admin only (or users can submit for approval)

---

### Data Relationships

```
users (1) ──< dive_sessions (many)
  │
  └─ userId field in dive_sessions references user document ID
```

### Query Patterns

**Common Queries:**

1. **Get all dives for a user (most recent first)**:
   ```dart
   collection('dive_sessions')
     .where('userId', isEqualTo: currentUserId)
     .orderBy('horaEntrada', descending: true)
   ```

2. **Get dives by location**:
   ```dart
   collection('dive_sessions')
     .where('userId', isEqualTo: currentUserId)
     .where('lugarBuceo', isEqualTo: location)
     .orderBy('horaEntrada', descending: true)
   ```

3. **Get dives within date range**:
   ```dart
   collection('dive_sessions')
     .where('userId', isEqualTo: currentUserId)
     .where('horaEntrada', isGreaterThanOrEqualTo: startDate)
     .where('horaEntrada', isLessThanOrEqualTo: endDate)
     .orderBy('horaEntrada', descending: true)
   ```

4. **Get deepest dives**:
   ```dart
   collection('dive_sessions')
     .where('userId', isEqualTo: currentUserId)
     .orderBy('maximaProfundidad', descending: true)
     .limit(10)
   ```

5. **Search dives by text** (requires client-side filtering or Algolia integration):
   - Search in: `lugarBuceo`, `operadoraBuceo`, `descripcionTrabajo`

### Aggregate Calculations

**User Statistics** (calculated in real-time or cached in user document):
- `totalDives`: Count of dive_sessions where userId == currentUserId
- `totalBottomTime`: Sum of tiempoFondo for all user's dives
- `deepestDive`: Max of maximaProfundidad for all user's dives

**Update Strategy**:
- Option 1: Calculate on-demand when loading statistics screen
- Option 2: Update user document using Cloud Functions on dive_session write
- Option 3: Hybrid - cache in user doc, recalculate periodically

### Data Migration Notes

**From Local Storage to Firestore**:
1. Read all dive sessions from SharedPreferences
2. For each dive session:
   - Link to authenticated user's UID (set userId field)
   - Convert DateTime to Firestore Timestamp
   - Upload to `dive_sessions` collection
3. Update user profile statistics
4. Clear local storage after successful migration

**Timestamp Handling**:
- Local: `DateTime.parse(json['horaEntrada'])` → ISO 8601 string
- Firestore: `Timestamp.fromDate(dateTime)` → Firestore Timestamp object
- Display: `timestamp.toDate()` → Dart DateTime

### Offline Support Strategy

1. **Firestore Offline Persistence**: Enable by default
   ```dart
   FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
   ```

2. **Write Queue**: Firestore automatically queues writes when offline

3. **Sync Indicator**: Listen to snapshot metadata
   ```dart
   snapshot.metadata.isFromCache // true if offline
   ```

4. **Conflict Resolution**: Last-write-wins (Firestore default)

---

## Technical Stack
- **Framework**: Flutter (latest version)
- **State Management**: StatefulWidget (can upgrade to Provider/Riverpod if needed)
- **Local Storage**: shared_preferences package (Phase 1-3, 5-6)
- **Cloud Backend**: Firebase (Phase 4)
  - Firebase Authentication for user management
  - Cloud Firestore for cloud database
- **Payments**: Stripe or In-App Purchases (Phase 7)
  - Subscription management
  - Payment processing
  - Receipt validation
- **Data Format**: JSON (local), Firestore documents (cloud)
- **Platform Support**: Android, iOS, Web

## Design Guidelines
- Follow Material Design principles
- Use centralized theme colors
- Responsive layouts for different screen sizes
- Intuitive navigation with bottom navigation bar
- Ocean/diving themed color palette (blues, teals)
- Clear typography and adequate spacing
- Accessibility considerations

## Notes
- Phases 1-3, 5-6: Use local storage with shared_preferences
- Phase 4: Migrate to Firebase for cloud storage and authentication
- Include sample dive data for demonstration (Phases 1-5)
- Focus on offline-first functionality initially
- Ensure data persistence across app restarts
- Follow DRY principles and create reusable components
- Firebase integration will require connecting Firebase project in Dreamflow UI before implementation
