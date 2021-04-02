//
//  ContentInformationView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class ContentInformationView: UIView {

    let tvShowTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Under The Done"
        return label
    }()

    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating: 6.6"
        return label
    }()

    let genresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "Drama, Science-Fiction, Triller"
        return label
    }()

    let scheduleAtLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "22:00 every Thursday"
        return label
    }()

    let buttonFavorite: UIButton = {
        let button = UIButton()
        button.setTitle("Favorite", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()

    private let summaryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        return label
    }()

    let summaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Summary"
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
        addSubview(tvShowTitleLabel)
        addSubview(genresLabel)
        addSubview(ratingLabel)
        addSubview(scheduleAtLabel)
        addSubview(buttonFavorite)
        addSubview(summaryTitleLabel)
        addSubview(summaryLabel)
    }

    func setupConstraints() {
        tvShowTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(tvShowTitleLabel.snp.bottom).offset(12)
            make.trailing.equalToSuperview()
        }

        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(tvShowTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(tvShowTitleLabel)
            make.trailing.equalTo(ratingLabel.snp.leading).offset(-3)
        }

        scheduleAtLabel.snp.makeConstraints { make in
            make.top.equalTo(genresLabel.snp.bottom).offset(12)
            make.leading.equalTo(tvShowTitleLabel)
            make.trailing.equalToSuperview()
        }

        buttonFavorite.snp.makeConstraints { make in
            make.top.equalTo(scheduleAtLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }

        summaryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonFavorite.snp.bottom).offset(12)
            make.leading.equalTo(tvShowTitleLabel)
            make.trailing.equalToSuperview()
        }

        summaryLabel.snp.makeConstraints { make in
            make.top.equalTo(summaryTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(tvShowTitleLabel)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }

    }

}
