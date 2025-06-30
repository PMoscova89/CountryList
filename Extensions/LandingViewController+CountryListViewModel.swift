//
//  LandingViewController+CountryListViewModel.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import Foundation
import UIKit

extension LandingViewController : CountryListViewModelDelegate {
    func viewModel(_ viewModel: CountryListViewModel, didUpdateCountries countries: [Country]) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func viewModel(_ viewModel: CountryListViewModel, didUpdateFilteredCountries countries: [Country]) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }
    
    func viewModel(_ viewModel: CountryListViewModel, didEncounterError error: Error) {
        let alertController = UIAlertController(title: "Error in view model", message: error.localizedDescription, preferredStyle: .alert)
        
        // Add an action (button) to the alert
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            print("OK tapped")
        })
        
        // Add the action to the alert controller
        alertController.addAction(okAction)
        
        // Present the alert controller
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
