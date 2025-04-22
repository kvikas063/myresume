//
//  ContactView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 20/04/25.
//

import SwiftUI

struct ContactView: View {

    let action: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Connect With Me")
                .font(.title2.bold())
                .padding(.top)
            
            Divider()
            
            ContactRow(icon: "envelope", text: "vikas_063@hotmail.com", actionURL: "mailto:vikas_063@hotmail.com")
            ContactRow(icon: "phone", text: "+91-8285464037", actionURL: "tel:+918285464037")
            ContactRow(icon: "location", text: "Bangalore, India", actionURL: "http://maps.apple.com/?q=Bangalore,India")
            ContactRow(icon: "globe", text: "vikas-ios.mystrikingly.com", actionURL: "https://vikas-ios.mystrikingly.com")
            ContactRow(icon: "link", text: "linkedin.com/in/vikaskumar063", actionURL: "https://linkedin.com/in/vikaskumar063")
            ContactRow(icon: "logo.github", text: "github.com/kvikas063", actionURL: "https://github.com/kvikas063")
            ContactRow(icon: "text.bubble", text: "medium.com/@kumar.vikas", actionURL: "https://medium.com/@kumar.vikas")
            
            VStack(alignment: .center) {
                Button {
                    withAnimation {
                        action()
                    }
                } label: {
                    Text("Contact Me Here")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 5))
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .padding(.bottom, 10)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(.systemGray6))
        }
    }
}

#Preview {
    ContactView(action: {})
}
