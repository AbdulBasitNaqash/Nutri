//
//  CameraHeaderView.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//

import SwiftUI

import SwiftUI

struct CameraHeaderView: View {
    var iconName: String
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Icon
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.white)
            
            // Title and Subtitle
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
        .background(Color.black.blur(radius: 48))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding(.horizontal)
    }
}

#Preview {
    CameraHeaderView(
        iconName: "scan_icon",
        title: "Camera Access",
        subtitle: "Allow camera usage to scan QR codes"
    )
}

