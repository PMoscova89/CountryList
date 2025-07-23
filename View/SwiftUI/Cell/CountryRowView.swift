//
//  CountryRowView.swift
//  Countries
//
//  Created by Patrick Moscova on 7/23/25.
//

import SwiftUI

struct CountryRowView: View {
    let country: Country
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("\(country.name ?? "Unknown"), \(country.code ?? "--")")
                .font(.headline)
            Text(country.capital ?? "No Capital")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
