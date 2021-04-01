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
    let contentEpisodesView = ContentEpisodesView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentInformationView()
        setupContentEpisodesView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupContentInformationView() {
        addSubview(contentInformationView)
        contentInformationView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview()
        }
    }

    func setupContentEpisodesView() {
        addSubview(contentEpisodesView)
        contentEpisodesView.snp.makeConstraints { make in
            make.top.equalTo(contentInformationView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
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

    }
}
