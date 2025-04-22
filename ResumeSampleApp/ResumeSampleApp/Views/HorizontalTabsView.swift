//
//  HorizontalTabsView.swift
//  ResumeSampleApp
//
//  Created by Vikas Kumar on 12/04/25.
//

import SwiftUI

struct HorizontalTabsView: View {
    @Binding var selectedTab: ResumeTab

    var body: some View {
        // Scrollable Tab Bar
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(ResumeTab.allCases, id: \.id) { tab in
                        Button {
                            withAnimation {
                                selectedTab = tab
                                scrollProxy.scrollTo(tab, anchor: .leading)
                            }
                        } label: {
                            Text(tab.rawValue)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .fontWeight(selectedTab == tab ? .medium : .regular)
                                .background(selectedTab == tab ? .white : .clear)
                                .foregroundColor(selectedTab == tab ? .black : .gray)
                                .cornerRadius(selectedTab == tab ? 6 : 0)
                                .padding(.leading, selectedTab == tab ? 8:0)
                        }
                        .id(tab)
                    }
                }
//                .background(Color.green)
                .padding(.vertical, 10)
                .padding(.trailing, 10)
            }
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color(.systemGray6))
            }
        }
    }
}

#Preview {
    HorizontalTabsView(selectedTab: .constant(.experience))
}
