//
//  VehicleResponseModel.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import Foundation

struct VehicleModel: Codable, Hashable {
    var name: String
    var totalNo, maxDistance, speed: Int

    enum CodingKeys: String, CodingKey {
        case name
        case totalNo = "total_no"
        case maxDistance = "max_distance"
        case speed
    }
    
    
    static func initialize() -> VehicleModel {
        return VehicleModel(name: "", totalNo: 0, maxDistance: 0, speed: 1)
    }
}
