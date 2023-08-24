//
//  PathfinderV3App.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/23/23.
//

import SwiftUI

@main
struct PathfinderV3App: App {
    
    @State var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            TabMenuView()
                .environment(viewModel)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
