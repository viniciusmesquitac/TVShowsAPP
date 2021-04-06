//
//  EpisodeDetailsView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 06/04/21.
//

import UIKit
import SnapKit
import Nuke

class EpisodeDetailsView: UIView {

    let tableView = UITableView(frame: .zero, style: .plain)
    let backgroundImageView = UIImageView()
    let headerView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: Parameters.headerViewSize))
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupBackgroundImageView()
    }

    fileprivate func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        tableView.tableHeaderView = headerView
        tableView.allowsSelection = false
        tableView.register(
            EpisodeDetailsTableViewCell.self,
            forCellReuseIdentifier: EpisodeDetailsTableViewCell.identifier)
    }

    fileprivate func setupBackgroundImageView() {
        headerView.addSubview(backgroundImageView)
        backgroundImageView.image = Stylesheet.Images.placeholderEpisode
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EpisodeDetailsView {

    enum Parameters {
        static let headerViewSize = CGSize(width: UIScreen.main.bounds.width, height: 216)
        static let imageSize = CGSize(width: 363, height: 216)
    }

}
