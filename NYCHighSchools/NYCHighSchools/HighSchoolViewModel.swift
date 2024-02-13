//
//  HighSchoolViewModel.swift
//  NYCHighSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation

@MainActor
class HighSchoolViewModel: ObservableObject {
    
    @Published var highSchoolArray = [SchoolName]()
    @Published var customError: NetworkingError?
    
    var manager: Networking
    
    init(manager: Networking = NetworkManager()) {
        self.manager = manager
    }
    
    func getDataFromCall(urlString: String) async {
        do {
            guard let url = URL(string: urlString) else {
                customError = NetworkingError.urlError
                throw NetworkingError.urlError
            }
            
            let schoolArray = try await manager.getDataFromNetworkingLayer(url: url, modelType: [SchoolName].self)
            self.highSchoolArray = schoolArray
            print(self.highSchoolArray)
        } catch {
            
            switch error {
            case is URLError:
                customError = NetworkingError.urlError
            case is DecodingError:
                customError = NetworkingError.parsingError
            case NetworkingError.parsingError:
                customError = NetworkingError.parsingError
            case NetworkingError.urlError:
                customError = NetworkingError.urlError
            case NetworkingError.serverError:
                customError = NetworkingError.serverError
            default:
                customError = NetworkingError.dataError
            }
            print(error.localizedDescription)
        }
    }
}
