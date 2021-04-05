//
//  TVShowListTableViewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 05/04/21.
//

import UIKit
import Nuke

class TVShowsListTableViewCell: UITableViewCell {
    static let identifier = String(describing: type(of: self))
    let posterImageView = UIImageView()
    let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImageView()
        setupTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupImageView() {
        addSubview(posterImageView)
        posterImageView.image = Stylesheet.Images.placeholderPoster
        posterImageView.layer.cornerRadius = 8

        posterImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        posterImageView.backgroundColor = .random()
    }

    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Under the done"
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
    }

    func setupImage(url: URL?) {
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder"),
            transition: .fadeIn(duration: 0.33)
        )
        guard let url = url else {
            self.posterImageView.image = Stylesheet.Images.placeholderPosterNotAvailable
            return
        }
        let request = ImageRequest(url: url, processors: [
            ImageProcessors.RoundedCorners(radius: 8)
        ])
        Nuke.loadImage(with: request, options: options, into: posterImageView)
    }
}
