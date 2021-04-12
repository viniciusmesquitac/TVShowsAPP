//
//  ContentInformationView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class ContentInformationView: UIView {

    var isButtonFavorite = false

    let tvShowTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Under The Done"
        label.numberOfLines = 0
        label.font = Stylesheet.Font.boldOfSize32
        return label
    }()

    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating: 6.6"
        label.font = Stylesheet.Font.boldOfSize16
        label.textColor = Stylesheet.Color.secundaryTextColor
        label.textAlignment = .right
        return label
    }()

    let genresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Stylesheet.Font.boldOfSize16
        label.textColor = Stylesheet.Color.secundaryTextColor
        label.text = "Drama, Science-Fiction, Triller"
        return label
    }()

    let scheduleAtLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = Stylesheet.Font.boldOfSize16
        label.textColor = Stylesheet.Color.secundaryTextColor
        label.text = "22:00 every Thursday"
        return label
    }()

    let buttonFavorite: UIButton = {
        let button = UIButton()
        button.setTitle("Favorite", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.font = Stylesheet.Font.boldOfSize16
        button.setBackgroundColor(Stylesheet.Color.primaryColor, for: .normal)
        button.setBackgroundColor(UIColor.systemRed, for: .highlighted)
        return button
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
            make.width.greaterThanOrEqualTo(100)
        }

        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(tvShowTitleLabel.snp.bottom).offset(12)
            make.leading.equalTo(tvShowTitleLabel)
            make.trailing.equalTo(ratingLabel.snp.leading).offset(-32)
        }

        scheduleAtLabel.snp.makeConstraints { make in
            make.top.equalTo(genresLabel.snp.bottom).offset(12)
            make.leading.equalTo(tvShowTitleLabel)
            make.trailing.equalToSuperview()
        }

        buttonFavorite.snp.makeConstraints { make in
            make.top.equalTo(scheduleAtLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
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
