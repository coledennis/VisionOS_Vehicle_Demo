//
//  MainWindowView.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/23/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MainWindowView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
    let experienceModule : ExperienceModule
    
    let largeScale: Bool
    
    var body: some View {
        HStack {
            VStack {
                Text(experienceModule.windowTitle)
                    .padding()
                Button {
                    viewModel.showImmersiveSpace.toggle()
                } label: {
                    Text("Show Immersive Space")
                        .padding()
                }
            }

            if !largeScale {
                VehicleView(experienceModule: experienceModule)
            }
        }
    }
}

#Preview {
    MainWindowView(experienceModule: .showroom, largeScale: false)
}
