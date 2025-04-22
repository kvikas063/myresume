//
//  ProfileView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 12/04/25.
//

import SwiftUI

struct ProfileView: View {
    
    let imageAction: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 18) {
                Color.gray
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay {
                        Image("MyPhoto")
                            .resizable()
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                    }
                    .onTapGesture {
                        imageAction()
                    }
                
                VStack(alignment: .leading) {
                    Text("VIKAS KUMAR")
                        .font(.title2.bold())
                        .foregroundStyle(.accent)
                    
                    Text("Senior Software Engineer")
                        .font(.subheadline.bold())
                        .foregroundStyle(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 18) {
                    Text("Mobile:")
                        .font(.headline.bold())
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Image(systemName: "phone.fill")
                            .frame(width: 24)
                        Text("+91-8285464037")
                    }
                    .font(.subheadline.bold())
                    .foregroundStyle(.accent)
                }
                HStack(spacing: 28) {
                    Text("Email:")
                        .font(.headline.bold())
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Image(systemName: "envelope")
                            .frame(width: 24)
                        Text("vikas_063@hotmail.com")
                    }
                    .font(.subheadline.bold())
                    .foregroundStyle(.accent)
                }
                HStack(spacing: 4) {
                    Text("LinkedIn:")
                        .font(.headline.bold())
                        .foregroundStyle(.gray)
                    Link(destination: URL(string: "https://linkedin.com/in/vikaskumar063/")!) {
                        HStack(spacing: 4) {
                            Image(systemName: "paperplane.fill")
                                .frame(width: 24)
                            Text("linkedin.com/in/vikaskumar063")
                        }
                        .font(.subheadline.bold())
                        .foregroundStyle(.accent)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(.systemGray6))
        }
    }
}

#Preview {
    ProfileView {}
}
