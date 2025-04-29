//
//  CalendarOverview.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import SwiftUI

struct CalendarOverview: View {
    @ObservedObject var dataManager: CalendarDataManager
    
    let calendar = Calendar.current
    let startDate = Calendar.current.date(byAdding: .day, value: -6, to: Date())!
    let weekdaySymbols = ["M", "T", "W", "T", "F", "S", "S"]
    
    var weekDates: [Date] {
        (0..<7).compactMap {
            calendar.date(byAdding: .day, value: $0, to: startDate)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 0) {
                ForEach(Array(weekDates.enumerated()), id: \.element) { index, date in
                    let hasData = dataManager.hasData(for: date)
                    
                    VStack(spacing: 8) {
                        Text(weekdaySymbols[index])
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(hasData ? Color.successGreen : .gray)
                        
                        Group {
                            if hasData {
                                Image("streak_done")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            } else {
                                Text("N/A")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(height: 40)
                        
                        Text("\(calendar.component(.day, from: date))")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(index < 4 ? .black : .gray)
                            .padding(.top)
                            .padding(.bottom, 40)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.lightGrayBackground, lineWidth: 1)
                )
        )
    }
}



#Preview {
    CalendarOverview(dataManager: CalendarDataManager(datesWithData: [
        Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
        Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
        Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    ]))
}
