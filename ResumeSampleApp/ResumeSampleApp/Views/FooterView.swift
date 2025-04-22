//
//  FooterView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 17/04/25.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        Text("© 2025 Vikas Kumar. All rights reserved.")
            .foregroundStyle(.secondary)
            .padding()
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    FooterView()
}
