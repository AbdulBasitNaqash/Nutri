# Specs:
* Uses SwiftUI.
* Uses MVVM Architecture.
* Supports iOS 16 and up.
* Only one variant of Assets added for demo.
* No third party library used.
* Just open the Nutri.xcodeproj.

# Run on the iPhone device

# Instructions:
1. Update the bundle identifier.
2. On the Popup screen, tap the 'X' button or background to dismiss the popup.
3. Tap on the background again to view the popup.
4. Tap on "Allow Access" to navigate to the camera view.
5. Allow the camera permission.
6. Tap the capture button to navigate to the Progress view.
7. Wait till the progress is 100%, it will automatically navigate to Nutrition view.
8. Scroll down and tap on either the chart or "Save to Daily log" button to navigate to the Streaks view.


# Approach taken
* After thoroughly going through the document and the designs, took up the decision to use MVVM architecture.
* Separated each module in groups for easy reading.
* Created reusable widgets.
