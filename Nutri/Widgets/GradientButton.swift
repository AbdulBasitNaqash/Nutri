//
//  GradientButton.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//

import SwiftUI

struct GradientButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: {
            action() // Trigger the passed action
        }) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(Color.almostBlack)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .background(
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color.goldYellow,
                            Color.warningOrange,
                            Color.goldenAccent,
                            Color.darkGold
                        ]),
                        center: .center, // Gradient starts at the center
                        startRadius: 5,
                        endRadius: 300
                    )
                )
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.goldenAccent,
                                    Color.darkGold
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomLeading
                            ), lineWidth: 1
                        )
                )
        }
        .frame(maxWidth: 400)
    }
}

#Preview {
    GradientButton(title: "Test String") {
        // Nothing to do
    }
}
