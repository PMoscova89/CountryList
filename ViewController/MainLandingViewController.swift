//
//  MainLandingViewController.swift
//  Countries
//
//  Created by Patrick Moscova on 7/22/25.
//

import UIKit
import SwiftUI

class MainLandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func swiftUIButtonTapped(_ sender: Any) {
        let swiftUIView = CountryListViewSwiftUI()
        let hostingController = UIHostingController(rootView: swiftUIView)
        self.navigationController?.pushViewController(hostingController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
