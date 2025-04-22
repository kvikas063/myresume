//
//  ExperienceView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 12/04/25.
//

import SwiftUI

struct Experience: Identifiable {
    let id = UUID()
    let company: String
    let role: String
    let location: String
    let duration: String
    let highlights: [String]
    let appLinks: [AppLink]
}

struct AppLink: Hashable {
    let app: String
    let link: String
}

struct ExperienceView: View {
    
    let experiences: [Experience] = [
        Experience(
            company: "Emids Technologies Pvt Ltd",
            role: "Senior Software Engineer",
            location: "Noida, India",
            duration: "Sep 2022 – Present",
            highlights: [
                "UI Design and functionality revamp of TVT feature/module in ActiveHealth mobile app.",
                "Developed Checkout and Edit Shipping feature including UI design in Rewards feature in ActiveHealth mobile app.",
                "Added Mental Health feature/module in ActiveHealth mobile app using SwiftUI tech stack.",
                "Reduced existing issues and handled crashes which increased app performance."
            ],
            appLinks: [AppLink(app: "App Link (ActiveHealth)", link:"https://apps.apple.com/us/app/activehealth/id1196657483")]
        ),
        Experience(
            company: "MyHealthcare Technologies Pvt Ltd",
            role: "Senior Software Engineer",
            location: "Bengaluru, India",
            duration: "Mar 2018 – Aug 2022",
            highlights: [
                "Design and Developed MH Doctor app for doctors to provide more enhanced features like Physical & Virtual OPD Consultation, EMR, Calendar (Leave, Book Slot), Print Consultation etc.",
                "Added virtual consultation through video/audio calling feature.",
                "Added reports feature in MH Patient app.",
                "Reduced bugs and handled crashes to improve app performance."
            ],
            appLinks: [
                AppLink(app: "App Link (MH Doctor)", link: "https://apps.apple.com/in/app/mh-doctor/id1506345330"),
                AppLink(app: "App Link (MyHealthcare)", link: "https://apps.apple.com/in/app/myhealthcare/id1506349869")
            ]
        ),
        Experience(
            company: "DigiCollect India Pvt Ltd",
            role: "Software Engineer",
            location: "Bengaluru, India",
            duration: "Jun 2017 – Feb 2018",
            highlights: [
                "Design and Developed MH Doctor app for doctors to provide more enhanced features like Physical & Virtual OPD Consultation, EMR, Calendar (Leave, Book Slot), Print Consultation etc.",
                "Added virtual consultation through video/audio calling feature.",
                "Added reports feature in MH Patient app.",
                "Reduced bugs and handled crashes to improve app performance."
            ],
            appLinks: []
        ),
        Experience(
            company: "Robosoft Technologies Pvt Ltd",
            role: "Software Engineer",
            location: "Udupi, India",
            duration: "Nov 2015 – May 2017",
            highlights: [
                "Worked on minor features and bug fixing on NDTV app, tech stack used was Objective-C.",
                "Reduced bugs and handled crashes to improve app performance."
            ],
            appLinks: [AppLink(app: "App Link (NDTV)", link: "https://apps.apple.com/in/app/ndtv/id377869410")]
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Experience")
                .font(.title2.bold())
                .padding(.top)
            
            Divider()
            
            ForEach(experiences) { exp in
                HStack(alignment: .top, spacing: 12) {
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 4)
                        .cornerRadius(2)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(exp.company)
                                .font(.headline).bold()
                            Text(exp.role)
                                .italic()
                            
                            HStack(alignment: .top) {
                                Text(exp.location)
                                    .font(.subheadline)
                                Spacer()
                                Text(exp.duration)
                                    .font(.subheadline)
                            }
                        }
                        
                        // Bullet Points
                        //                VStack(alignment: .leading, spacing: 6) {
                        //                    ForEach(exp.highlights, id: \.self) { point in
                        //                        HStack(alignment: .top) {
                        //                            Text("•").bold()
                        //                            Text(point)
                        //                        }
                        //                    }
                        //                }
                        
                        // App Links
                        if !exp.appLinks.isEmpty {
                            VStack(alignment: .leading, spacing: 4) {
                                ForEach(exp.appLinks, id: \.self) { appLink in
                                    if let url = URL(string: appLink.link) {
                                        HStack {
                                            Link(appLink.app, destination: url)
                                                .font(.footnote)
                                                .underline()
                                            Image(systemName: "arrow.up.right.square")
                                        }
                                        .foregroundColor(.blue)
                                    }
                                }
                            }
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
    ExperienceView()
}
