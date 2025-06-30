//
//  ViewController.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import UIKit

class LandingViewController: UIViewController {
//I want to make this private but I want a small view controller file. So I'm keeping it as "internal" so I can use extension files. 
    let viewModel = CountryListViewModel(service: CountryService())
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.delegate = self
        setupTableView()
        searchBar.delegate = self
        Task {
            await viewModel.fetchCountries()
        }
    }


    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.CellNames.countryCell, bundle: .main), forCellReuseIdentifier: K.CellNames.countryCell)
    }
}

