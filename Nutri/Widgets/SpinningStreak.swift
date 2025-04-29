//
//  SpinningStreak.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import SwiftUI

struct SpinningStreak: View {
    @State private var rotation: Double = 0
    let value: String
    
    var body: some View {
        ZStack {
            Image("streak")
            Text(value)
                .padding(.top, 30)
                .font(.system(size: 52, weight: .bold))
        }
        .padding(.bottom, 5)
        .rotation3DEffect(
            .degrees(rotation),
            axis: (x: 0.0, y: 0.1, z: 0.0)
        )
        .onAppear {
            animateSequence()
        }
    }

    func animateSequence() {
        // Slow start
        withAnimation(.easeInOut(duration: 1)) {
            rotation += 90
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Fast spin
            withAnimation(.easeIn(duration: 0.6)) {
                rotation += 360 * 5
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                // Slow stop
                withAnimation(.easeOut(duration: 1.2)) {
                    rotation += 270
                }
            }
        }
    }
}



#Preview {
    SpinningStreak(value: "5")
}
