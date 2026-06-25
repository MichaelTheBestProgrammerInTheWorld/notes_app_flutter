# Walkthrough - Flutter Notes App

I have successfully built a feature-rich, responsive Notes App following the MVVM architecture and Material 3 design principles.

## Features Accomplished

### 1. Business Logic & Note Management
- **Landing Screen:** Searchable list of notes with sections for **Pinned** and **Others**.
- **Note Entity:** Includes title, content (Quill Delta), timestamps, and multimedia attachments.
- **Persistence:** High-performance local storage using **Drift (SQLite)**.
- **Pinning:** Limit of 5 pinned notes at the top.
- **Archive:** Separate screen for archived notes with restore functionality.
- **Reordering:** Drag-and-drop reordering for unpinned notes using `SliverReorderableList`.
- **Deletion:** Swipe-to-delete with immediate confirmation dialog and "Delete All" functionality.

### 2. Rich Text & Multimedia
- **Editor:** Integrated `flutter_quill` for professional text styling (Bold, Italic, Colors, Fonts).
- **Multimedia:**
    - **Photos:** Up to 5 images using `wechat_assets_picker`.
    - **Video:** Support for 1 video attachment.
    - **Voice Notes:** In-app recording and playback using `record`.
    - **Files:** Support for picking 1 text/document file.
- **Search:** Unified search bar that scans titles, content, and **original filenames** of attachments.

### 3. Architecture & Design
- **MVVM:** Clean separation between View, ViewModel (Riverpod), and Data (Repositories/Drift).
- **DI:** Service locator pattern with `GetIt`.
- **Design System:** Modular package of widgets (`NoteCard`, `AppButton`, `ConfirmationDialog`) with a modern **Purple & Brown** Material 3 theme.
- **Responsiveness:** Adaptive layouts for Phone (List) and Tablet (Multi-column).
- **Localization:** Full support for **English** and **Arabic** (RTL) using `slang`.
- **Dark Mode:** Seamlessly adapts to system theme settings.

## Verification Summary

### Automated Tests
- **ViewModel Tests:** Unit tests for `NotesViewModel` verify:
    - Initial data fetching.
    - Adding notes and state refreshing.
    - Repository interactions.
- **Command:** `flutter test test/notes_view_model_test.dart`

### Manual Verification
- **UI/UX:** Verified responsive layout on both narrow and wide screen simulations.
- **Persistence:** Confirmed data remains after app restarts via Drift database.
- **RTL Support:** Switched to Arabic locale and verified layout flip.

## Project Structure
```text
lib/
  ├── core/                # Design System, DI, Localization, Utils
  ├── data/                # Drift Database, Repositories Impl, Mappers
  ├── domain/              # Entities, Repository Interfaces
  ├── view_models/         # Riverpod Notifiers
  └── views/               # Screen UI (Landing, Editor, Archive)
```
