//
//  MockNetworkingManager.swift
//  NYCSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation
@testable import NYCSchools

class MockNetworkManager: Networking {
    func getDataFromNetworkingLayer<T>(url: URL, modelType: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: MockNetworkManager.self)
        let url = bundle.url(forResource: url.absoluteString, withExtension: "json")
        guard let url = url else {
            throw NetworkingError.urlError
        }
        do {
            let rawData = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(modelType.self, from: rawData)
            print(result)
            return result
        } catch {
            throw error
        }
    }
}
