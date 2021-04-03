//
//  SettingsViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    var viewModel: SettingsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel = SettingsViewModel(delegate: self)
    }
}

extension SettingsTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections[section].cells.count ?? 0
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.sections[section].title
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = viewModel?.sections[indexPath.section].cells[indexPath.row] else {
            return UITableViewCell()
        }
        return cell
    }
}

extension SettingsTableViewController: SettingsDelegate {

}
