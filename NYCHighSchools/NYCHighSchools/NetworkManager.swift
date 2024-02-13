//
//  NetworkManager.swift
//  NYCHighSchools
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
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            return parsedData
        } catch {
            throw error
        }
    }
}
