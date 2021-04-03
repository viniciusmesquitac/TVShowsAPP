//
//  SettingsViewModel.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import UIKit

protocol SettingsDelegate: class {

}

enum SecurityCells: String, CaseIterable {
    case faceId = "PIN Code"
    case teste = "Face ID"
}

enum GeneralCells: String, CaseIterable {
    case theme = "Theme"
}

class SettingsViewModel {
    var sections = [SettingsSection]()
    weak var delegate: SettingsDelegate?

    var numberOfSections: Int {
        sections.count
    }

    init(delegate: SettingsDelegate) {
        self.delegate = delegate
        createSections()
    }

    private func createSections() {
        let securityCells = SecurityCells.allCases.map { createCell(title: $0.rawValue) }
        let generalCells = GeneralCells.allCases.map { createCell(title: $0.rawValue) }
        sections = [
            SettingsSection(title: "Security", cells: securityCells),
            SettingsSection(title: "General", cells: generalCells)
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
