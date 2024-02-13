//
//  NYCSchoolViewModelTests.swift
//  NYCSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation
import XCTest
@testable import NYCSchools

@MainActor
final class NYCSchoolViewModelTests: XCTestCase {
    var schoolViewModel: SchoolViewModel!
    
    override func setUpWithError() throws {
        // given
        schoolViewModel = SchoolViewModel(manager: MockNetworkManager())
    }
    
    override func tearDownWithError() throws {
        schoolViewModel = nil
    }
    
    func testGetDataFromViewModel_whenWeAreExpecting_NoData_whenweDontPassURL() async throws {
        // when
        await schoolViewModel.getDataFromCall(urlString: "")
        
        // then
        XCTAssertEqual(schoolViewModel.schoolsArray.count, 0)
        XCTAssertNotNil(schoolViewModel.customError)
        XCTAssertEqual(schoolViewModel.customError, NetworkingError.urlError)
    }
    
    func testGetDataFromViewModel_whenWeAreExpecting_Data_whenwePassURL() async throws {
        // when
        await schoolViewModel.getDataFromCall(urlString: "Schoollist")
        
        // then
        XCTAssertNotNil(schoolViewModel.schoolsArray.count)
        XCTAssertNil(schoolViewModel.customError)
        XCTAssertEqual(schoolViewModel.customError, nil)
    }
}
