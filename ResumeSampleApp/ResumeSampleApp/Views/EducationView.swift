//
//  EducationView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 20/04/25.
//

import SwiftUI

struct EducationView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Education")
                .font(.title2.bold())
                .padding(.top)
            
            Divider()
            
            HStack(alignment: .top, spacing: 12) {
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 4)
                    .cornerRadius(2)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("G.G.S.I.P University")
                        .font(.headline.bold())
                    
                    Text("Bachelor of Engineering in Computer Science")
                        .italic()
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("Aug 2011 – Sep 2015")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("Delhi, India")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 8)
                }
            }
            .padding(.bottom)
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
    EducationView()
}
