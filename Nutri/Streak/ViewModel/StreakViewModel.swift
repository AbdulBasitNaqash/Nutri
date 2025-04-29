//
//  StreakViewModel.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import Foundation
import SwiftUI

struct Milestones {
    let type: MilestoneType
    let isChecked: Bool
}

class StreakViewModel: ObservableObject {
    @Published var streakCount: Int = 5
    @Published var calendarDatesWithData: Set<Date> = [
        Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
        Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
        Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    ]
    @Published var badgeImageName: String = "bronze"
    @Published var badgeText: String = "10 day streak achiever"
    
    @Published var milestones: [Milestones] = [
        Milestones(type: .silver, isChecked: true),
        Milestones(type: .bronze, isChecked: false),
        Milestones(type: .gold, isChecked: false),
        Milestones(type: .platinum, isChecked: false)
    ]
}
