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
    
    @StateObject var viewModel = NutritionViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack(alignment: .bottom) {
                            Image(viewModel.headerImageName)
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea()
                            
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
                            
                            VStack(alignment: .leading) {
                                Text(viewModel.category)
                                    .font(.system(size: 13, weight: .medium))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 4)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.white)
                                    )
                                Text(viewModel.foodTitle)
                                    .font(.system(size: 24, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 10)
                            }
                            .padding(.horizontal, 20)
                            
                            ZStack(alignment: .top) {
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
                                    VStack {}
                                }
                            }
                        }
                        .padding(.bottom, 24)
                        
                        Text("Nutritional Overview:")
                            .font(.system(size: 16, weight: .bold))
                            .padding(.horizontal, 20)
                        
                        NutritionCard(
                            title: viewModel.calories.title,
                            subtitle: viewModel.calories.subtitle,
                            iconName: viewModel.calories.iconName
                        )
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                        
                        HStack {
                            Text("Macro Nutrients")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.top, 20)
                            Spacer()
                            Text(viewModel.macroTotal)
                                .foregroundColor(Color.darkGray)
                        }
                        .padding(.horizontal, 20)
                        
                        HStack(spacing: 16) {
                            ForEach(viewModel.macroNutrients.prefix(2), id: \.title) { nutrient in
                                NutritionCard(
                                    title: nutrient.title,
                                    subtitle: nutrient.subtitle,
                                    iconName: nutrient.iconName
                                )
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        if viewModel.macroNutrients.count > 2 {
                            NutritionCard(
                                title: viewModel.macroNutrients[2].title,
                                subtitle: viewModel.macroNutrients[2].subtitle,
                                iconName: viewModel.macroNutrients[2].iconName
                            )
                            .padding(.horizontal, 20)
                            .padding(.top, 8)
                        }
                        
                        HStack {
                            Text("Micro Nutrients")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.top, 20)
                            Spacer()
                            Text(viewModel.microTotal)
                                .foregroundColor(Color.darkGray)
                        }
                        .padding(.horizontal, 20)
                        
                        HStack(spacing: 16) {
                            ForEach(viewModel.microNutrients, id: \.title) { nutrient in
                                NutritionCard(
                                    title: nutrient.title,
                                    subtitle: nutrient.subtitle,
                                    iconName: nutrient.iconName
                                )
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 8)
                        
                        WeeklyBarChart(values: viewModel.weeklyChartData)
                            .padding(.vertical)
                            .padding(.horizontal, 6)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                navigationPath.append("streak")
                            }
                        
                        GradientButton(title: "Save to Daily log") {
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
                    }
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
