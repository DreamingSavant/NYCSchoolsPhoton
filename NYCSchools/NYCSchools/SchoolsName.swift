//
//  SchoolsName.swift
//  NYCSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation

struct SchoolsName: Decodable {
    let dbn: String?
    let schoolName, boro, overviewParagraph: String?
}

extension SchoolsName: Identifiable {
    var id: UUID {
        return UUID()
    }
}
