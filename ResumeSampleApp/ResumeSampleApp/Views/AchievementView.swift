//
//  AchievementView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 20/04/25.
//

import SwiftUI

struct Achievement: Identifiable {
    let id = UUID()
    let title: String
    let date: String
}

struct AchievementView: View {
    let achievements: [Achievement] = [
        Achievement(title: "Microsoft AI Skills Challenge", date: "Feb 2024"),
        Achievement(title: "Team Recognition Award", date: "Jul 2023")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Awards & Achievements")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top)
            
            Divider()
            
            // Achievements List
            ForEach(achievements) { item in
                HStack {
                    Text(item.title)
                        .font(.body)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text(item.date)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(.systemGray6))
                                )
                        )
                }
            }
        }
        .padding(10)
        .padding(.bottom, 10)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(.systemGray6))
        }
    }
}

#Preview {
    AchievementView()
}
