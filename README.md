# DeathNote iOS App

A native iOS application inspired by the Death Note manga, where users can create and manage a digital death note with names, descriptions, and scheduled times.

## 📱 About

DeathNote is an iOS app built with Swift and UIKit that simulates the iconic Death Note from the popular manga series. Users can add entries with victim names, death descriptions, and scheduled times, managing them in an elegant table view interface.

## 🚀 Features

- **Note Management**: Create, view, and delete death note entries
- **Detailed Entries**: Each note contains name, description, and scheduled time
- **Interactive Interface**: Swipe-to-delete functionality for note removal
- **Date Selection**: Built-in date picker for scheduling entries
- **Input Validation**: Form validation to ensure required fields are filled
- **Dynamic UI**: Auto-resizing text views and responsive layout
- **Pre-loaded Content**: Sample entries featuring famous personalities

## 🔧 Technical Implementation

### Architecture

- **Platform**: iOS (iPhone/iPad)
- **Language**: Swift 5
- **Framework**: UIKit
- **Pattern**: MVC (Model-View-Controller)
- **UI**: Storyboard-based interface with programmatic enhancements

### Core Features Implementation

#### Notes List Management

- Table view with custom cells displaying note information
- Swipe-to-delete functionality for removing entries
- Dynamic row height based on content
- Pre-populated sample data

#### Note Creation

- Form-based interface with text fields and text view
- Date picker integration for time selection
- Input validation and character limits (30 chars for name, 200 for description)
- Placeholder text with visual feedback
- Custom keyboard toolbar with done button

#### Data Flow

- Delegate pattern for passing new notes back to the main list
- In-memory data storage with array-based management
- Real-time UI updates when notes are added or removed

## 📝 Usage

### Running the Application

1. Open `deathNote_app.xcodeproj` in Xcode
2. Select target device (iPhone/iPad simulator or physical device)
3. Build and run the project

### Creating Death Notes

1. Launch the app to view the notes list
2. Tap the '+' button to add a new entry
3. Fill in the victim's name (required)
4. Add a description of the death (optional)
5. Select date and time using the built-in picker
6. Tap 'Done' to save the entry

### Managing Notes

- **View**: Scroll through the list to see all entries
- **Delete**: Swipe left on any entry and tap delete
- **Details**: Each cell shows name, description, and scheduled time

## 🔍 Sample Data

The app comes pre-loaded with sample entries featuring:

- Kurt Cobain
- Jiah Khan
- Vincent Van Gogh
- Marilyn Monroe
- Robin Williams

Each entry includes historically inspired quotes and future dates for demonstration purposes.

## 📋 Project Structure

```
deathNote_app/
├── AppDelegate.swift              # App lifecycle management
├── Controllers/
│   ├── NotesListVC.swift         # Main notes list controller
│   └── AddNoteVC.swift           # Add new note controller
├── Model/
│   └── DeathNote.swift           # Core data model
├── View/
│   ├── Base.lproj/
│   │   └── Main.storyboard       # Main interface layout
│   └── Cell/
│       └── DeathNoteCell.swift   # Custom table view cell
├── Protocols/
│   └── AddNewDeathNoteDelegate.swift  # Inter-controller communication
└── SupportingFiles/
    ├── Assets.xcassets/          # App icons and images
    └── Base.lproj/
        └── LaunchScreen.storyboard  # Launch screen
```

## 🛠️ Development Notes

- Built with Xcode and Interface Builder
- Uses delegation pattern for clean separation of concerns
- Implements table view data source and delegate protocols
- Custom UI components with programmatic styling
- Input validation and user feedback systems
- Memory-efficient in-app data management

---

_This project serves as a demonstration of iOS development fundamentals including table views, navigation controllers, form handling, and the delegate pattern._
