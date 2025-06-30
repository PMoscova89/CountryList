//
//  CountryListViewMocel.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import Foundation


protocol CountryListViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: CountryListViewModel, didUpdateCountries countries: [Country])
    func viewModel(_ viewModel: CountryListViewModel, didUpdateFilteredCountries countries: [Country])
    func viewModel(_ viewModel: CountryListViewModel, didEncounterError error: Error)
}

class CountryListViewModel {
    
    weak var delegate: CountryListViewModelDelegate?
    
    private let service: CountryServiceProtocol
    
    private(set) var countries: [Country] = [] {
        didSet {
            delegate?.viewModel(self, didUpdateCountries: countries)
        }
    }
    
    private(set) var filteredCountries: [Country] = [] {
        didSet {
            delegate?.viewModel(self, didUpdateFilteredCountries: filteredCountries)
        }
    }
    
    init(service: CountryServiceProtocol) {
        self.service = service
    }
    
    
    func fetchCountries() async {
        do {
            let fetchedCountries = try await service.fetchCountries()
            self.countries = fetchedCountries
            self.filteredCountries = fetchedCountries
        }catch{
            delegate?.viewModel(self, didEncounterError: error)
        }
    }
    
    func filterCountries(with searchText: String) {
        if searchText.isEmpty {
            filteredCountries = countries
        } else {
            filteredCountries = countries.filter {
                ($0.name?.localizedCaseInsensitiveContains(searchText) ?? false) ||
                ($0.capital?.localizedCaseInsensitiveContains(searchText) ?? false)
            }
        }
    }
    
}
