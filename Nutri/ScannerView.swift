//
//  ScannerView.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//

import SwiftUI

struct ScannerView: View {
    @State private var showPopup = true
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            GeometryReader { screenGeometry in
                ZStack {
                    // Background Image
                    Image("ovelay")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    if showPopup {
                        // CENTERED POPUP
                        CameraPermissionPopup(onClose: {
                            showPopup = false
                        }, allowAction: {
                            navigationPath.append("camera")
                        }, dontAllowAction: {
                            // todo
                        })
                        .frame(maxWidth: 400)
                        .padding(30)
                        .transition(.scale)
                    }
                }
                .frame(width: screenGeometry.size.width, height: screenGeometry.size.height)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        showPopup.toggle()
                    }
                }
            }
            .navigationDestination(for: String.self) { route in
                if route == "camera" {
                    CameraView(navigationPath: $navigationPath)
                        .navigationBarHidden(true)
                        .ignoresSafeArea()
                } else if route == "progress" {
                    ProgressView(navigationPath: $navigationPath)
                        .navigationBarHidden(true)
                        .ignoresSafeArea()
                } else if route == "nutrition" {
                    NutritionView(navigationPath: $navigationPath)
                        .navigationBarHidden(true)
                        .ignoresSafeArea()
                } else if route == "streak" {
                    StreakView()
                        .navigationBarHidden(true)
                        .ignoresSafeArea()
                }
                    
            }
        }
    }
}

#Preview {
    ScannerView()
}
