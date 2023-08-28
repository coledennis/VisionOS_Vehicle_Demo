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

//    @Bindable(wrappedValue: ViewModel.self) private var viewModel
    
    
    let experienceModule : ExperienceModule
    
    //    let largeScale: Bool
    
    var currentHotSpot: HotSpotData {
        experienceModule.hotSpotArray.first(where: {$0.placement == viewModel.currentHotSpot}) ?? HotSpotData(placement: 1, title: "Error", description: "Error")
    }
    
    
    var body: some View {
        //        HStack {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(currentHotSpot.title)
                    //                Text(experienceModule.windowTitle)
                        .font(.largeTitle)
                    //                    .padding()
                    
                    Spacer()
                    Button {
                        if viewModel.currentHotSpot > 1 {
                            viewModel.currentHotSpot -= 1
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    .buttonBorderShape(.circle)
                    .opacity(viewModel.currentHotSpot > 1 ? 1 : 0)
                    
                    Text("\(viewModel.currentHotSpot) / \(experienceModule.hotSpotArray.count)")
                        .foregroundStyle(.secondary)
                    
                    Button {
                        if viewModel.currentHotSpot < experienceModule.hotSpotArray.count {
                            viewModel.currentHotSpot += 1
                        } else {
                            viewModel.currentHotSpot = 1
                        }
                    } label: {
                        if viewModel.currentHotSpot < experienceModule.hotSpotArray.count {
                            Image(systemName: "arrow.right")
                        } else {
                            Image(systemName: "arrow.counterclockwise")
                        }
                    }
                    .buttonBorderShape(.circle)
                    // arrow buttons
                }
                Text(experienceModule.windowTitle)
                    .font(.headline)
                //                .foregroundStyle(.secondary)
                    .padding(.bottom)
                
                //            Text(currentHotSpot.title)
                Text(currentHotSpot.description)
//                Button {
//                    viewModel.showImmersiveSpace.toggle()
//                } label: {
//                    Text("Show Immersive Space")
//                        .padding()
//                }
            }
            .padding()
            .padding()
            .glassBackgroundEffect()
            
            
            // add ornament with controls
            HStack {
                Button {
                    viewModel.showImmersiveSpace.toggle()
                } label: {
                    if !viewModel.immersiveSpaceIsShown {
                        Image(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
                    } else {
                        Image(systemName: "arrow.down.right.and.arrow.up.left")
                    }
                }
                .buttonBorderShape(.circle)
                

                @Bindable var viewModelBound = viewModel
                
                Slider(value: $viewModelBound.rotation) {
                    Text("Vehicle Rotation")
                } minimumValueLabel: {
                    Image(systemName: "arrow.left")
                } maximumValueLabel: {
                    Image(systemName: "arrow.right")
                }

            }
            .padding()
            .glassBackgroundEffect()
            //            if !largeScale {
            //                VehicleView(isFullScale: false)
            //            }
            //        }
        }
    }
}

#Preview {
    MainWindowView(experienceModule: .showroom)
}
