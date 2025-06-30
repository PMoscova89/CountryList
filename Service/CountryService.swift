//
//  CountryService.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import Foundation

final class CountryService: CountryServiceProtocol {
    //MARK: - Properties

    private let cache = NSCache<NSString, NSArray>()
    private let cacheKey: NSString = "countries"
    private let session : URLSession
    
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchCountries() async throws -> [Country] {
        if let cached = cache.object(forKey: cacheKey) as? [Country] {
            return cached
        }
        guard let url = URL(string: K.URL.countries) else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        let decode = JSONDecoder()
        let countries = try decode.decode([Country].self, from: data)
        
        cache .setObject(countries as NSArray, forKey:  cacheKey)
        
        return countries
    }
    
    
}
