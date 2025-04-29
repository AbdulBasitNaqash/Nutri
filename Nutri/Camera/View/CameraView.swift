//
//  CameraView.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//

//
//  CameraView.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var navigationPath: NavigationPath
    @State private var session = AVCaptureSession()
    @State private var output = AVCapturePhotoOutput()
    
    var body: some View {
        ZStack {
            CameraPreview(session: session)
                .ignoresSafeArea()
            
            // Dark overlay with transparent rectangle
            Rectangle()
                .fill(Color.black.opacity(0.6))
                .ignoresSafeArea()
                .overlay(
                    Rectangle()
                        .frame(width: 250, height: 250)
                        .blendMode(.destinationOut)
                )
            
                .compositingGroup()
            
            VStack {
                // Top buttons
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // todo
                    }) {
                        Image(systemName:"bolt.slash.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(10)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
                
                CameraHeaderView(
                    iconName: "scan_icon", title: "Scan Your Food", subtitle: "Ensure your food is well-lit and in focus for the most accurate scan."
                )
                .padding(.top, 20)
                
                Spacer()
                
                // Scanner corners
                ScannerCorners()
                    .stroke(Color.white, lineWidth: 3)
                    .frame(width: 250, height: 250)
                    .padding(.top, -44)
                
                Spacer()
                
                // Bottom buttons
                HStack {
                    Button(action: {
                        // Add action for gallery
                    }) {
                        Image("gallery")
                            .resizable()
                            .scaledToFit()
                            .padding(7)
                    }
                    .frame(width: 40, height: 40)
                    .background(Color.black.opacity(0.3))
                    .clipShape(Circle())
                    
                    Spacer()
                    
                    Button(action: {
                        navigationPath.append("progress")
                    }) {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 64, height: 64)
                            .overlay(
                                Circle()
                                    .stroke(Color.successGreen, lineWidth: 10)
                            )
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Add zoom functionality
                    }) {
                        Text("1x")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(width: 40, height: 40)
                    .background(Color.black.opacity(0.3))
                    .clipShape(Circle())
                }
                .padding(30)
                .padding(.bottom, 50)
            }
        }
        .onAppear {
            setupCamera()
        }
        .onDisappear {
            session.stopRunning()
        }
        
    }
    
    private func setupCamera() {
        session.beginConfiguration()
        session.inputs.forEach { session.removeInput($0) }
        
        guard let device = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: .back
        ),
              let input = try? AVCaptureDeviceInput(device: device),
              session.canAddInput(input) else {
            return
        }
        session.addInput(input)
        
        if session.canAddOutput(output) {
            session.addOutput(output)
        }
        
        session.commitConfiguration()
        DispatchQueue.global(qos: .userInteractive).async {
            session.startRunning()
        }
    }
}

struct ScannerCorners: Shape {
    func path(in rect: CGRect) -> Path {
        let cornerLength: CGFloat = 30
        let cornerRadius: CGFloat = 5
        
        var path = Path()
        
        // Top left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.minY + cornerLength))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.minY),
            control: CGPoint(x: rect.minX, y: rect.minY + cornerRadius)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.minX + cornerLength, y: rect.minY),
            control: CGPoint(x: rect.minX + cornerRadius, y: rect.minY)
        )
        
        // Top right corner
        path.move(to: CGPoint(x: rect.maxX - cornerLength, y: rect.minY))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY),
            control: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY + cornerLength),
            control: CGPoint(x: rect.maxX, y: rect.minY + cornerRadius)
        )
        
        // Bottom right corner
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerLength))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.maxY),
            control: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - cornerLength, y: rect.maxY),
            control: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY)
        )
        
        // Bottom left corner
        path.move(to: CGPoint(x: rect.minX + cornerLength, y: rect.maxY))
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY),
            control: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY - cornerLength),
            control: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius)
        )
        
        return path
    }
}

#Preview {
    CameraView(navigationPath: .constant(NavigationPath()))
}
