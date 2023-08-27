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
            TabMenuView()
                .environment(viewModel)
        }
        .windowStyle(.plain)

        ImmersiveSpace(id: "ImmersiveSpace") {
//            ImmersiveView()
            VehicleView(isFullScale: true)
                .environment(viewModel)
        }
    }
}
