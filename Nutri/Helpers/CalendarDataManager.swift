//
//  CalendarDataManager.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import Foundation

class CalendarDataManager: ObservableObject {
    @Published var datesWithData: Set<Date> = []
    
    init(datesWithData: Set<Date>) {
        self.datesWithData = datesWithData
    }
    
    func hasData(for date: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        return datesWithData.contains {
            formatter.string(from: $0) == dateString
        }
    }
}
