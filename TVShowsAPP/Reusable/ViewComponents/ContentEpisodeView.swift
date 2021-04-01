//
//  ContentEpisodeView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class ContentEpisodesView: UIView {

    private let espisodesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Episodes"
        return label
    }()

    let episodesTableView = UITableView(frame: .zero)

}

class EpisodesTableViewCell: UITableViewCell {

    let episodeImageView = UIImageView()
    let titleEpisodeLabel = UILabel()
    let timeEpisodeLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(episodeImageView)
        addSubview(titleEpisodeLabel)
        addSubview(timeEpisodeLabel)
    }
}
