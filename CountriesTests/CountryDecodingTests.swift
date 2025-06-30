//
//  CountryDecodingTests.swift
//  CountriesTests
//
//  Created by Patrick Moscova on 6/30/25.
//

import Foundation
@testable import Countries
import XCTest

final class CountryDecodingTests: XCTestCase {
    
    func testDecoding_WithFullData() throws {
        let json = """
        {
            "capital": "Kabul",
            "code": "AF",
            "currency": {
                "code": "AFN",
                "name": "Afghan afghani",
                "symbol": "؋"
            },
            "flag": "https://restcountries.eu/data/afg.svg",
            "language": {
                "code": "ps",
                "name": "Pashto"
            },
            "name": "Afghanistan",
            "region": "AS"
        }
        """
        
        let data = Data(json.utf8)
        let decoder = JSONDecoder()
        let country = try decoder.decode(Country.self, from: data)
        
        XCTAssertEqual(country.name, "Afghanistan")
        XCTAssertEqual(country.code, "AF")
        XCTAssertEqual(country.capital, "Kabul")
        XCTAssertEqual(country.region, "AS")
    }
    
    func testCountryDecoding_WithMissingCurrencyAndLanguage() throws {
        let json = """
        {
            "capital": "Testville",
            "code": "TV",
            "flag": "https://example.com/flag.svg",
            "name": "Testland",
            "region": "XX"
        }
        """
        
        let data = Data(json.utf8)
        let decoder = JSONDecoder()
        let country = try decoder.decode(Country.self, from: data)
        
        XCTAssertEqual(country.name, "Testville")
        XCTAssertNil(country.currency)
        XCTAssertNil(country.language)
    }
}
