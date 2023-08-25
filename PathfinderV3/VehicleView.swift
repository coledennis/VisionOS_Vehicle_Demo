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
    var body: some View {
        
        RealityView { content, attachments in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "SmallVehicleScene", in: realityKitContentBundle) {
                
            
                //                scene1.position.y = -0.1
                content.add(scene)
                
                //                viewModel.rootEntity = scene1
                
                //
                //                subscriptions.append(content.subscribe(to: ComponentEvents.DidAdd.self, componentType: HotSpotComponent.self, { event in
                //                    print("component added at top")
                //                    makeHotSpotV3(entity: event.entity)
                //
                //                }))
                
                
                // BELOW: TEST ATTACHMENT
                if let testAttachment = attachments.entity(for: "test_attachment") {
                    testAttachment.position = [0, 0.2, 0]
                    scene.addChild(testAttachment)
                    
                }
            }
        } update: { content, attachments in
            
            //            viewModel.rootEntity?.scene?.performQuery(Self.runtimeQuery).forEach { entity in
            //
            //                guard let component = entity.components[HotSpotRuntimeComponent.self] else { return }
            //
            //                // Get the entity from the collection of attachments keyed by tag.
            //                guard let attachmentEntity = attachments.entity(for: component.attachmentTag) else { return }
            //
            //                // Attachments are region-specific. They react when the slider changes from one map to the other.
            //                // Take the region configured in Reality Composer Pro and give it to the corresponding attachment
            //                // entity. These entities also need OpacityComponents so they can fade in and out as the map changes
            ////                if let pointOfInterestComponent = entity.components[HotSpotComponent.self] {
            ////                    attachmentEntity.components.set(RegionSpecificComponent(region: pointOfInterestComponent.region))
            ////                    attachmentEntity.components.set(OpacityComponent(opacity: 0))
            ////                }
            //
            //                viewModel.rootEntity?.addChild(attachmentEntity)
            //                attachmentEntity.setPosition([0, 0, 0], relativeTo: entity)
            ////                attachmentEntity.components.set(BillboardComponent())
            //            }
            
            
        } attachments: {
            
            //            ForEach(attachmentsProvider.sortedTagViewPairs, id: \.tag) { attachment in
            //                attachment.view
            //            }
            
            Button {
                //
            } label: {
                Text("TestTag")
            }
            .padding()
            .glassBackgroundEffect()
            .tag("test_attachment")
        }
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
    VehicleView()
}