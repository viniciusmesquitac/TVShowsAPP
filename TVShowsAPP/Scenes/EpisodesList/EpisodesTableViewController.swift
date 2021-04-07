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

    var episodes: [Episode]? = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                 self.tableView.frame = CGRect(origin: .zero, size: self.tableView.contentSize)
                 self.tableView.layoutIfNeeded()
            }
        }
    }

    var tvShowId = 0
    var seasons: [Season]?
    var currentSeason = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        setupTableView()
        populateEpisodeList()
    }

    func setupTableView() {
        tableView.isScrollEnabled = false
        tableView.isHidden = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 71 + 16
        tableView.register(
            EpisodesTableViewCell.self,
            forCellReuseIdentifier: EpisodesTableViewCell.identifier)
    }

    func populateEpisodeList() {
        TVMazeAPI().seasons(idShow: tvShowId) { seasons in
            self.seasons = seasons
            guard let season = seasons?[self.currentSeason - 1] else { return }
            self.getEpisodeList(seasonId: season.id)
        }
    }

    func getEpisodeList(seasonId: Int) {
        TVMazeAPI().episodes(seasonId: seasonId) { episodes in
            self.episodes = episodes
            self.didFinishLoadEpisodes?()
        }
    }

    @objc func didTapSeasonButton() {
        coordinator?.filterEpisodeSeason(delegate: self, seasons: self.seasons, current: self.currentSeason)
    }
}

extension EpisodesTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodesTableViewCell.identifier) as? EpisodesTableViewCell
        cell?.selectionStyle = .none
        guard let isIndexValid = episodes?.indices.contains(indexPath.row) else { return UITableViewCell() }
        if isIndexValid {
            guard let episode = episodes?[indexPath.row] else { return UITableViewCell() }
            cell?.setupEpisode(episode: episode)
        }
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.episodeDetails(episode: self.episodes?[indexPath.row])
    }
}

extension EpisodesTableViewController: SeasonSelectionDelegate {
    func didSelectSeason(season: Season?) {
        guard let season = season else { return }
        self.currentSeason = season.number ?? 0
        headerView.seasonButton.setTitle("Season \(currentSeason)", for: .normal)
        self.getEpisodeList(seasonId: season.id)
        self.tableView.reloadSections(IndexSet.init(integer: 0), with: .automatic)
    }
}
