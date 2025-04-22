//
//  ContactRow.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 22/04/25.
//

import SwiftUI

struct ContactRow: View {
    var icon: String
    var text: String
    var actionURL: String
    
    var body: some View {
        Button(action: {
            if let url = URL(string: actionURL) {
                UIApplication.shared.open(url)
            }
        }) {
            HStack(spacing: 12) {
                Image(systemName: iconSymbol(icon))
                    .foregroundColor(.blue)
                Text(text)
                    .foregroundColor(.primary)
                    .font(.subheadline)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    func iconSymbol(_ icon: String) -> String {
        switch icon {
            case "logo.github": return "chevron.left.slash.chevron.right"
            case "text.bubble": return "text.bubble"
            default: return icon
        }
    }
}
