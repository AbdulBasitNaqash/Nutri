//
//  NutritionCard.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import SwiftUI

struct NutritionCard: View {
    var title: String
    var subtitle: String
    var iconName: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(iconName)
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .foregroundColor(Color.darkGray)
                    .font(.system(size: 16, weight: .medium))
                Text(subtitle)
                    .font(.system(size: 16, weight: .semibold))
            }
        }
        .frame(maxWidth: 150, alignment: .leading) // Ensure alignment to left
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.extraLightGray)
        )
    }
}


#Preview {
    NutritionCard(title: "Calories", subtitle: "100 kcal", iconName: "calories")
}
