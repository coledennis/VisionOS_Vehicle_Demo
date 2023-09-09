//
//  AttachmentLocations.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/27/23.
//

import Foundation

enum AttachmentLocations {
    case front, top, back, teeth
    
    var smallCoordinates:  SIMD3<Float> {
        switch self {
        case .front:
            [-0.2, 0.1, 0]
        case .top:
            [0.005, 0.12, 0]
        case .back:
            [0.2, 0.1, 0]
        case .teeth:
            [-0.2, 0.05, 0]
        }
    }
    var largeCoordinates:  SIMD3<Float> {
        switch self {
        case .front:
            [-3, 3, 0]
        case .top:
            [0.005, 4, 0]
        case .back:
            [3, 3.5, 0]
        case .teeth:
            [-5, 2, 0]
        }
    }
    
}
