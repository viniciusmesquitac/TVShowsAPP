//
//  ContentEpisodeInformationVIew.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 06/04/21.
//

import UIKit

class ContentEpisodeInformationView: UIView {

    let episodeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Under The Done"
        label.numberOfLines = 0
        label.font = Stylesheet.Font.boldOfSize32
        return label
    }()

    let seasonNumber: UILabel = {
        let label = UILabel()
        label.text = "Rating: 6.6"
        label.font = Stylesheet.Font.boldOfSize16
        label.textColor = Stylesheet.Color.secundaryTextColor
        label.textAlignment = .right
        return label
    }()

    let episodeNumber: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Stylesheet.Font.boldOfSize16
        label.textColor = Stylesheet.Color.secundaryTextColor
        label.text = "Drama"
        return label
    }()

    private let summaryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Stylesheet.Font.boldOfSize16
        label.text = "Summary"
        return label
    }()

    let summaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Summary dsad sad as das das dsad asda dsa das dsadsa das  sa"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        addSubview(episodeTitleLabel)
        addSubview(seasonNumber)
        addSubview(episodeNumber)
        addSubview(summaryTitleLabel)
        addSubview(summaryLabel)
    }

    func setupConstraints() {
        episodeTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        seasonNumber.snp.makeConstraints { make in
            make.top.equalTo(episodeTitleLabel.snp.bottom).offset(12)
            make.trailing.equalToSuperview()
            make.width.greaterThanOrEqualTo(100)
        }

        episodeNumber.snp.makeConstraints { make in
            make.top.equalTo(episodeTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(episodeTitleLabel)
            make.trailing.equalTo(seasonNumber.snp.leading).offset(-32)
        }

        summaryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(episodeNumber.snp.bottom).offset(12)
            make.leading.equalTo(episodeTitleLabel)
            make.trailing.equalToSuperview()
        }

        summaryLabel.snp.makeConstraints { make in
            make.top.equalTo(summaryTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(episodeTitleLabel)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }

    }

}
