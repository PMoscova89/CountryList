//
//  CountryListViewSwiftUI.swift
//  Countries
//
//  Created by Patrick Moscova on 7/22/25.
//

import SwiftUI

struct CountryListViewSwiftUI: View {
    
    @StateObject private var viewModel = CountryListViewModelSwiftUI()
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading")
                }else if let error = viewModel.error {
                    ErrorView(error: error) {
                        Task {await viewModel.fetchCountries()}
                    }
                }
                else {
                    List(viewModel.filteredCountries){ country in
                        CountryRowView(country: country)
                        
                    }
                }
            }
            .navigationTitle("Countries")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            viewModel.filterCountries(with: newValue)
        }
    }
}

#Preview {
    CountryListViewSwiftUI()
}
