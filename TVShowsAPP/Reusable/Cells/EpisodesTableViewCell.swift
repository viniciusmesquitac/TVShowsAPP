//
//  EpisodesTableViewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit
import SnapKit
import Nuke

class EpisodesTableViewCell: UITableViewCell {

    static let identifier = String(describing: type(of: self))

    let episodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "1. Pilot"
        label.numberOfLines = 3
        return label
    }()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "1 hour"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierachy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierachy() {
        addSubview(episodeImageView)
        addSubview(titleLabel)
        addSubview(timeLabel)
    }

    func setupConstraints() {
        episodeImageView.contentMode = .scaleAspectFit
        episodeImageView.image = UIImage(named: "placeholder_episode")

        episodeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-8)
        }

        titleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(episodeImageView).offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(155)
        }
    }

    func setupEpisode(episode: Episode) {
        titleLabel.text = episode.name
        guard let url = URL(string: episode.image?.medium ?? "") else {
            episodeImageView.image = Stylesheet.Images.placeholderEpisodeNotAvailable
            return
        }

        let options = ImageLoadingOptions(
            placeholder: Stylesheet.Images.placeholderEpisode,
            transition: .fadeIn(duration: 0.33)
        )

        let request = ImageRequest(url: url, processors: [
            ImageProcessors.Resize(size: CGSize(width: 125, height: 71)),
            ImageProcessors.RoundedCorners(radius: 8)
        ])
        Nuke.loadImage(with: request, options: options, into: episodeImageView)
    }
}
