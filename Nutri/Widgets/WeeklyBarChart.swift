//
//  WeeklyBarChart.swift
//  Nutri
//
//  Created by Abdul Basit on 29/04/25.
//

import SwiftUI

struct WeeklyBarChart: View {
    let days = ["S", "M", "T", "W", "T", "F", "S"]
    let values: [CGFloat]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Weekly Meal Nutrition")
                .font(.system(size: 18, weight: .bold))
                .multilineTextAlignment(.leading)
                .padding()
            
            HStack(alignment: .bottom, spacing: 20) {
                ForEach(0..<days.count, id: \.self) { index in
                    VStack(spacing: 12) {
                        RoundedBar(height: values[index])
                        
                        Text(days[index])
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: 50)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.lightGrayBackground, lineWidth: 1)
        )
        .padding()
    }
}

struct RoundedBar: View {
    var height: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.successGreen,
                        Color.warningOrange
                    ]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .frame(width: 20, height: height)
            .mask(
                RoundedCorner(radius: 10, corners: [.topLeft, .topRight])
                    .frame(width: 8, height: height)
            )
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = 10.0
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}



#Preview {
    WeeklyBarChart(values: [10, 80, 30, 40, 60, 70, 90])
}
