//
//  ContentView.swift
//  NYCSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    
    private var gridColumns = [GridItem(), GridItem(), GridItem(.flexible(), spacing: 10, alignment: .bottom)]
    
    @StateObject var viewModel = SchoolViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                    List(viewModel.schoolsArray) { school in
                        NavigationLink {
                            DetailsScreen(school: school)
                        } label: {
                            SchoolCell(school: school)
                        }
                    }
                
            }
            .task {
                    await viewModel.getDataFromCall(urlString: APIEndpoints.nycSchoolsEndpoint)
                }
        }
    }
}

#Preview {
    ContentView()
}
