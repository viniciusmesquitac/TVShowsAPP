//
//  EpisodesCoordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 04/04/21.
//

import UIKit

final class TVShowDetailsCoordinator: Coordinator {

    var navigationController: UINavigationController!
    var tvShow: TVShow

    init(navigationController: UINavigationController?, tvShow: TVShow) {
        guard let navigation = navigationController else { fatalError() }
        self.navigationController = navigation
        self.tvShow = tvShow
        self.navigationController.navigationBar.tintColor = Stylesheet.Color.primaryColor
    }

    func start() {
        let tvShowDetailsViewController = TVShowDetailsViewController()
        tvShowDetailsViewController.viewModel = TVShowDetailsViewModel(tvShow: tvShow)
        tvShowDetailsViewController.episodesTableViewController.coordinator = self
        navigationController.pushViewController(tvShowDetailsViewController, animated: true)
    }

    func filterEpisodeSeason(delegate: SeasonSelectionDelegate, seasons: [Season]?, current: Int) {
        let seasonFilterTableViewController = SeasonFilterTableViewController()
        seasonFilterTableViewController.modalTransitionStyle = .crossDissolve
        seasonFilterTableViewController.modalPresentationStyle = .overFullScreen
        seasonFilterTableViewController.delegate = delegate
        seasonFilterTableViewController.seasons = seasons
        seasonFilterTableViewController.currentSeason = current
        navigationController.present(seasonFilterTableViewController, animated: true)
    }

}
