//
//  CountryServiceProtocol.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import Foundation


protocol CountryServiceProtocol {
    func fetchCountries() async throws -> [Country]
}
