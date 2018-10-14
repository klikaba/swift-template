//
//  HomeViewController.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 7/1/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class CountriesViewController: AppViewController<CountriesViewModel>,
                               UITableViewDataSource,
                               UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "Country"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegation()
        viewModel.refreshCountries()
    }

    func setupDelegation() {
        viewModel.onRefreshCompleted = onRefreshCompleted
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath) as UITableViewCell
        guard let countries = viewModel.countries else { return cell }
        let country = countries[indexPath.row]
        cell.textLabel?.text = "\(country.name) \(country.id)"
        return cell
    }

    func onRefreshCompleted(_ error: ApiError?) {
        if error == nil {
            tableView.reloadData()
        }
    }
}
