//
//  HighSchoolCell.swift
//  NYCHighSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation
import SwiftUI

struct HighSchoolCell: View {
    var highSchool: SchoolName
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(highSchool.school_name ?? "")
//                Text(highSchool.boro ?? "")
                Text(highSchool.dbn ?? "")
            }
        }
    }
}
