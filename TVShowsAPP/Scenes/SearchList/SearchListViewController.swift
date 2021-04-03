//
//  SearchListViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

class SearchListViewController: UIViewController {

    var searchResultsController: ResultsShowsListViewController?
    var searchController: UISearchController?
    var searchDelayer: Timer?
    var viewModel = SearchListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Search"
        setupSearchController()
        self.view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController

        viewModel.didFinishSearch = {
            guard let tvShows = self.viewModel.tvShows else { return }
            self.searchResultsController?.viewModel.tvShows = tvShows
        }
    }

    func setupSearchController() {
        searchResultsController = ResultsShowsListViewController(
            coordinator: ShowsListCoordinator(navigationController: navigationController)
        )
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController?.searchBar.delegate = self
        searchController?.isActive = true
        searchController?.searchBar.becomeFirstResponder()
    }
}

extension SearchListViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchDelayer?.invalidate()
        searchDelayer = nil
        if true {
            searchDelayer = Timer.scheduledTimer(
                timeInterval: 1.5, target: self,
                selector: #selector(self.doDelayedSearch),
                userInfo: searchText, repeats: false)
        }
    }

    @objc func doDelayedSearch(_ timer: Timer) {
        assert(timer == searchDelayer)
        guard let searchResult = searchDelayer?.userInfo as? String else { return }
        viewModel.search(with: searchResult)
        searchDelayer = nil
    }

}
