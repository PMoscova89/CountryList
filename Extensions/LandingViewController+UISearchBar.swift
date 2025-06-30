//
//  CountryListViewController+UISearchBar.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import Foundation
import UIKit

extension LandingViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterCountries(with: searchText)
    }
}
