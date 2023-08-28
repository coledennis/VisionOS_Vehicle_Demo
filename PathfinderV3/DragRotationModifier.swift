//
//  DragRotationModifier.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/27/23.
//

/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A modifier for turning drag gestures into rotation.
*/

import SwiftUI
import RealityKit

extension View {
    /// Enables people to drag an entity to rotate it, with optional limitations
    /// on the rotation in yaw and pitch.
    func dragRotation(
        yawLimit: Angle? = nil,
        pitchLimit: Angle? = nil,
        sensitivity: Double = 10
    ) -> some View {
        self.modifier(
            DragRotationModifier(
                yawLimit: yawLimit,
                pitchLimit: pitchLimit,
                sensitivity: sensitivity
            )
        )
    }
}

/// A modifier converts drag gestures into entity rotation.
private struct DragRotationModifier: ViewModifier {
    var yawLimit: Angle?
    var pitchLimit: Angle?
    var sensitivity: Double

    @State private var baseYaw: Double = 0
    @State private var yaw: Double = 0
    @State private var basePitch: Double = 0
    @State private var pitch: Double = 0

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(.radians(yaw == 0 ? 0.01 : yaw), axis: .y)
            .rotation3DEffect(.radians(pitch == 0 ? 0.01 : pitch), axis: .x)
            .gesture(DragGesture(minimumDistance: 0.0)
                .targetedToAnyEntity()
                .onChanged { value in
                    // Find the current linear displacement.
                    let location3D = value.convert(value.location3D, from: .local, to: .scene)
                    let startLocation3D = value.convert(value.startLocation3D, from: .local, to: .scene)
                    let delta = location3D - startLocation3D

                    // Use an interactive spring animation that becomes
                    // a spring animation when the gesture ends below.
                    withAnimation(.interactiveSpring) {
                        yaw = spin(displacement: Double(delta.x), base: baseYaw, limit: yawLimit)
                        pitch = spin(displacement: Double(delta.y), base: basePitch, limit: pitchLimit)
                    }
                }
                .onEnded { value in
                    // Find the current and predicted final linear displacements.
                    let location3D = value.convert(value.location3D, from: .local, to: .scene)
                    let startLocation3D = value.convert(value.startLocation3D, from: .local, to: .scene)
                    let predictedEndLocation3D = value.convert(value.predictedEndLocation3D, from: .local, to: .scene)
                    let delta = location3D - startLocation3D
                    let predictedDelta = predictedEndLocation3D - location3D

                    // Set the final spin value using a spring animation.
                    withAnimation(.spring) {
                        yaw = finalSpin(
                            displacement: Double(delta.x),
                            predictedDisplacement: Double(predictedDelta.x),
                            base: baseYaw,
                            limit: yawLimit)
                        pitch = finalSpin(
                            displacement: Double(delta.y),
                            predictedDisplacement: Double(predictedDelta.y),
                            base: basePitch,
                            limit: pitchLimit)
                    }

                    // Store the last value for use by the next gesture.
                    baseYaw = yaw
                    basePitch = pitch
                }
            )
    }

    /// Finds the spin for the specified linear displacement, subject to an
    /// optional limit.
    private func spin(
        displacement: Double,
        base: Double,
        limit: Angle?
    ) -> Double {
        if let limit {
            return atan(displacement * sensitivity) * (limit.degrees / 90)
        } else {
            return base + displacement * sensitivity
        }
    }

    /// Finds the final spin given the current and predicted final linear
    /// displacements, or zero when the spin is restricted.
    private func finalSpin(
        displacement: Double,
        predictedDisplacement: Double,
        base: Double,
        limit: Angle?
    ) -> Double {
        // If there is a spin limit, always return to zero spin at the end.
        guard limit == nil else { return 0 }

        // Find the projected final linear displacement, capped at 1 more revolution.
        let cap = .pi * 2.0 / sensitivity
        let delta = displacement + max(-cap, min(cap, predictedDisplacement))

        // Find the final spin.
        return base + delta * sensitivity
    }
}



//extension View {
//    /// Listens for gestures and places an item based on those inputs.
//    func placementGestures(
//        initialPosition: Point3D = .zero
//    ) -> some View {
//        self.modifier(
//            PlacementGesturesModifier(
//                initialPosition: initialPosition
//            )
//        )
//    }
//}

/// A modifier that adds gestures and positioning to a view.
//private struct PlacementGesturesModifier: ViewModifier {
//    var initialPosition: Point3D
//
//    @State private var scale: Double = 1
//    @State private var startScale: Double? = nil
//    @State private var position: Point3D = .zero
//    @State private var startPosition: Point3D? = nil
//
//    func body(content: Content) -> some View {
//        content
//            .onAppear {
//                position = initialPosition
//            }
//            .scaleEffect(scale)
//            .position(x: position.x, y: position.y)
//            .offset(z: position.z)
//
//            // Enable people to move the model anywhere in their space.
//            .simultaneousGesture(DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
//                .onChanged { value in
//                    if let startPosition {
//                        let delta = value.location3D - value.startLocation3D
//                        position = startPosition + delta
//                    } else {
//                        startPosition = position
//                    }
//                }
//                .onEnded { _ in
//                    startPosition = nil
//                }
//            )
//
//            // Enable people to scale the model within certain bounds.
//            .simultaneousGesture(MagnifyGesture()
//                .onChanged { value in
//                    if let startScale {
//                        scale = max(0.1, min(3, value.magnification * startScale))
//                    } else {
//                        startScale = scale
//                    }
//                }
//                .onEnded { value in
//                    startScale = scale
//                }
//            )
//    }
//}
