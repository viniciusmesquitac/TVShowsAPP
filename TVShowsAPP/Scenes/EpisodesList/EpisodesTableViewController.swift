//
//  EpisodesListViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class EpisodesTableViewController: UITableViewController {

    let footerView = LoadingIndicatorView()
    let headerView = SeasonHeaderView()

    var didFinishLoadEpisodes: (() -> Void)?
    var coordinator: TVShowDetailsCoordinator?

    var episodes: [Episode]?
    var episodesFiltered: [Episode]? = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                 self.tableView.frame = CGRect(origin: .zero, size: self.tableView.contentSize)
                 self.tableView.layoutIfNeeded()
            }
        }
    }
    var tvShowId = 0
    var seasonNumber = 1 {
        didSet {
            self.episodesFiltered = episodes?.filter { $0.season == self.seasonNumber } ?? []
            self.didFinishLoadEpisodes?()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        setupTableView()
        getEpisodeList()
    }

    func setupTableView() {
        tableView.isScrollEnabled = false
        tableView.isHidden = true
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 71 + 16
        tableView.register(
            EpisodesTableViewCell.self,
            forCellReuseIdentifier: EpisodesTableViewCell.identifier)
    }

    func getEpisodeList() {
        let tvmaze = TVMazeAPI()
        tvmaze.episodes(idShow: tvShowId) { episodes in
            self.episodes = episodes
            self.seasonNumber = 1
        }
    }

    @objc func didTapSeasonButton() {
        print("change season")
        coordinator?.filterEpisodeSeason(delegate: self)
    }

    func setupFooterViewIfNeeded() {
        DispatchQueue.main.async {
            guard let episodes = self.episodes else { return }
            if episodes.isEmpty {
                self.footerView.messageLabel.text = "Any episode available for this season"
                self.footerView.messageLabel.isHidden = false
            }
        }
    }
}

extension EpisodesTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodesFiltered?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodesTableViewCell.identifier) as? EpisodesTableViewCell
        guard let episode = episodesFiltered?[indexPath.row] else { return UITableViewCell() }
        cell?.setupEpisode(episode: episode)
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footerView.startAnimating()
        return footerView
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.contentView.backgroundColor = .systemBackground
        headerView.seasonButton.addTarget(self, action: #selector(didTapSeasonButton), for: .touchUpInside)
        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Episodes"
    }
}

extension EpisodesTableViewController: SeasonSelectionDelegate {
    func didSelectSeason(season: Int) {
        self.seasonNumber = season
        headerView.seasonButton.setTitle("Season \(season)", for: .normal)
        self.tableView.reloadSections(IndexSet.init(integer: 0), with: .automatic)
    }
}
