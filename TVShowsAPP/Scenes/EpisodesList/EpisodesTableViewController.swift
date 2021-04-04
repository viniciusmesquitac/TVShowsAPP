//
//  EpisodesListViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class EpisodesTableViewController: UITableViewController {

    var didFinishLoadEpisodes: (() -> Void)?
    var episodes: [Episode]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.frame = CGRect(origin: .zero, size: self.tableView.contentSize)
                self.tableView.layoutIfNeeded()
            }
        }
    }

    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()

    var tvShowId = 0
    var seasonNumber = 1 {
        didSet {
            self.getEpisodeList()
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
        tableView.estimatedRowHeight = 100
        tableView.register(
            EpisodesTableViewCell.self,
            forCellReuseIdentifier: EpisodesTableViewCell.identifier)
    }

    func getEpisodeList() {
        let tvmaze = TVMazeAPI()
        tvmaze.episodes(idShow: tvShowId) { episodes in
            self.episodes = episodes?.filter { $0.season == self.seasonNumber } ?? []
            self.didFinishLoadEpisodes?()
        }
    }
}

extension EpisodesTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodesTableViewCell.identifier) as? EpisodesTableViewCell
        guard let episode = episodes?[indexPath.row] else { return UITableViewCell() }
        cell?.setupEpisode(episode: episode)
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        indicator.startAnimating()
        return indicator
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.contentView.backgroundColor = .systemBackground
        return headerView
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Episodes"
    }
}
