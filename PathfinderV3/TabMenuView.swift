//
//  TabMenuView.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/23/23.
//

import SwiftUI

struct TabMenuView: View {
    var body: some View {
        TabView {
            MainWindowView(experienceModule: .showroom)
                .tabItem {
                    Label("Showroom", systemImage: "sparkles")
                }
//                .frame(depth: 2, alignment: .front)
            MainWindowView(experienceModule: .precheck)

                .tabItem {
                    Label("Pre-Check", systemImage: "list.bullet.clipboard")
                }
//                .frame(depth: 2, alignment: .front)
            MainWindowView(experienceModule: .startup)
                .tabItem {
                    Label("Start Up", systemImage: "checkmark")
                }
            MainWindowView(experienceModule: .shutdown)
                .tabItem {
                    Label("Shut Down", systemImage: "xmark")
                }
            MainWindowView(experienceModule: .attachments)
                .tabItem {
                    Label("Attachments", systemImage: "plus")
                }
        }
    }
}

#Preview {
    TabMenuView()
}
