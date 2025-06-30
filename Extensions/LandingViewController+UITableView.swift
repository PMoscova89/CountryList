//
//  LandingViewController+UITableView.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import Foundation
import UIKit

extension LandingViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(K.Dimensions.cellRowHeight)
    }
}

extension LandingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentArray = viewModel.filteredCountries.isEmpty ?  viewModel.countries : viewModel.filteredCountries
        return currentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.CellNames.countryCell, for: indexPath) as? CountryTableViewCell else {
            return UITableViewCell()
        }
        let currentArray = viewModel.filteredCountries.isEmpty ?  viewModel.countries : viewModel.filteredCountries
        let currentCountry = currentArray[indexPath.row]
        cell.configureCellWithcountry(currentCountry)
        
        return cell
    }
    
    
}
