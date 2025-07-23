//
//  Country.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import Foundation


struct Country: Codable, Equatable, Identifiable {
     let capital: String?
     let code: String?
    let currency: Currency?
    let flag: String?
    let language: Language?
    let name: String?
    let region: String?
    
    var id: String {
        code ?? name ?? UUID().uuidString
    }
    
}


struct Currency: Codable, Equatable {
    let code: String?
    let name: String?
    let symbol: String?
}

struct Language: Codable, Equatable {
    let code: String?
    let name: String?
}
