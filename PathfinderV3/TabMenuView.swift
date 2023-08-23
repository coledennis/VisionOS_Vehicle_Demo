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
            Text("View 1")
                .tabItem {
                    Label("Showroom", systemImage: "sparkles")
                }
//                .frame(depth: 2, alignment: .front)
                Text("View 2")
                .tabItem {
                    Label("Pre-Check", systemImage: "list.bullet.clipboard")
                }
//                .frame(depth: 2, alignment: .front)
            Text("View 3")
                .tabItem {
                    Label("Start Up", systemImage: "checkmark")
                }
            Text("View 4")
                .tabItem {
                    Label("Shut Down", systemImage: "xmark")
                }
            Text("View 5")
                .tabItem {
                    Label("Attachments", systemImage: "plus")
                }
        }
    }
}

#Preview {
    TabMenuView()
}
