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
    
    //    let experienceModule : ExperienceModule
    //    @State var testEntity: Entity?
    let isFullScale : Bool
    var body: some View {
        
        RealityView { content, attachments in
            
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: isFullScale ? "VehicleScene" : "SmallVehicleScene", in: realityKitContentBundle) {
                print("loading scene")
                
                
                //                print("content= \(content)")
                
                //                scene1.position.y = -0.1
//                content.add(scene)
                if isFullScale {
                    let anchor = AnchorEntity(.plane(.horizontal, classification: .floor,
                                                     minimumBounds: [1, 1]))
                    
                    content.add(anchor)
                }
                
                content.add(scene)
                
                if isFullScale {
                    scene.position.z = -5
                }
                //                testEntity = scene
                print("content added")
                
                
                //                                viewModel.rootEntity = scene
                
                //
                //                subscriptions.append(content.subscribe(to: ComponentEvents.DidAdd.self, componentType: HotSpotComponent.self, { event in
                //                    print("component added at top")
                //                    makeHotSpotV3(entity: event.entity)
                //
                //                }))
                
                
                // BELOW: TEST ATTACHMENT
                //                if let testAttachment = attachments.entity(for: "TestTag") {
                //                    testAttachment.position = [0, 0.2, 0]
                //                    testAttachment.name = "attachment"
                //                    scene.addChild(testAttachment)
                //                }
                //                for hotSpot in experienceModule.hotSpotArray {
                //                    if let testAttachment = attachments.entity(for: hotSpot.uuid.uuidString) {
                //                        testAttachment.position = [0, 0.3, 0]
                //                        scene.addChild(testAttachment)
                //
                //                    }
                //                }
                for experience in ExperienceModule.allCases {
                    
                    for hotSpot in experience.hotSpotArray { // NEW LOGIC -- LOAD ALL HOTSPOTS AT ONCE, NOT JUST ONES IN PARTICLUAR EXPERIENCE
                        
//                                            if let testAttachment = attachments.entity(for: hotSpot.placement) {
                        if let testAttachment = attachments.entity(for: String(hotSpot.placement)+hotSpot.description) {
                            print("attachment")
                            // WHAT IF I MADE ENUM FOR PLACEMENTS (FRONT, TOP, SIDE) and called that enum here?
                            
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
            //            print("update called: \(content.entities.count)")
            ////            if experienceModule == .showroom {
            //                print("SHOW ROOM")
            //                for entity in content.entities {
            //                    if entity.name == "attachment" {
            //                        content.remove(entity)
            //                        print("removed")
            //                    }
            //                }
            //            }
        } attachments: {
            
            //            ForEach(attachmentsProvider.sortedTagViewPairs, id: \.tag) { attachment in
            //                attachment.view
            //            }
            
            //            Button {
            //                //
            //            } label: {
            //                Text("TestTag")
            //            }
            //            .padding()
            //            .glassBackgroundEffect()
            //            .tag("TestTag")
            
            
            //            ForEach(viewModel.currentExperience.hotSpotArray, id: \.self) {hotspot in
            //                HotSpotButtonView(hotSpotNumber: hotspot.placement, currentExperienceMode: viewModel.currentExperience)
            //                    .tag(hotspot.placement)
            //                    .onAppear {
            //                        print("appeared")
            //                    }
            //            }
            
            ForEach(ExperienceModule.allCases, id: \.self) { experience in
                ForEach(experience.hotSpotArray, id: \.self) { hotspot in
                    HotSpotButtonView(hotSpotNumber: hotspot.placement, currentExperienceMode: viewModel.currentExperience)
                        .opacity(viewModel.currentExperience == experience ? 1 : 0)
                        .tag(String(hotspot.placement)+hotspot.description)
//                        .tag(hotspot.description)
                        .onAppear {
                            print("appeared - Experience = \(experience), current Experience = \(viewModel.currentExperience))")
                        }
                }
                
            }
            
            
            //            HotSpotButtonView(hotSpotNumber: 1, currentExperienceMode: experienceModule)
            //            .tag("test_attachment")
        }
        //        .opacity(viewModel.immersiveSpaceIsShown ? 0 : 1)
        //        .onDisappear {
        //            print("on Disappear")
        //            if let testEntity {
        //                let found = testEntity.findEntity(named: "attachment")
        //                testEntity.removeChild(found!)
        //                        print("removed")
        //                    }
        ////                }
        ////            }
        ////            viewModel.rootEntity = nil
        //
        //        }
        //        .onDisappear {
        //            print("on Disappear")
        //            subscriptions = []
        //        }
        //        .onAppear {
        //            print("on appear")
        //            subscriptions = []
        //        }
    }
}

#Preview {
    VehicleView(isFullScale: false)
}
