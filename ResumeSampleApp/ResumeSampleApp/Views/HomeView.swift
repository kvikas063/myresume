//
//  HomeView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 12/04/25.
//

import SwiftUI

enum ResumeTab: String, CaseIterable, Identifiable {
    case experience = "Experience"
    case skills = "Skills"
    case education = "Education"
    case achievements = "Achievements"
    case apps = "Apps Developed"
    case contact = "Contact"
    
    var id: String { return rawValue }
}

struct HomeView: View {
    
    @State private var selectedTab: ResumeTab = .experience
    
    @State private var showContactForm: Bool = false
    @State private var showProfileImage: Bool = false

    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ProfileView {
                            showProfileImage.toggle()
                        }
                        
                        ProfileSummaryView()
                        
                        HorizontalTabsView(selectedTab: $selectedTab)
                        
                        switch selectedTab {
                            case .experience:
                                ExperienceView()
                            case .skills:
                                SkillsView()
                            case .education:
                                EducationView()
                            case .achievements:
                                AchievementView()
                            case .apps:
                                AppsDevelopedView()
                            case .contact:
                                ContactView {
                                    showContactForm.toggle()
                                }
                        }
                    }
                    .padding(.bottom, 30)
                }
                .padding(.horizontal, 12)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Resume")
                            .font(.title.bold())
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .safeAreaInset(edge: .bottom) {
                    FooterView()
                        .background(.white)
                        .frame(height: 10)
                }
            }
            if showContactForm {
                ContactFormView(isPresented: $showContactForm)
            }
            
            if showProfileImage {
                ZoomImageView(isPresented: $showProfileImage, imageName: "MyPhoto")
            }
        }
    }
}

#Preview {
    HomeView()
}
