//
//  DetailScreen.swift
//  NYCSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation
import SwiftUI

struct DetailsScreen: View {
    var school: SchoolsName
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(school.schoolName ?? "")
            Text(school.overviewParagraph ?? "")
        }
    }
    
}

