//
//  DetailScreen.swift
//  NYCHighSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation
import SwiftUI

struct DetailsScreen: View {
    var highSchool: SchoolName
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(highSchool.school_name ?? "")
//            Text(highSchool.boro ?? "")
            Text(highSchool.overview_paragraph ?? "")
        }
    }
    
}

