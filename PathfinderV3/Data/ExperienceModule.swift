//
//  ExperienceModule.swift
//  PathfinderV3
//
//  Created by Cole Dennis on 8/24/23.
//

import Foundation

enum ExperienceModule: String, Identifiable, CaseIterable, Equatable {
    var id: Self { self }
    
    // Data for experiences
    case showroom, precheck, startup, shutdown, attachments

    
    var windowTitle: String {
        switch self {
        case .showroom:
            "Volvo L220H"
        case .precheck:
            "Pre-Check"
        case .startup:
            "Start Up"
        case .shutdown:
            "Shut Down"
        case .attachments:
            "Attachments"
        }
    }
    
    var windowSubtitle: String {
        switch self {
        case .showroom:
            "Starting at $10,000"
        case .precheck:
            "Subtitle"
        case .startup:
            "Subtitle"
        case .shutdown:
            "Subtitle"
        case .attachments:
            "Subtitle"
        }
    }
    
    var hotSpotArray: [HotSpotData] {
        switch self {
        case .showroom:
            [HotSpotData(placement: 1, title: "Power and Precision", description: "The Volvo L220H Loader is a formidable workhorse that combines raw power with unparalleled precision. With its robust construction and advanced hydraulic system, this machine effortlessly tackles heavy loads, making it an ideal choice for construction and mining operations.", coordinate: .front),
             HotSpotData(placement: 2, title: "Eco-Friendly Excellence", description: "Experience eco-friendly excellence with the Volvo L220H Loader, which boasts impressive fuel efficiency and reduced emissions. Equipped with state-of-the-art technology, including an optimized engine and intelligent hydraulics, this loader delivers exceptional performance while minimizing its environmental footprint.", coordinate: .top),
             HotSpotData(placement: 3, title: "Unstoppable Force", description: "Conquer challenging terrains effortlessly with the Volvo L220H Loader, a true powerhouse designed to handle the toughest conditions. Its superior traction control, enhanced stability, and powerful lifting capacity ensure that no job is too demanding.", coordinate: .back),
             HotSpotData(placement: 4, title: "Smart Performance", description: "Embrace the future of construction equipment with the Volvo L220H Loader, equipped with cutting-edge technology to enhance operational efficiency. The integrated load-sensing hydraulic system adjusts power delivery based on demand, optimizing fuel consumption and reducing wear and tear."),
             HotSpotData(placement: 5, title: "Operator-Centric Design", description: "Prioritize operator well-being with the Volvo L220H Loader's thoughtfully designed cabin, offering unmatched comfort and control. Ergonomically positioned controls, spacious interior, and excellent visibility ensure operators remain focused and comfortable during long hours of operation.")]
        case .precheck:
            [
                HotSpotData(placement: 1, title: "Engine Off", description: "Before starting any checks, make sure to verify that the engine is completely deactivated to ensure safety and prevent any accidental startup."),
                HotSpotData(placement: 2, title: "Check Teeth", description: "Perform a thorough examination of the teeth to ensure they are in proper working order, without any signs of damage or malfunction, as they are crucial for efficient operation.", imageName: "Pre-Check 2"),
                HotSpotData(placement: 3, title: "Inspect Hose Linkage", description: "Take time to inspect the hoses at the linkage points carefully. Look for any signs of leaks or damage, as these could lead to operational issues or fluid loss.", imageName: "Pre-Check 3"),
                HotSpotData(placement: 4, title: "Inspect Tires", description: "Conduct a comprehensive assessment of all tires. Look for any visible damage, such as cuts, punctures, or irregularities, that might affect the equipment's stability and performance.", imageName: "Pre-Check 4"),
                HotSpotData(placement: 5, title: "Check Oil Levels", description: "Using the sight glasses, verify that the hydraulic and transmission oil levels are within acceptable ranges. Proper oil levels are essential for the smooth functioning and longevity of the equipment.", imageName: "Pre-Check 5"),
                HotSpotData(placement: 6, title: "Clear Radiator Fan", description: "Carefully examine the radiator area for any accumulation of dust, debris, or foreign materials that might be obstructing the fan. Clearing the radiator fan will help maintain optimal cooling.", imageName: "Pre-Check 6"),
                HotSpotData(placement: 7, title: "Activate Battery Switch", description: "Turn on the main battery switch to provide power to the equipment. Ensure that this step is performed safely and within the recommended procedures.", imageName: "Pre-Check 7"),
                HotSpotData(placement: 8, title: "Safe Cab Entry", description: "When entering the cab, always make sure to maintain at least three points of contact to ensure stability and prevent slips or falls. This safety measure is essential to protect yourself during the entry process.", imageName: "Pre-Check 8")
            ]
        case .startup:
            []
        case .shutdown:
            []
        case .attachments:
            []
        }
    }
    
}
