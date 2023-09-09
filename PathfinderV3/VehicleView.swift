//
//  VehicleView.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/24/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct VehicleView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
    let isFullScale : Bool
    var body: some View {
        
        RealityView { content, attachments in
            
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: isFullScale ? "VehicleScene Interior" : "SmallVehicleScene", in: realityKitContentBundle) {
                print("loading scene")
                
                if isFullScale {
                    let anchor = AnchorEntity(.plane(.horizontal, classification: .floor,
                                                     minimumBounds: [1, 1]))
                    
                    content.add(anchor)
                }
                
                content.add(scene)
                
                if isFullScale {
                    scene.position.z = -5
                }
                
                for experience in ExperienceModule.allCases {
                    
                    for hotSpot in experience.hotSpotArray {
                        
                        if let testAttachment = attachments.entity(for: String(hotSpot.placement)+hotSpot.description) {
                            print("attachment")
                            
                            if let coordinate = hotSpot.coordinate {
                                testAttachment.position = (isFullScale ? coordinate.largeCoordinates : coordinate.smallCoordinates)
                            } else {
                                
                                testAttachment.position = [(Float(hotSpot.placement) * -0.1), 0.2, 0]
                            }
                            testAttachment.name = "attachment"
                            
                            testAttachment.scale = (isFullScale ? [8,8,8] : [1,1,1])
                            scene.addChild(testAttachment)
                            
                        }
                    }
                }
                
            }
        }  update: { content, attachments in
            
        } attachments: {
            
            ForEach(ExperienceModule.allCases, id: \.self) { experience in
                ForEach(experience.hotSpotArray, id: \.self) { hotspot in
                    HotSpotButtonView(hotSpotNumber: hotspot.placement, currentExperienceMode: viewModel.currentExperience)
                        .opacity(viewModel.currentExperience == experience ? 1 : 0)
                        .tag(String(hotspot.placement)+hotspot.description)
                        .onAppear {
                            print("appeared - Experience = \(experience), current Experience = \(viewModel.currentExperience))")
                        }
                }
            }
        }
    }
}

#Preview {
    VehicleView(isFullScale: false)
}
