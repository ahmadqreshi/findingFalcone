//
//  DataRepository.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import Foundation

class DataRepository {
    
    func getPlanetsList(success: @escaping ([PlanetModel]) -> Void, failure: @escaping (String) -> Void) {
        APIService.shared.request(resultType: [PlanetModel].self, endpoint: .planets) { response in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let error):
                switch error {
                case .decodingProblem :
                    debugPrint("decoding problem")
                case .responseProblem :
                    debugPrint("Server authorization failed")
                case .failureMessage(let message) :
                    failure(message)
                }
            }
        }
    }
    
    func getVehiclesList(success: @escaping ([VehicleModel]) -> Void, failure: @escaping (String) -> Void) {
        APIService.shared.request(resultType: [VehicleModel].self, endpoint: .vehicles) { response in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let error):
                switch error {
                case .decodingProblem :
                    debugPrint("decoding problem")
                case .responseProblem :
                    debugPrint("Server authorization failed")
                case .failureMessage(let message) :
                    failure(message)
                }
            }
        }
    }
    
    func getToken(success: @escaping (TokenModel) -> Void, failure: @escaping (String) -> Void) {
        APIService.shared.request(resultType: TokenModel.self, endpoint: .token) { response in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let error):
                switch error {
                case .decodingProblem :
                    debugPrint("decoding problem")
                case .responseProblem :
                    debugPrint("Server authorization failed")
                case .failureMessage(let message) :
                    failure(message)
                }
            }
        }
    }
    
    
    func findFalcone(token: String, planetNames: [String], vehicleNames: [String], success: @escaping (FindFalconeModel) -> Void, failure: @escaping (String) -> Void) {
        APIService.shared.request(resultType: FindFalconeModel.self, endpoint: .find(token: token, planetNames: planetNames, vehicleNames: vehicleNames)) { response in
            switch response {
            case .success(let data):
                success(data)
            case .failure(let error):
                switch error {
                case .decodingProblem :
                    debugPrint("decoding problem")
                case .responseProblem :
                    debugPrint("Server authorization failed")
                case .failureMessage(let message) :
                    failure(message)
                }
            }
        }
    }
    
    
}
