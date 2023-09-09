//
//  MainWindowView.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/23/23.
//

import SwiftUI
import RealityKit
import RealityKitContent
//import AVKit

struct MainWindowView: View {
    @Environment(ViewModel.self) private var viewModel
    
    let experienceModule : ExperienceModule
    
    var currentHotSpot: HotSpotData {
        experienceModule.hotSpotArray.first(where: {$0.placement == viewModel.currentHotSpot}) ?? HotSpotData(placement: 1, title: "Error", description: "Error")
    }
    
    
    var body: some View {
        //        HStack {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(currentHotSpot.title)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            viewModel.showImmersiveSpace.toggle()
                        }
                    } label: {
                        if !viewModel.immersiveSpaceIsShown {
                            Image(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
                        } else {
                            Image(systemName: "arrow.down.right.and.arrow.up.left")
                        }
                    }
                    .buttonBorderShape(.circle)
                }
                Text(experienceModule.windowTitle + " \(viewModel.currentHotSpot) / \(experienceModule.hotSpotArray.count)")
                    .font(.headline)
                    .padding(.bottom)
                
                Text(currentHotSpot.description)
                    .font(.title2)
                
                HStack {
                    Button {
                        withAnimation {
                            if viewModel.currentHotSpot > 1 {
                                viewModel.currentHotSpot -= 1
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    .buttonBorderShape(.circle)
                    .opacity(viewModel.currentHotSpot > 1 ? 1 : 0)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            if viewModel.currentHotSpot < experienceModule.hotSpotArray.count {
                                viewModel.currentHotSpot += 1
                            } else {
                                viewModel.currentHotSpot = 1
                            }
                        }
                    } label: {
                        if viewModel.currentHotSpot < experienceModule.hotSpotArray.count {
                            Image(systemName: "arrow.right")
                        } else {
                            Image(systemName: "arrow.counterclockwise")
                        }
                    }
                    .buttonBorderShape(.circle)
                }
            }
            .padding()
            .padding()
            .glassBackgroundEffect()
            
            if let image = currentHotSpot.imageName {
                Image(image)
                    .resizable()
                    .clipShape(.rect(cornerRadius: 40))
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
    
    #Preview {
        MainWindowView(experienceModule: .showroom)
    }
