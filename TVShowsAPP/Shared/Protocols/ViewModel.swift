//
//  ViewModel.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 09/04/21.
//

import UIKit

protocol ViewModel { }

protocol StaticViewModel: ViewModel {
    var sections: [SettingsSection] { get set }
    var coordinator: SettingsListCoordinator? { get set }
}
