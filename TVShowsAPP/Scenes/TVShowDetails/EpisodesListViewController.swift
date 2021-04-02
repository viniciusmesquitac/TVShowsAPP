//
//  EpisodesListViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class EpisodesListViewController: UITableViewController {

    var didFinishLoadEpisodes: (() -> Void)?
    var episodes: [Episode]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.frame = CGRect(origin: .zero, size: self.tableView.contentSize)
                self.view.layoutIfNeeded()
            }
        }
    }

    var tvShowId = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        setupTableView()
        callApi()
    }

    func setupTableView() {
        tableView.isScrollEnabled = false
        tableView.isHidden = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.register(
            EpisodesTableViewCell.self,
            forCellReuseIdentifier: EpisodesTableViewCell.identifier)
    }

    func callApi() {
        let tvmaze = TVMazeAPI()
        tvmaze.episodes(idShow: tvShowId) { episodes in
            self.episodes = episodes?.filter { $0.season == 1 } ?? []
            self.didFinishLoadEpisodes?()
        }
    }
}

extension EpisodesListViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodesTableViewCell.identifier) as? EpisodesTableViewCell
        guard let episode = episodes?[indexPath.row] else { return UITableViewCell() }
        cell?.setupEpisode(episode: episode)
        return cell ?? UITableViewCell()
    }
}
