//
//  ProfileSummaryView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 12/04/25.
//

import SwiftUI

struct ProfileSummaryView: View {
    var paragraphStyle: NSParagraphStyle {
        let style = NSMutableParagraphStyle()
        style.alignment = .justified
        return style
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Profile Summary")
                .font(.title2.bold())
            
            ExpandableText(text: "Innovative and results-driven software developer with over **9 years of experience** specializing in iOS application development. Passionate about creating user-centric applications with intuitive and engaging interfaces. Committed to writing clean, maintainable, and efficient code. Continuously learning and adapting to new technologies to stay ahead in the fast-evolving tech landscape.", lineLimit: 3)
//            Text("Innovative and results-driven software developer with over **9 years of experience** specializing in iOS application development. Passionate about creating user-centric applications with intuitive and engaging interfaces. Committed to writing clean, maintainable, and efficient code. Continuously learning and adapting to new technologies to stay ahead in the fast-evolving tech landscape.")
                .font(.body)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(.systemGray6))
        }
    }
}

struct ExpandableText: View {
    let text: String
    let lineLimit: Int
    
    @State private var expanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)
                .animation(.easeInOut, value: expanded)
            
            Button(action: {
                expanded.toggle()
            }) {
                Text(expanded ? "Read less" : "Read more")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
        }
    }
}


#Preview {
    ProfileSummaryView()
}
