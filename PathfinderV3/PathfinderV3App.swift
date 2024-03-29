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
            VehicleView(isFullScale: true)
//                .dragRotation(pitchLimit: .degrees(0))
//                .rotation3DEffect(Rotation3D(angle: Angle2D(degrees: viewModel.rotation), axis: .y))
                .environment(viewModel)
        }
    }
}
