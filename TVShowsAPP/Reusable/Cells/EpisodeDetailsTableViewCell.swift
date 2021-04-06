//
//  EpisodeDetailsTableViewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 06/04/21.
//

import UIKit

class EpisodeDetailsTableViewCell: UITableViewCell {
    static let identifier = String(describing: type(of: self))
    let contentInformationView = ContentEpisodeInformationView()

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

    func setup(with episode: Episode?) {
        guard let episode = episode else { return }
        contentInformationView.episodeTitleLabel.text = episode.name
        contentInformationView.seasonNumber.text = "Season \(episode.season ?? 1)"
        contentInformationView.episodeNumber.text = "Episode \(episode.number ?? 1)"
        contentInformationView.summaryLabel.attributedText = episode.summary?.removeAllOcurrences.attributedText(
            boldString: episode.name ?? "", font: .systemFont(ofSize: 16))
    }
}
