//
//  Constants.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import Foundation

struct K {
    struct URL {
        static let countries = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
    }
    
    struct CellNames {
        static let countryCell = "CountryTableViewCell"
    }
    
    struct Dimensions  {
        static let cellRowHeight = 100
    }
    
    struct ErrorMessage {
        static let networkError = "Failed to load countries"
        static let decodingError = "Failed to decode"
    }
    
}

enum ServiceError: Error {
    case invalidURL
    case emptyData
}
