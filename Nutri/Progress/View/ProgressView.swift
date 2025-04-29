//
//  ProgressView.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//

import SwiftUI

struct ProgressView: View {
    @Binding var navigationPath: NavigationPath
    @State private var isRotating = 0.0
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Image("nutrak_logo")
            .padding(.top, 50)
            
            Spacer()
            
            Circle()
                .stroke(
                    AngularGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.warningOrange.opacity(0.1), location: 0.1),
                            .init(color: Color.successGreen, location: 1.0)
                        ]),
                        center: .center,
                        startAngle: .degrees(-90),
                        endAngle: .degrees(270)
                    ),
                    lineWidth: 18
                )
                .frame(width: 144, height: 144)
                .rotationEffect(.degrees(isRotating))
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        isRotating = 360
                    }
                }
                .padding(.bottom, 50)
            
            Text("Scanning in progress...")
                .padding(.bottom, 20)
            
            VStack(spacing: 20) {
                // Progress Bar
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .frame(height: 10)
                            .foregroundColor(Color.gray.opacity(0.2))
                        
                        Capsule()
                            .frame(width: min(geometry.size.width * progress, geometry.size.width), height: 10)
                            .foregroundColor(Color.successGreen)
                            .animation(.easeInOut, value: progress)
                    }
                }
                .frame(height: 10)
                .padding(.horizontal, 30)

                // Percentage Text
                Text(String(format: "%.0f%%", progress * 100))
                    .font(.headline)
                    .fontWeight(.medium)
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                    if self.progress < 1.0 {
                        self.progress += 0.01
                    } else {
                        timer.invalidate()
                        navigationPath.append("nutrition")
                    }
                }
            }
            Spacer()
        }
        
    }
}

#Preview {
    ProgressView(navigationPath: .constant(NavigationPath()))
}
