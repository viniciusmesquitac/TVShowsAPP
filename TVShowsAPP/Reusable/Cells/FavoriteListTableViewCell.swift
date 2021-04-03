//
//  FavoriteListTableViewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import UIKit
import Nuke

class FavoriteListTableViewCell: UITableViewCell {

    static let identifier = String(describing: type(of: self))

    let favoriteTvShowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = Stylesheet.Images.placeholderEpisode
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .brown
        return imageView
    }()

    let overlayShadowView: UIView = {
        let shadow = UIView()
        shadow.backgroundColor = .black
        shadow.clipsToBounds = true
        shadow.layer.cornerRadius = 8
        shadow.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        shadow.alpha = 0.5
        return shadow
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "1. Pilot"
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        addSubview(favoriteTvShowImageView)
        favoriteTvShowImageView.addSubview(overlayShadowView)
        favoriteTvShowImageView.addSubview(titleLabel)
    }

    func setupConstraints() {
        favoriteTvShowImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }

        overlayShadowView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(55)
        }

        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(overlayShadowView)
            make.leading.equalToSuperview().offset(16)
        }
    }
}

extension FavoriteListTableViewCell {

    func setup(_ tvshow: TVShowViewModel) {
        self.titleLabel.text = tvshow.name
    }
}