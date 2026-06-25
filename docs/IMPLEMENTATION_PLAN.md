# Implementation Plan - Flutter Notes App

A feature-rich notes app with multimedia support, rich text styling, and cross-platform responsive design.

## User Decisions & Clarifications

- **Multimedia Search:** Search functionality will use the **original filename** for multimedia attachments.
- **Swipe to Delete:** A **confirmation dialog** will appear immediately upon swiping to delete a note.
- **Reference Doc:** This plan is stored in `docs/IMPLEMENTATION_PLAN.md` for future maintenance.

## Business Requirements

### 1. Core Features
- **Landing Screen:** Displays a list of existing notes.
- **Add Note Screen:** Floating Action Button (FAB) on the landing screen to navigate here.
- **Note Entity:**
    - **Required Fields:** `index` (auto), `title` (input), `content` (input), `created_at` (auto), `updated_at` (auto).
    - **Multimedia (Optional):** Up to 5 photos, 1 video, 1 voice note, 1 text file.
- **Persistence:** All data must be stored in local persistent storage.

### 2. Note Management
- **Delete Actions (Hard Delete with Confirmation):**
    - **Single Note:** Swipe to delete on the list.
    - **Multi-select:** Select multiple notes and delete.
    - **Delete All:** Single button to clear all notes.
- **Edit Note:** Click a note in the list to edit. Changes are **only saved** when the user clicks the "Save" button.
- **Pinning:** Pin/unpin up to **5 notes** at the top of the list.
- **Reordering:** Drag-and-drop support for unpinned notes.
- **Archive:** Move notes to/from archive. A separate Archive screen allows viewing and restoring notes.

### 3. Search & Content
- **Search:** Search box in the landing screen. Must search by `title`, `content`, `index`, `date`, and `attachment original filename`.
- **Rich Text Editor:** The content section must support:
    - Text color & background color.
    - Text styles (bold, italic, underline, strike-through).
    - Font selection & size.

### 4. Localization & UI
- **Languages:** Support for English and Arabic.
- **Dark Mode:** Full support for system-wide dark mode toggle.
- **Responsiveness:** Single design system that fits both phones and tablets perfectly.

## Tech Stack

> [!IMPORTANT]
> - **State Management & DI:** `riverpod` (primary) + `get_it` (for service locator pattern outside the widget tree).
> - **Database:** `drift` (SQLite) for structured, type-safe persistence.
> - **Rich Text:** `flutter_quill` for advanced text styling.
> - **Multimedia:** `wechat_assets_picker` for photos/videos, `record` for voice notes, and `file_picker` for general files.
> - **Localization:** `slang` (JSON-based, type-safe localization).
> - **Design System:** Custom Material 3 theme using `FlexColorScheme` for beautiful, consistent colors in light/dark modes.

## Proposed Changes

### 1. Architecture & Package Structure
We will follow a Clean Architecture-inspired MVVM pattern within a single module.

```text
lib/
  ├── core/                # Shared utilities, design system, constants
  │   ├── design_system/   # Themes, colors, styles, shared widgets
  │   ├── di/              # Dependency injection setup
  │   ├── l10n/            # Localization files (slang)
  │   └── utils/           # Extension methods, helpers
  ├── data/                # Data layer
  │   ├── database/        # Drift database definition and DAOs
  │   ├── models/          # Data entities and DTOs
  │   └── repositories/    # Repository implementations
  ├── domain/              # Domain layer (Interfaces and pure logic)
  │   ├── entities/        # Domain entities
  │   └── repositories/    # Repository interfaces
  ├── view_models/         # Logic layer (Riverpod providers)
  └── views/               # UI layer (Screens and components)
      ├── landing/
      ├── note_detail/
      ├── archive/
      └── search/
```

---

### 2. Core & Design System
Implementation of the foundational components.

#### [theme.dart](file:///D:/PersonalProjects/notes_app_flutter/lib/core/design_system/theme.dart)
- Define Light and Dark themes using Material 3.
- Use `FlexColorScheme` for harmonious color palettes.
- Implement responsive typography that scales reasonably.

#### [app_widgets.dart](file:///D:/PersonalProjects/notes_app_flutter/lib/core/design_system/app_widgets.dart)
- Shared UI components: `NoteCard`, `AppButton`, `ConfirmationDialog`, `AttachmentTile`.

---

### 3. Data Layer (Persistence)

#### [app_database.dart](file:///D:/PersonalProjects/notes_app_flutter/lib/data/database/app_database.dart)
- `Drift` database schema.
- Table `Notes`: `id`, `title`, `content` (JSON for Quill), `created_at`, `updated_at`, `is_pinned`, `is_archived`, `order_index`.
- Table `Attachments`: `id`, `note_id`, `type` (image, video, audio, file), `path`, `name` (original filename).

---

### 4. Logic Layer (ViewModels)

#### [notes_view_model.dart](file:///D:/PersonalProjects/notes_app_flutter/lib/view_models/notes_view_model.dart)
- `NotesNotifier` (AsyncNotifier) to manage the list of notes.
- Methods: `addNote`, `updateNote`, `deleteNote`, `togglePin`, `archiveNote`, `reorderNotes`.
- Handles search logic (title, content, index, date, attachment filename).

---

### 5. UI Layer (Views)

#### [landing_screen.dart](file:///D:/PersonalProjects/notes_app_flutter/lib/views/landing/landing_screen.dart)
- List of notes with pinned section (max 5).
- Drag and drop functionality using `ReorderableListView` (excluding pinned).
- Search bar integration.

#### [note_editor_screen.dart](file:///D:/PersonalProjects/notes_app_flutter/lib/views/note_detail/note_editor_screen.dart)
- `FlutterQuill` editor for text styling (bold, italic, colors, etc.).
- Multimedia attachment management UI (up to 5 photos, 1 video, 1 voice note, 1 text file).
- Voice recording and in-app playback.
- Save button (manual save).

---

## Verification Plan

### Automated Tests
- **Unit Tests:**
    - Test `NotesViewModel` logic (adding, pinning limits, reordering).
    - Test Repository mapping between DTOs and Entities.
- **Command:** `flutter test`

### Manual Verification
- **UI/UX:** Verify responsive layout on Phone and Tablet emulators.
- **Dark Mode:** Toggle system theme and verify UI adaptivity.
- **Localization:** Switch language (EN/AR) and verify RTL layout.
- **Multimedia:** Record audio, pick images/videos, and verify playback/display.
- **Persistence:** Close and reopen the app to ensure data persists correctly.
