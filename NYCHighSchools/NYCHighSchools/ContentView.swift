//
//  ContentView.swift
//  NYCHighSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    
    private var gridColumns = [GridItem(), GridItem(), GridItem(.flexible(), spacing: 10, alignment: .bottom)]
    
    @StateObject var viewModel = HighSchoolViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                    List(viewModel.highSchoolArray) { highSchool in
                        NavigationLink {
                            DetailsScreen(highSchool: highSchool)
                        } label: {
                            HighSchoolCell(highSchool: highSchool)
                        }
                    }
                
            }
//            .onAppear {
            .task {
                    await viewModel.getDataFromCall(urlString: APIEndpoints.nycHighSchoolsEndpoint)
                }
//            }
        }
    }
}

#Preview {
    ContentView()
}
