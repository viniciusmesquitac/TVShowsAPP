//
//  SeasonHeaderView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 04/04/21.
//

import UIKit
import SnapKit

class SeasonHeaderView: UITableViewHeaderFooterView {

    let seasonButton = UIButton()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupSeasonButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSeasonButton() {
        addSubview(seasonButton)
        seasonButton.setTitle("Season 1", for: .normal)
        seasonButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        seasonButton.setImage(Stylesheet.Icons.bottomArrow, for: .normal)
        seasonButton.semanticContentAttribute = .forceRightToLeft
        seasonButton.backgroundColor = Stylesheet.Color.primaryColor
        seasonButton.layer.cornerRadius = 8
        seasonButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        seasonButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.width.equalTo(128)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}
