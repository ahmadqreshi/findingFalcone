//
//  Endpoint.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import Foundation

//MARK: - API endpoints

enum Endpoint {
    
    static let baseUrl = "https://findfalcone.geektrust.com"
    
    
    case token
    case planets
    case vehicles
    case find(token: String, planetNames: [String], vehicleNames: [String])
    
    
    
    var urlEndpoint: String {
        switch self {
        case .token:
            return "token"
        case .planets:
            return "planets"
        case .vehicles:
            return "vehicles"
        case .find:
            return "find"
        }
    }
    
    var url: String {
        return "\(Endpoint.baseUrl)/\(urlEndpoint)"
    }
    
    var method: String {
        switch self {
        case .token:
            return "POST"
        case .planets:
            return "GET"
        case .vehicles:
            return "GET"
        case .find:
            return "POST"
        }
    }
    
    
    
    var parameters: Data? {
        switch self {
        
        case .find(let token, let planetNames, let vehiclesNmaes):
            let request = ["token": token, "planet_names" : planetNames, "vehicle_names": vehiclesNmaes] as [String : Any]
            let jsonData = try? JSONSerialization.data(withJSONObject: request)
            return jsonData
        default:
            return nil
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .token:
           return ["Accept": "application/json"]
        case .find:
            return ["Accept": "application/json" ,"Content-Type": "application/json"]
        default:
            return nil
        }
    }
}
