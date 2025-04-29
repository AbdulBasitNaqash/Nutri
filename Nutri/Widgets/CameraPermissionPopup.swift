//
//  CameraPermissionPopup.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//
import SwiftUI

struct CameraPermissionPopup: View {
    var onClose: () -> Void
    var allowAction: () -> Void
    var dontAllowAction: () -> Void
    
    var body: some View {
        VStack(spacing: -5) {
            // Top bar with Close Button
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        onClose()
                    }
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.mediumGray)
                }
            }

            VStack(spacing: 20) {
                Image("camera_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80)

                Text("Allow “Nutrition Scanning” to use your camera?")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.almostBlack)
                    .multilineTextAlignment(.center)

                Text("You can change this setting in the App section of your device Settings.")
                    .font(.system(size: 14))
                    .foregroundColor(Color.darkGray)
                    .multilineTextAlignment(.center)

                GradientButton(title: "Allow Access") {
                    allowAction()
                }

                PlainBorderButton(title: "Don't Allow") {
                    dontAllowAction()
                }
            }
        }
        .padding(24)
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxWidth: 400) // Limit width on iPad
    }
}


#Preview {
    CameraPermissionPopup(onClose: {
        // Nothing here
    }, allowAction: {
        // Nothing here
    }, dontAllowAction: {
        // Nothing /here
    })
}
