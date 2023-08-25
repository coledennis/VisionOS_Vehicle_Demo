//
//  HotSpotButtonView.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/25/23.
//

import SwiftUI

struct HotSpotButtonView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
//    var viewModel: ViewModel
    
    let hotSpotNumber: Int
    
    let currentExperienceMode: ExperienceModule
    
    var body: some View {
        Button(action: {
            //
            withAnimation {
                viewModel.currentHotSpot = hotSpotNumber
            }
        }, label: {
            if viewModel.currentHotSpot == hotSpotNumber {
                
//                if viewModel.immersiveSpaceIsShown {
                    Text(currentExperienceMode.hotSpotArray.first(where: {$0.placement == hotSpotNumber})?.title ?? "Error creating title")
                        .bold()
//                } else {
//                    Text(hotSpotNumber.description)
                    //
//                        .bold()
//                }
            } else {
                
//                if viewModel.immersiveSpaceIsShown {
//                    Text(hotSpotNumber.description)
//                    //                        .font(.system(size: 400))
//                        .bold()
//                } else {
                    
                    Text(hotSpotNumber.description)
                        .bold()
//                }
            }
        })
//        .buttonBorderShape(.)
        .tint(viewModel.currentHotSpot == hotSpotNumber ? .green : .clear)
        .padding()
        .glassBackgroundEffect()
    }
}

#Preview {
    HotSpotButtonView(hotSpotNumber: 1, currentExperienceMode: .showroom)
}
