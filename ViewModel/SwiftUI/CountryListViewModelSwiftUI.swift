//
//  CountryListViewModelSwiftUI.swift
//  Countries
//
//  Created by Patrick Moscova on 7/23/25.
//
import Foundation

@MainActor
class CountryListViewModelSwiftUI : ObservableObject {
    @Published var countries: [Country] = []
    @Published var filteredCountries: [Country] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    
    private let service: CountryServiceProtocol
    
    init(service: CountryServiceProtocol = CountryService()) {
        self.service = service
        Task {
            await fetchCountries()
        }
    }
    func fetchCountries() async {
        isLoading = true
        do {
            let countries = try await service.fetchCountries()
            self.countries = countries
            self.filteredCountries = countries
            self.error = nil
        } catch {
            self.error = error
        }
        isLoading = false
    }
    
    func filterCountries(with searchText: String) {
        if searchText.isEmpty {
            filteredCountries = countries
        }else {
            filteredCountries = countries.filter { country in
                (country.name ?? "").localizedCaseInsensitiveContains(searchText) ||
                (country.capital ?? "").localizedCaseInsensitiveContains(searchText) ||
                (country.code ?? "").localizedCaseInsensitiveContains(searchText)
                
            }
        }
    }
}
