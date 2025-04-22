//
//  AppsDevelopedView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 20/04/25.
//


import SwiftUI

struct AppItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let link: String
}

struct AppsDevelopedView: View {
    let apps: [AppItem] = [
        AppItem(title: "ActiveHealth App", description: "A comprehensive health management application", link: "https://apps.apple.com/us/app/activehealth/id1196657483"),
        AppItem(title: "MH Doctor App", description: "Platform for doctors to manage patient consultations", link: "https://apps.apple.com/in/app/mh-doctor/id1506345330"),
        AppItem(title: "MyHealthcare Patient App", description: "Patient-focused healthcare management solution", link: "https://apps.apple.com/in/app/myhealthcare/id1506349869"),
        AppItem(title: "MyFortis Patient App", description: "Fortis hospital's patient management application", link: "https://apps.apple.com/in/app/myfortis/id1071244232"),
        AppItem(title: "MyFortis Doctor App", description: "Application for Fortis hospital doctors", link: "https://apps.apple.com/in/app/myfortis-doctor/id1441940579"),
        AppItem(title: "NDTV App", description: "News application for NDTV", link: "https://apps.apple.com/in/app/ndtv/id377869410")
    ]
        
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Apps Developed")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.top)
            
            Divider()
            
            ForEach(apps) { app in
                HStack(alignment: .top, spacing: 12) {
                    Rectangle()
                        .fill(Color.accentColor)
                        .frame(width: 4)
                        .cornerRadius(2)
                    
                    Link(destination: URL(string: app.link)!) {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(app.title)
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                                Spacer()
                                Image(systemName: "arrow.up.right.square")
                                    .foregroundColor(.blue)
                            }
                            
                            Text(app.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)

                            Text(app.link)
                                .font(.caption)
                                .foregroundColor(.blue)
                                .multilineTextAlignment(.leading)
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

#Preview {
    AppsDevelopedView()
}
