//
//  StreakMilestonesCard.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import SwiftUI

struct StreakMilestonesCard: View {
    let type: MilestoneType
    let checked: Bool
    
    var body: some View {
        HStack {
            Image(type.imageName)
            Text(type.title)
                .font(.system(size: 14, weight: .medium))
            
            Spacer()
            
            if checked {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
        .frame(maxWidth: 500, alignment: .leading)
        .padding(.horizontal, 12)
        .padding(.vertical, 15)
        .background(
            RadialGradient(
                gradient: Gradient(colors: type.radialColors),
                center: .leading,
                startRadius: 5,
                endRadius: 300
            )
        )
        .cornerRadius(12)
        .background()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: type.borderColors),
                        startPoint: .topLeading,
                        endPoint: .bottomLeading
                    ),
                    lineWidth: 2
                )
        )
    }
}

#Preview {
    StreakMilestonesCard(type: MilestoneType.platinum, checked: true)
}

