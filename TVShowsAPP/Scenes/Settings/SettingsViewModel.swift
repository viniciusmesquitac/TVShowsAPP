//
//  SettingsViewModel.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import UIKit

class SettingsViewModel {
    var sections = [SettingsSection]()
    var coordinator: SettingsListCoordinator?

    var numberOfSections: Int {
        sections.count
    }

    init(coordinator: SettingsListCoordinator) {
        self.coordinator = coordinator
        createSections()
    }

    private func createSections() {
        let items = [
            SettingsItem(cell: createCell(title: "PIN CODE")) { self.coordinator?.pinCodeConfig() },
            SettingsItem(cell: createCell(title: "Face ID")) { self.coordinator?.pinCodeConfig() }
        ]
        sections = [
            SettingsSection(title: "Security", items: items)
        ]
    }

    private func createCell(title: String) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = title
        cell.accessoryType = .disclosureIndicator
        cell.accessoryView?.backgroundColor = Stylesheet.Color.primaryColor
        cell.accessoryView?.tintColor = Stylesheet.Color.primaryColor
        cell.tintColor = Stylesheet.Color.primaryColor
        return cell
    }
}
