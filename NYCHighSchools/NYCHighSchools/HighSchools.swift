//
//  HighSchools.swift
//  NYCHighSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation

struct SchoolName: Codable {
    let dbn: String?
    let school_name, boro, overview_paragraph: String?
    
    init(dbn: String?, school_name: String?, boro: String?, overview_paragraph: String?) {
        self.dbn = dbn
        self.school_name = school_name
        self.boro = boro
        self.overview_paragraph = overview_paragraph
    }
    
    enum CodingKey: String {
        case id = "id"
        case dbn = "dbn"
        case school_name = "school_name"
        case boro
        case overviewParagraph = "overview_paragraph"
    }
}

extension SchoolName: Identifiable {
    var id: UUID {
        return UUID()
    }
}
