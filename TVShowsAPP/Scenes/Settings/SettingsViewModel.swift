//
//  SettingsViewModel.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import UIKit

class SettingsViewModel: StaticViewModel {
    var sections = [SettingsSection]()
    var coordinator: SettingsListCoordinator?

    var securityBiometricTitle: String {
        BiometricAuthentication().type == .faceID ? "face ID": "Touch ID"
    }

    init(coordinator: SettingsListCoordinator) {
        self.coordinator = coordinator
        createSections()
    }

    private func createSections() {
        let items = [
            SettingsItem(cell: createCell(title: "Passcode")) { self.coordinator?.pinCodeConfig() },
            SettingsItem(cell: createSwitchCell(title: securityBiometricTitle), action: nil)
        ]
        sections = [
            SettingsSection(title: "Security", items: items)
        ]
    }

    @objc func didTapSwitchButton(_ sender: UISwitch) {
        UserDefaults.standard.setValue(sender.isOn, forKey: UserDefaultsEnum.isBiometricOn.rawValue)
    }

    internal func createCell(title: String) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = title
        cell.accessoryType = .disclosureIndicator
        cell.accessoryView?.backgroundColor = Stylesheet.Color.primaryColor
        cell.accessoryView?.tintColor = Stylesheet.Color.primaryColor
        cell.tintColor = Stylesheet.Color.primaryColor
        return cell
    }

    internal func createSwitchCell(title: String) -> SwitchButtonTableViewCell {
        let cell = SwitchButtonTableViewCell()
        cell.switchButton.isOn = UserDefaults.standard.bool(forKey: UserDefaultsEnum.isBiometricOn.rawValue)
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
