//
//  ContentEpisodesView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class ContentEpisodesView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Episodes"
        return label
    }()

    let tableView = EpisodesTableView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 124.5
        tableView.register(
            EpisodesTableViewCell.self,
            forCellReuseIdentifier: EpisodesTableViewCell.identifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
    }

    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

class EpisodesTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }

    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}
