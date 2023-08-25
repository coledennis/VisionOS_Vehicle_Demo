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
    
    @Bindable var viewModel: ViewModel
    
    let experienceModule : ExperienceModule
    
    var body: some View {
        HStack {
            VStack {
                Text(experienceModule.windowTitle)
                    .padding()
//                    .glassBackgroundEffect()
                //            Model3D(named: "Scene", bundle: realityKitContentBundle)
//                                .padding(.bottom, 50)
                //
                //            Text("Hello, world!")
                //
                Button {
                    viewModel.showImmersiveSpace.toggle()
                } label: {
                    Text("Show Immersive Space")
                        .padding()
                }
            }
            VehicleView(experienceModule: experienceModule)
        }
//        .padding()
    }
}

#Preview {
    MainWindowView(viewModel: ViewModel.init(), experienceModule: .showroom)
}
