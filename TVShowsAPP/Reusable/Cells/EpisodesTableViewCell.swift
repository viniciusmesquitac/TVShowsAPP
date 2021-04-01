//
//  EpisodesTableViewCell.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit
import SnapKit

class EpisodesTableViewCell: UITableViewCell {

    static let identifier = String(describing: type(of: self))

    let episodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "1. Pilot"
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
        episodeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}
