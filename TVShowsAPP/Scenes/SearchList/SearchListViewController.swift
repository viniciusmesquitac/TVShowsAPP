//
//  SearchListViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

class SearchListViewController: UITableViewController {

    var searchResultsController: ResultsShowsListViewController?
    var searchController: UISearchController?
    var searchDelayer: Timer?
    var viewModel = SearchListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupNavigation()

        viewModel.didFinishSearch = {
            guard let tvShows = self.viewModel.tvShows else { return }
            self.searchResultsController?.viewModel.tvShows = tvShows
            self.searchResultsController?.mainView.indicator.stopAnimating()
        }
    }

    func setupNavigation() {
        self.navigationController?.title = "Search"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

    func setupSearchController() {
        searchController?.isActive = true
        searchController?.searchBar.tintColor = Stylesheet.Color.primaryColor
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
            self.searchResultsController?.mainView.indicator.startAnimating()
            searchDelayer = Timer.scheduledTimer(
                timeInterval: 0.5, target: self,
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

extension SearchListViewController {

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Most recent added"
    }

}
