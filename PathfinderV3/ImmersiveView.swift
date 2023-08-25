//
//  ImmersiveView.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/23/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "VehicleScene", in: realityKitContentBundle) {
                
                let anchor = AnchorEntity(.plane(.horizontal, classification: .floor,
                                                 minimumBounds: [1, 1]))
                content.add(anchor)
                
                content.add(scene)
                scene.position.z = -5
            }
        }
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
