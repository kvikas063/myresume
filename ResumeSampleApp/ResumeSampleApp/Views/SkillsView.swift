//
//  SkillsView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 12/04/25.
//

import SwiftUI

struct SkillsView: View {
    let skillCategories: [SkillCategory] = [
        .init(title: "Programming Languages:", tags: ["Swift", "SwiftUI", "Objective-C"]),
        .init(title: "Development Tools:", tags: ["Xcode", "Instruments", "Git"]),
        .init(title: "Package Dependency Manager:", tags: ["Swift Package Manager (SPM)", "Cocoapods"]),
        .init(title: "Project Management:", tags: ["JIRA", "Agile", "Scrum", "Miro", "Rally Dev"]),
        .init(title: "UI/UX Design:", tags: ["Figma", "Zeplin", "InVision"]),
        .init(title: "Design Pattern:", tags: ["MVC", "MVP", "MVVM"]),
        .init(title: "Other Skills:", tags: ["Firebase", "Circle CI/CD", "Clean Architecture (SOLID)", "Quickblox", "Combine", "React-Native (Basic)"])
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Apps Developed")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(skillCategories, id: \.title) { category in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(category.title)
                            .font(.headline)
                        
                        FlowLayout(tags: category.tags) { tag in
                            SkillTagView(text: tag)
                        }
                    }
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

// MARK: - Flow Layout View
struct FlowLayout<Content: View>: View {
    let tags: [String]
    let content: (String) -> Content
    let spacing: CGFloat = 8
    
    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }
    
    func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var rows: [[String]] = [[]]
        
        for tag in tags {
            let size = tag.size(withFont: UIFont.systemFont(ofSize: 15), padding: CGSize(width: 24, height: 12))
            if width + size.width > geometry.size.width {
                rows.append([tag])
                width = size.width + spacing
                height += size.height + spacing
            } else {
                rows[rows.count - 1].append(tag)
                width += size.width + spacing
            }
        }
        
        DispatchQueue.main.async {
            self.totalHeight = height + (rows.first?.first.map { tag in
                tag.size(withFont: UIFont.systemFont(ofSize: 15), padding: CGSize(width: 24, height: 12)).height
            } ?? 0)
        }
        
        return VStack(alignment: .leading, spacing: spacing) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(row, id: \.self) { tag in
                        content(tag)
                    }
                }
            }
        }
    }
}

// MARK: - Tag View
struct SkillTagView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 15))
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.accentColor.opacity(0.1))
            .foregroundColor(.accentColor)
            .cornerRadius(6)
    }
}

// MARK: - Category Model
struct SkillCategory {
    let title: String
    let tags: [String]
}

// MARK: - Utility: String Size Calculation
extension String {
    func size(withFont font: UIFont, padding: CGSize) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        let labelSize = self.size(withAttributes: attributes)
        return CGSize(width: labelSize.width + padding.width, height: labelSize.height + padding.height)
    }
}

// MARK: - Preview
#Preview {
    SkillsView()
}
