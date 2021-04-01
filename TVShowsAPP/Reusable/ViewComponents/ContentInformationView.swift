//
//  ContentInformationView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class ContentInformationView: UIView {

    let tvShowTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Under The Done"
        return label
    }()

    let genresLabel: UILabel = {
        let label = UILabel()
        label.text = "Under The Done"
        return label
    }()

    let scheduleAtLabel: UILabel = {
        let label = UILabel()
        label.text = "Under The Done"
        return label
    }()

    let buttonFavorite: UIButton = {
        let button = UIButton()
        return button
    }()

    private let summaryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        return label
    }()

    let summaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        return label
    }()

}
