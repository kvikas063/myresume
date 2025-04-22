//
//  ZoomImageView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 22/04/25.
//


import SwiftUI

struct ZoomImageView: View {
    @Binding var isPresented: Bool
    
    let imageName: String
    
    @State private var scale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        isPresented.toggle()
                    }
                }
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                .offset(offset)
                .clipShape(Circle())
                .gesture(
                    SimultaneousGesture(
                        MagnificationGesture()
                            .onChanged { value in scale = value }
                            .onEnded { _ in if scale < 1 { scale = 1 } },
                        
                        DragGesture()
                            .onChanged { value in offset = value.translation }
                            .onEnded { _ in }
                    )
                )
                .onTapGesture {
                    isPresented.toggle()
                }
        }
    }
}
