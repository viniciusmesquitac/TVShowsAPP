//
//  SettingsSection.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import UIKit

struct SettingsSection {
    var title: String
    var items: [SettingsItem]
}

struct SettingsItem {
    let cell: UITableViewCell
    let action: (() -> Void)?
}
