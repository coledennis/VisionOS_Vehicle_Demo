//
//  PathfinderV3App.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/23/23.
//

import SwiftUI

@main
struct PathfinderV3App: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            TabMenuView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
