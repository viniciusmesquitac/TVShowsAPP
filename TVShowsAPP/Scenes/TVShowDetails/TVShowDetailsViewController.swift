//
//  TVShowDetailsViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

class TVShowDetailsViewController: UIViewController {

    let mainView = TVShowDetailsView()
    var viewModel: TVShowDetailsViewModel?
    let episodesTableViewController = EpisodesTableViewController()

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = nil
        self.navigationItem.largeTitleDisplayMode = .never
        let url = URL(string: viewModel?.backgroundImage ?? "")
        self.mainView.tableView.dataSource = self
        self.mainView.setupImage(url: url)
        setupEpisodesTableViewController()
    }

    func setupEpisodesTableViewController() {
        episodesTableViewController.didFinishLoadEpisodes = {
            DispatchQueue.main.async {
                self.episodesTableViewController.tableView.isHidden = false
                self.mainView.tableView.tableFooterView = self.episodesTableViewController.view
                self.mainView.tableView.reloadData()
            }
        }
        episodesTableViewController.tvShowId = viewModel?.tvShow?.id ?? 1
        add(episodesTableViewController)
    }
}

extension TVShowDetailsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TVShowDetailsTableViewCell.identifier) as? TVShowDetailsTableViewCell
        cell?.setup(with: viewModel)
        return cell ?? UITableViewCell()
    }
}
