//
//  FindFalconeModel.swift
//  FindingFalcone
//
//  Created by Admin on 28/08/23.
//

import SwiftUI

struct FindFalconeModel: Codable {
    let planetName: String?
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case planetName = "planet_name"
        case status
    }
}
