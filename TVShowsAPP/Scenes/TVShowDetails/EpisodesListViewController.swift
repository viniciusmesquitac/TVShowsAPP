//
//  EpisodesListViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import UIKit

class EpisodesListViewController: UIViewController {

    var mainView: ContentEpisodesView? {
        didSet {
            mainView?.tableView.delegate = self
            mainView?.tableView.dataSource = self
            mainView?.tableView.reloadData()
        }
    }

    var episodes: [Episode]? = [] {
        didSet {
            mainView?.tableView.reloadData()
        }
    }

}

extension EpisodesListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodesTableViewCell.identifier) as? EpisodesTableViewCell
        guard let episode = episodes?[indexPath.row] else { return UITableViewCell() }
        cell?.setupEpisode(episode: episode)
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
}
