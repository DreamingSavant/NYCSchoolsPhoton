//
//  SchoolCell.swift
//  NYCSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation
import SwiftUI

struct SchoolCell: View {
    var school: SchoolsName
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(school.schoolName ?? "")
                Text(school.dbn ?? "")
            }
        }
    }
}
