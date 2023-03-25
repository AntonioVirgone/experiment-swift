//
//  ConverterTest.swift
//  ConverterTest
//
//  Created by Antonio Virgone on 25/03/23.
//

import XCTest

final class ConverterTest: XCTestCase {
    private var sut: Converters!
    
    override func setUpWithError() throws {
        sut = Converters()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testConvert10Returns1080() {
        let result = sut.convertEuroToUSD(euro: "10")
        let expected = "$10.80"
        
        XCTAssertEqual(result, expected)
    }
    
    func testConvertNeg10ReturnsErrorMessage() {
        let result = sut.convertEuroToUSD(euro: "-10")
        let expected = "Please enter a positive number."
        
        XCTAssertEqual(result, expected)
    }
    
    func testConvertNeg1000000ReturnsErrorMessage() {
        let result = sut.convertEuroToUSD(euro: "1000000")
        let expected = "Value too big to convert"
        
        XCTAssertEqual(result, expected)
    }
}
