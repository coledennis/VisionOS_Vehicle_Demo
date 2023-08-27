//
//  ComboView.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/26/23.
//

import SwiftUI

struct ComboView: View {
    @Environment(ViewModel.self) private var viewModel
    
    let experienceModule : ExperienceModule
    var body: some View {
        ZStack {
            MainWindowView(experienceModule: experienceModule, largeScale: true)
                .opacity(viewModel.immersiveSpaceIsShown ? 1 : 0)
            
            MainWindowView(experienceModule: experienceModule, largeScale: false)
                .opacity(viewModel.immersiveSpaceIsShown ? 0 : 1)
        }
        .animation(.default, value: viewModel.immersiveSpaceIsShown)
        .onAppear {
            withAnimation {
                viewModel.currentExperience = experienceModule
                viewModel.currentHotSpot = 1
            }
        }
    }
}

#Preview {
    ComboView(experienceModule: .showroom)
}
