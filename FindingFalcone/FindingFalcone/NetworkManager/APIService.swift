//
//  APIService.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import Foundation

enum ApiError : Error {
    case responseProblem
    case decodingProblem
    case failureMessage(message : String)
}


class APIService {
    static let shared = APIService()
    private init() {}
    
    func request<T: Codable>(resultType: T.Type, endpoint: Endpoint, completionHandler: @escaping (Result<T,ApiError>) -> Void) {
        var requestUrl = URLRequest(url: URL(string: endpoint.url)!)
        requestUrl.httpMethod = endpoint.method
        requestUrl.allHTTPHeaderFields = endpoint.headers
        requestUrl.httpBody = endpoint.parameters
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            guard let jsonData = responseData , let urlResponse = httpUrlResponse as? HTTPURLResponse else {
                completionHandler(.failure(.responseProblem))
                return
            }
            if !(200..<300).contains(urlResponse.statusCode) {
                guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else { return }
                guard let message = json["error"] as? String else { return }
                completionHandler(.failure(.failureMessage(message: message)))
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: jsonData)
                completionHandler(.success(result))
            } catch let error {
                debugPrint("error occured while decoding = \(error.localizedDescription)")
                completionHandler(.failure(.decodingProblem))
            }
        }.resume()
    }
}
