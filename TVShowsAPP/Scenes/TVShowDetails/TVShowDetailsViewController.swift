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
    let episodesTableViewController = EpisodesTableViewController(style: .plain)

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = nil
        self.navigationItem.largeTitleDisplayMode = .never
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.delegate = self
        setupEpisodesTableViewController()
        setupPosterImage()
    }

    func setupPosterImage() {
        guard let posterUrl = viewModel?.posterImage else { return }
        guard let url = URL(string: posterUrl) else { return }
        self.mainView.setupImagePoster(url: url)
    }

    func setupEpisodesTableViewController() {
        episodesTableViewController.didFinishLoadEpisodes = {
            DispatchQueue.main.async {
                self.episodesTableViewController.tableView.isHidden = false
                self.mainView.tableView.tableFooterView = self.episodesTableViewController.view
                self.mainView.tableView.reloadData()
                self.episodesTableViewController.footerView.stopAnimating()
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
        cell?.contentView.isUserInteractionEnabled = false
        cell?.contentInformationView.buttonFavorite.addTarget(
            viewModel, action: #selector(viewModel?.didTapFavoriteButton), for: .touchUpInside)
        return cell ?? UITableViewCell()
    }
}
