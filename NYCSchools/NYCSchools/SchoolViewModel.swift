//
//  SchoolViewModel.swift
//  NYCSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation

@MainActor
class SchoolViewModel: ObservableObject {
    
    @Published var schoolsArray = [SchoolsName]()
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
            
            let schoolArray = try await manager.getDataFromNetworkingLayer(url: url, modelType: [SchoolsName].self)
            self.schoolsArray = schoolArray
            print(self.schoolsArray)
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
