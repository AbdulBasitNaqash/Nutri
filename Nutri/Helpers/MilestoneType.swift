//
//  MilestoneType.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import SwiftUI

enum MilestoneType {
    case bronze, silver, gold, platinum
    
    var imageName: String {
        switch self {
        case .bronze: return "bronze"
        case .silver: return "silver"
        case .gold: return "gold"
        case .platinum: return "platinum"
        }
    }
    
    var title: String {
        switch self {
        case .bronze: return "10-day streak achiever"
        case .silver: return "7-day streak achiever"
        case .gold: return "20-day streak achiever"
        case .platinum: return "30-day streak achiever"
        }
    }
    
    var radialColors: [Color] {
        switch self {
        case .bronze:
            return [Color.bronzeRadialStart, Color.bronzeRadialEnd]
        case .silver:
            return [Color.lightBackgroundBlue, Color.fogGray]
        case .gold:
            return [Color.paleBlue, Color.cardBackgroundBlue]
        case .platinum:
            return [Color.paleLavender, Color.lightPurpleBackground]
        }
    }
    
    var borderColors: [Color] {
        switch self {
        case .bronze:
            return [Color.bronzeBorderStart, Color.bronzeBorderEnd]
        case .silver:
            return [Color.softBorderGray, Color.lightGrayBorder]
        case .gold:
            return [Color.babyBlue, Color.slateBlueGray]
        case .platinum:
            return [Color.lilacBackground, Color.lightPurpleBorder]
        }
    }
}

