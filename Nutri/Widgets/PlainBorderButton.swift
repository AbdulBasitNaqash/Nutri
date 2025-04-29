//
//  PlainBorderButton.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//

import SwiftUI

struct PlainBorderButton: View {
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
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.lightGrayBackground, lineWidth: 1)
                )
        }
    }
}

#Preview {
    PlainBorderButton(title: "Test String") {
        // Nothing to do
    }
}
