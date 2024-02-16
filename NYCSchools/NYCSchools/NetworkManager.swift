//
//  NetworkManager.swift
//  NYCSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation

protocol Networking {
    func getDataFromNetworkingLayer<T: Decodable>(url:URL, modelType: T.Type) async throws -> T
}

enum NetworkingError: Error {
    case urlError
    case serverError
    case dataError
    case parsingError
}

class NetworkManager: Networking {
    func getDataFromNetworkingLayer<T>(url: URL, modelType: T.Type) async throws -> T where T: Decodable {
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let parsedData = try decoder.decode(modelType, from: data)
        return parsedData
    }
}
