//
//  CountryMapper.swift
//  SwiftTemplateTests
//
//  Created by zaharijepasalic on 6/29/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import XCTest

class CountryMapperTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testToDatabase() {


        let country: Country = Country(map: ObjectMapper())
        country.id = "1"
        country.name = "Bosnia and Herzegovina"
        let dbCountry: DBCountry = CountryMapper().toDatabase(apiModel: country)
        XCTAssertEqual(dbCountry.id, "1")
        XCTAssertEqual(dbCountry.name, "Bosnia and Herzegovina")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
