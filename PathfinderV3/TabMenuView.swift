//
//  TabMenuView.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/23/23.
//

import SwiftUI

struct TabMenuView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @State var tab: ExperienceModule = .showroom
    var body: some View {
        HStack {
            TabView(selection: $tab) {
                ComboView(experienceModule: .showroom)
                    .tabItem {
                        Label("Showroom", systemImage: "sparkles")
                    }.tag(ExperienceModule.showroom)
                ComboView(experienceModule: .precheck)
                    .tabItem {
                        Label("Pre-Check", systemImage: "list.bullet.clipboard")
                    }.tag(ExperienceModule.precheck)
                ComboView(experienceModule: .startup)
                    .tabItem {
                        Label("Start Up", systemImage: "checkmark")
                    }.tag(ExperienceModule.startup)
                ComboView(experienceModule: .shutdown)
                    .tabItem {
                        Label("Shut Down", systemImage: "xmark")
                    }.tag(ExperienceModule.shutdown)
                ComboView(experienceModule: .attachments)
                    .tabItem {
                        Label("Attachments", systemImage: "plus")
                    }.tag(ExperienceModule.attachments)
            }
            VehicleView(isFullScale: false)
                .opacity(viewModel.immersiveSpaceIsShown ? 0 : 1)
                .dragRotation(pitchLimit: .degrees(90))
        }
        .onChange(of: viewModel.showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        viewModel.immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        viewModel.immersiveSpaceIsShown = false
                        viewModel.showImmersiveSpace = false
                    }
                } else if viewModel.immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    viewModel.immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview {
    TabMenuView()
}
