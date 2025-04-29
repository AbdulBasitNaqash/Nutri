//
//  StreakView.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import SwiftUI

struct StreakView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack() {
                // Top buttons
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.mediumGray)
                            .padding(10)
                    }
                    
                    Spacer()
                    
                    Text("Streaks")
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        // todo
                    }) {
                        Image("share")
                            .font(.system(size: 20))
                            .foregroundColor(Color.mediumGray)
                            .padding(10)
                    }
                }.padding(.top)
                
               SpinningStreak(value: "5")
                
                Text("You're on a")
                    .foregroundColor(Color.darkGray)
                Text("5 days Streak!")
                    .font(.system(size: 24, weight: .bold))
                
                Text("Keep it up!")
                    .foregroundColor(Color.darkGray)
                    .padding(.vertical, 0)
                
                ZStack(alignment: .bottom) {
                    CalendarOverview(dataManager: CalendarDataManager(datesWithData: [
                        Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
                        Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
                        Calendar.current.date(byAdding: .day, value: -3, to: Date())!
                    ]))
                    .padding(.vertical, 17)
                    
                    HStack {
                        Image("bronze")
                        Text("10 day streak achiever")
                            .font(.system(size: 14, weight: .medium))
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        RadialGradient(
                            gradient: Gradient(colors: [Color.bronzeRadialStart, Color.bronzeRadialEnd]),
                            center: .leading,
                            startRadius: 5,
                            endRadius: 300
                        )
                    )
                    .cornerRadius(20)
                    .background()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.bronzeBorderStart, Color.bronzeBorderEnd]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomLeading
                                ),
                                lineWidth: 2
                            )
                    )
                }
                .padding(.bottom)
                
                HStack {
                    Text("Milestones")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("View All  >")
                        .foregroundColor(Color.darkGray)
                }
                .frame(maxWidth: .infinity)
                
                StreakMilestonesCard(type: .silver, checked: true)
                    .padding(.vertical, 5)
                StreakMilestonesCard(type: .bronze, checked: false)
                    .padding(.vertical, 5)
                StreakMilestonesCard(type: .gold, checked: false)
                    .padding(.vertical, 5)
                StreakMilestonesCard(type: .platinum, checked: false)
                    .padding(.vertical, 5)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    StreakView()
}
