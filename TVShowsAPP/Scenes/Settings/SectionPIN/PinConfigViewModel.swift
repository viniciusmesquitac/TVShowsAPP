//
//  PinConfigurationDetailsViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 09/04/21.
//

import UIKit

class PinConfigViewModel: StaticViewModel {
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
            SettingsItem(cell: createSwitchCell(title: "Active Passcode"), action: nil)
        ]
        sections = [
            SettingsSection(title: "Security", items: items)
        ]
    }

    @objc func didTapSwitchButton(_ sender: UISwitch) {
        if sender.isOn {
            coordinator?.pinCodeSetConfig()
        } else {
            UserDefaults.standard.setValue(false, forKey: UserDefaultsEnum.isPinAuthOn.rawValue)
        }
    }

    internal func createSwitchCell(title: String) -> SwitchButtonTableViewCell {
        let cell = SwitchButtonTableViewCell()
        cell.switchButton.isOn = UserDefaults.standard.bool(forKey: UserDefaultsEnum.isPinAuthOn.rawValue)
        cell.switchButton.addTarget(self, action: #selector(didTapSwitchButton), for: .touchUpInside)
        cell.contentView.isUserInteractionEnabled = false
        cell.selectionStyle = .none
        cell.textLabel?.text = title
        cell.accessoryView?.backgroundColor = Stylesheet.Color.primaryColor
        cell.accessoryView?.tintColor = Stylesheet.Color.primaryColor
        cell.tintColor = Stylesheet.Color.primaryColor
        return cell
    }
}
