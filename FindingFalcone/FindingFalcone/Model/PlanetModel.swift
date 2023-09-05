//
//  PlanetModel.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import Foundation

struct PlanetModel: Codable, Hashable {
    var name: String
    var distance: Int
    
    static func initialize() -> PlanetModel {
        return PlanetModel(name: "", distance: 0)
    }
}
