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
//        ZStack {
//            TabView(selection: $tab) {
//                ComboView(experienceModule: .showroom)
//                    .tabItem {
//                        Label("Showroom", systemImage: "list.bullet.clipboard")
//                    }.tag(ExperienceModule.showroom)
//                ComboView(experienceModule: .precheck)
//                    .tabItem {
//                        Label("Pre-Check", systemImage: "list.bullet.clipboard")
//                    }.tag(ExperienceModule.precheck)
//                ComboView(experienceModule: .startup)
//                    .tabItem {
//                        Label("Start Up", systemImage: "checkmark")
//                    }.tag(ExperienceModule.startup)
//                ComboView(experienceModule: .shutdown)
//                    .tabItem {
//                        Label("Shut Down", systemImage: "xmark")
//                    }.tag(ExperienceModule.shutdown)
//                ComboView(experienceModule: .attachments)
//                    .tabItem {
//                        Label("Attachments", systemImage: "plus")
//                    }.tag(ExperienceModule.attachments)
//            }
//            .animation(.spring, value: viewModel.immersiveSpaceIsShown)
//            .opacity(viewModel.immersiveSpaceIsShown ? 1 : 0)
            HStack {
                //            TabView(selection: $tab,
                //                    content:  {
                //                Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(ExperienceModule.showroom)
                //                Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(ExperienceModule.precheck)
                //            })
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
                //            if !viewModel.immersiveSpaceIsShown {
                VehicleView(isFullScale: false)
                    .opacity(viewModel.immersiveSpaceIsShown ? 0 : 1)
                    .dragRotation(pitchLimit: .degrees(90))
//                    .dragRotation(yawLimit: .degrees(20))

//                    .placementGestures(initialPosition: Point3D([475, -1200.0, -1200.0]))

//                    .rotation3DEffect(Rotation3D(angle: Angle2D(degrees: viewModel.rotation), axis: .y))

//                    .frame(depth: 2, alignment: .front)
                //            }
            }
//            .opacity(viewModel.immersiveSpaceIsShown ? 0 : 1)

//        }
        .animation(.default, value: viewModel.immersiveSpaceIsShown)
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
