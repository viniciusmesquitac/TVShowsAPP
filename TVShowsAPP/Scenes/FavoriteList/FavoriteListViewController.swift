//
//  FavoriteListViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import UIKit

class FavoriteListViewController: UIViewController {

    var mainView = FavoriteListView()
    var coordinator: ShowsListCoordinator?
    let viewModel = FavoriteListViewModel()

    override func loadView() {
        self.view = mainView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getAllFavorites()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.delegate = self
        viewModel.handleUpdate = {
            self.mainView.tableView.reloadData()
            self.mainView.setupEmptyStateIfNeeded(self.viewModel.favorites.isEmpty)
        }
        coordinator = ShowsListCoordinator(navigationController: navigationController)
    }
}

extension FavoriteListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.details(tvShow: viewModel.favorites[indexPath.row].parseTvShow())
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FavoriteListTableViewCell.identifier) as? FavoriteListTableViewCell
        else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setup(viewModel.favorites[indexPath.row])
        return cell
    }

}
