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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.mainView.tableView.dataSource = self
        self.mainView.tableView.delegate = self

        coordinator = ShowsListCoordinator(navigationController: navigationController)
    }
}

extension FavoriteListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // coordinator?.details(tvShow: <#T##TVShow#>)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FavoriteListTableViewCell.identifier) as? FavoriteListTableViewCell
        else { return UITableViewCell() }
        cell.setupFavoriteTvShow()
        return cell
    }

}
