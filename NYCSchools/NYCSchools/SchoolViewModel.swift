//
//  SchoolViewModel.swift
//  NYCSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation

final class SchoolViewModel: ObservableObject {
    
    @Published var schoolsArray = [SchoolsName]()
    @Published var customError: NetworkingError?
    
    private var manager: Networking
    
    init(manager: Networking = NetworkManager()) {
        self.manager = manager
    }
    
    @MainActor
    func getDataFromCall(urlString: String) async {
        guard let url = URL(string: urlString) else {
            customError = NetworkingError.urlError
            return
        }
        do {
            let schoolArray = try await manager.getDataFromNetworkingLayer(url: url, modelType: [SchoolsName].self)
            self.schoolsArray = schoolArray
            print(self.schoolsArray)
        } catch {
            self.customError = NetworkingError.dataError
            print(error.localizedDescription)
        }
    }
}
