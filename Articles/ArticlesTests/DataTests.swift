//
//  DataTests.swift
//  ArticlesTests
//
//  Created by chams on 06/06/2019.
//  Copyright © 2019 Chams. All rights reserved.
//

import XCTest

class DataTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLoadingData() {
        let articles: [Article] = Loader.load("articleData.json")
        
        XCTAssertEqual(articles[0].id, 1002)
        XCTAssertEqual(articles.count, 4)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
