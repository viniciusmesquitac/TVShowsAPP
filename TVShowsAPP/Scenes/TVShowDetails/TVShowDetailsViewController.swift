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
    var episodesController = EpisodesListViewController()

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = nil
        self.navigationItem.largeTitleDisplayMode = .never
        let url = URL(string: viewModel?.backgroundImage ?? "")

        episodesController.didFinishLoadEpisodes = {
            DispatchQueue.main.async {
                self.episodesController.tableView.isHidden = false
                self.mainView.tableView.tableFooterView = self.episodesController.view
                self.mainView.tableView.reloadData()
            }
        }
        episodesController.tvShowId = viewModel?.tvShow?.id ?? 1
        add(episodesController)
        self.mainView.tableView.dataSource = self
        self.mainView.setupImage(url: url)
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

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}
