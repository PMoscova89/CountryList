//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Patrick Moscova on 6/30/25.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWithcountry(_ country: Country) {
        nameLabel.text = "\(country.name ?? ""), \(country.region ?? "")"
        countryCodeLabel.text = "\(country.code ?? "") "
        capitalLabel.text = "\(country.capital ?? "")"
    }

}
