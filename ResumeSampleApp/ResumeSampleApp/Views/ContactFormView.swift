//
//  ContactFormView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 21/04/25.
//

import SwiftUI
import MessageUI

struct ContactFormView: View {
    @Binding var isPresented: Bool
    
    @State private var name = ""
    @State private var email = ""
    @State private var message = ""
    
    @State private var isShowingMailView = false
    @State private var mailResult: Result<MFMailComposeResult, Error>? = nil
        
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        isPresented = false
                    }
                }
            
            // Popup container
            VStack(spacing: 16) {
                Text("Feel free to contact me!")
                    .font(.title2).bold()
                    .padding(.bottom)
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                
                TextEditor(text: $message)
                    .frame(height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                
                HStack {
                    Button("Cancel") {
                        withAnimation {
                            isPresented = false
                        }
                    }
                    .foregroundColor(.red)
                    .fontWeight(.semibold)

                    Spacer()
                    
                    Button("Submit") {
                        // Handle submission logic
                        if MFMailComposeViewController.canSendMail() {
                            isShowingMailView = true
                        } else {
                            print("Mail services are not available")
                        }
                        withAnimation {
                            isPresented = false
                        }
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
                }
                .padding(.top)
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 20)
            .padding(.horizontal, 24)
        }
        .sheet(isPresented: $isShowingMailView) {
            MailView(
                result: $mailResult,
                subject: "Hello from SwiftUI",
                recipients: ["example@example.com"],
                body: "This is a test email sent from a SwiftUI app."
            )
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    ContactFormView(isPresented: .constant(true))
}
