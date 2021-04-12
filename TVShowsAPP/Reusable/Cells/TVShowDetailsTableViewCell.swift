//
//  TVShowDetailsTableViewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class TVShowDetailsTableViewCell: UITableViewCell {
    static let identifier = String(describing: type(of: self))
    let contentInformationView = ContentInformationView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentInformationView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupContentInformationView() {
        addSubview(contentInformationView)
        contentInformationView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func setup(with tvShowViewModel: TVShowDetailsViewModel?) {
        guard let tvShow = tvShowViewModel else { return }
        contentInformationView.tvShowTitleLabel.text = tvShow.title
        contentInformationView.genresLabel.text = tvShow.genres
        contentInformationView.scheduleAtLabel.text = tvShow.scheduleAt
        contentInformationView.summaryLabel.attributedText = tvShow.summary
        contentInformationView.ratingLabel.text = tvShow.rating
        updateFavoriteButtonState(tvShowViewModel?.isFavorite ?? false)

        tvShowViewModel?.handleUpdateFavoriteButton = {
            self.updateFavoriteButtonState(tvShowViewModel?.isFavorite ?? false)
        }
    }

    func updateFavoriteButtonState(_ isFavorite: Bool) {
        self.contentInformationView.isButtonFavorite = isFavorite
        if isFavorite {
            self.contentInformationView.buttonFavorite.setTitle("Unfavorite", for: .normal)
        } else {
            self.contentInformationView.buttonFavorite.setTitle("Favorite", for: .normal)
        }
    }
}
