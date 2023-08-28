//
//  ViewModel.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/24/23.
//

import Foundation
import Observation


@Observable
class ViewModel {
    
    var showImmersiveSpace = false
    var immersiveSpaceIsShown = false
 
    var currentHotSpot: Int = 1
    
    var currentExperience: ExperienceModule = .showroom
    
    var rotation = 0.0
}
