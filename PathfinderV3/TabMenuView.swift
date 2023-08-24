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
    
    var body: some View {
        TabView {
            MainWindowView(viewModel: viewModel, experienceModule: .showroom)
                .tabItem {
                    Label("Showroom", systemImage: "sparkles")
                }
            //                .frame(depth: 2, alignment: .front)
            MainWindowView(viewModel: viewModel, experienceModule: .precheck)
            
                .tabItem {
                    Label("Pre-Check", systemImage: "list.bullet.clipboard")
                }
            ////                .frame(depth: 2, alignment: .front)
            MainWindowView(viewModel: viewModel, experienceModule: .startup)
                .tabItem {
                    Label("Start Up", systemImage: "checkmark")
                }
            MainWindowView(viewModel: viewModel, experienceModule: .shutdown)
                .tabItem {
                    Label("Shut Down", systemImage: "xmark")
                }
            MainWindowView(viewModel: viewModel, experienceModule: .attachments)
                .tabItem {
                    Label("Attachments", systemImage: "plus")
                }
        }
        .onChange(of: viewModel.showImmersiveSpace) { _, newValue in
            print("test 3")
            Task {
                print("test 4")
                if newValue {
                    print("test 5")
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        print("test 6")
                        viewModel.immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        print("test 7")
                        viewModel.immersiveSpaceIsShown = false
                        viewModel.showImmersiveSpace = false
                    }
                } else if viewModel.immersiveSpaceIsShown {
                    print("test 8")
                    await dismissImmersiveSpace()
                    viewModel.immersiveSpaceIsShown = false
                    print("test 9")
                }
            }
        }
    }
}

#Preview {
    TabMenuView()
}
