//
//  NutritionView.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//

import SwiftUI

struct NutritionView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, content: {
                        ZStack(alignment: .bottom) {
                            Image("nutrition_header")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea()
                            
                            // White transparent gradient overlay at bottom
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.0),
                                    Color.white.opacity(0.68),
                                    Color.white.opacity(1)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(height: 100)
                            .ignoresSafeArea(edges: .bottom)
                            
                            VStack(alignment: .leading, content: {
                                Text("FOOD")
                                    .font(.system(size: 13, weight: .medium))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white)
                                    )
                                Text("Macroni Pizza")
                                    .font(.system(size: 24, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 10)
                            })
                            .padding(.horizontal, 20)
                            
                            ZStack(alignment: .top) {
                                // Navigation bar
                                HStack {
                                    Button(action: { dismiss() }) {
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .semibold))
                                    }
                                    
                                    Text("Nutrition")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .bold))
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding(.trailing)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .padding(.top, 60)
                                .zIndex(1)
                                
                                ScrollView {
                                    VStack(alignment: .leading, content: {})
                                }
                            }
                        }
                        .padding(.bottom, 24)
                        
                        // Nutritional overview section
                        Text("Nutritional Overview:")
                            .font(.system(size: 16, weight: .bold))
                            .padding(.horizontal, 20)
                        
                        NutritionCard(
                            title: "Calories",
                            subtitle: "320 kcal",
                            iconName: "calories"
                        )
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                        
                        // Macro Nutrients Section
                        HStack(alignment: .firstTextBaseline) {
                            Text("Macro Nutrients")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.top, 20)
                            
                            Spacer()
                            
                            Text("Total: 70g")
                                .foregroundColor(Color.darkGray)
                        }
                        .padding(.horizontal, 20)
                        
                        HStack(spacing: 16) {
                            NutritionCard(
                                title: "Proteins",
                                subtitle: "20g",
                                iconName: "proteins"
                            )
                            NutritionCard(
                                title: "Carbs",
                                subtitle: "40g",
                                iconName: "carbs"
                            )
                        }
                        .padding(.horizontal, 20)
                        NutritionCard(
                            title: "Fats",
                            subtitle: "10g",
                            iconName: "fats"
                        )
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                        
                        // Micro Nutrients Section
                        HStack(alignment: .firstTextBaseline) {
                            Text("Micro Nutrients")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.top, 20)
                            
                            Spacer()
                            
                            Text("Total: 25%")
                                .foregroundColor(Color.darkGray)
                        }
                        .padding(.horizontal, 20)
                        
                        HStack(spacing: 16) {
                            NutritionCard(
                                title: "Vitamin A",
                                subtitle: "10%",
                                iconName: "vitamin_a"
                            )
                            NutritionCard(
                                title: "Calcium",
                                subtitle: "15%",
                                iconName: "calcium"
                            )
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                        
                        WeeklyBarChart(values: [10,80, 30, 40, 60, 70, 90])
                            .padding(.vertical)
                            .padding(.horizontal, 6)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                navigationPath.append("streak")
                            }
                        
                        GradientButton(
                            title: "Save to Daily log") {
                                navigationPath.append("streak")
                            }
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity)
                        
                        HStack(spacing: 4) {
                            Text("Want more insights?")
                                .foregroundColor(.gray)
                                .font(.system(size: 18))
                            
                            Button(action: {
                                print("Upgrade tapped")
                            }) {
                                Text("Upgrade to Premium")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                                    .underline()
                            }
                            .buttonStyle(.plain)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    })
                }
                .padding(.bottom)
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    NutritionView(navigationPath: .constant(NavigationPath()))
}
