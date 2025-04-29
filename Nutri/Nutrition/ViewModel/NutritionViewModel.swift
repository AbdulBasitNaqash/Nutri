//
//  NutritionViewModel.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import Foundation
import SwiftUI

struct Nutrient {
    let title: String
    let subtitle: String
    let iconName: String
}

class NutritionViewModel: ObservableObject {
    @Published var headerImageName: String = "nutrition_header"
    @Published var category: String = "FOOD"
    @Published var foodTitle: String = "Macroni Pizza"
    
    @Published var calories: Nutrient = .init(title: "Calories", subtitle: "320 kcal", iconName: "calories")
    
    @Published var macroTotal: String = "Total: 70g"
    @Published var macroNutrients: [Nutrient] = [
        .init(title: "Proteins", subtitle: "20g", iconName: "proteins"),
        .init(title: "Carbs", subtitle: "40g", iconName: "carbs"),
        .init(title: "Fats", subtitle: "10g", iconName: "fats")
    ]
    
    @Published var microTotal: String = "Total: 25%"
    @Published var microNutrients: [Nutrient] = [
        .init(title: "Vitamin A", subtitle: "10%", iconName: "vitamin_a"),
        .init(title: "Calcium", subtitle: "15%", iconName: "calcium")
    ]
    
    @Published var weeklyChartData: [CGFloat] = [10, 80, 30, 40, 60, 70, 90]
}
