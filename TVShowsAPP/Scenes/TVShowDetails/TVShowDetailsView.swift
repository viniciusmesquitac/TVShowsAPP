//
//  TVShowDetailsView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit
import SnapKit
import Nuke

class TVShowDetailsView: UIView {

    let tableView = UITableView(frame: .zero)

    let headerView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 300)))
        view.backgroundColor = .green
        return view
    }()

    let closeButton: UIButton = {
        let button = UIButton(type: .close)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        setupTableView()
    }

    func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        tableView.tableHeaderView = headerView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ContentInformationView: UIView {
    
    let tvShowTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Under The Done"
        return label
    }()
    
    let genresLabel: UILabel = {
        let label = UILabel()
        label.text = "Under The Done"
        return label
    }()
    
    let scheduleAtLabel: UILabel = {
        let label = UILabel()
        label.text = "Under The Done"
        return label
    }()

    let buttonFavorite: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let summaryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        return label
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        return label
    }()
    
}

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
