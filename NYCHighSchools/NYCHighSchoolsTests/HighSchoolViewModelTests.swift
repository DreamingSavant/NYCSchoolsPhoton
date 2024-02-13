//
//  HighSchoolViewModelTests.swift
//  NYCHighSchools
//
//  Created by Roderick Presswood on 2/13/24.
//

import Foundation
import XCTest
@testable import NYCHighSchools

@MainActor
final class NYCHighSchoolViewModelTests: XCTestCase {
    var highschoolViewModel: HighSchoolViewModel!
    
    override func setUpWithError() throws {
        // given
        highschoolViewModel = HighSchoolViewModel(manager: MockNetworkManager())
    }
    
    override func tearDownWithError() throws {
        highschoolViewModel = nil
    }
    
    func testGetDataFromViewModel_whenWeAreExpecting_NoData_whenweDontPassURL() async throws {
        // when
        await highschoolViewModel.getDataFromCall(urlString: "")
        
        // then
        XCTAssertEqual(highschoolViewModel.highSchoolArray.count, 0)
        XCTAssertNotNil(highschoolViewModel.customError)
        XCTAssertEqual(highschoolViewModel.customError, NetworkingError.urlError)
    }
    
    func testGetDataFromViewModel_whenWeAreExpecting_Data_whenwePassURL() async throws {
        // when
        await highschoolViewModel.getDataFromCall(urlString: "Schoollist")
        
        // then
        XCTAssertNotNil(highschoolViewModel.highSchoolArray.count)
        XCTAssertNil(highschoolViewModel.customError)
        XCTAssertEqual(highschoolViewModel.customError, nil)
    }
}
