//
//  EpisodeDetailsViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 06/04/21.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {

    let mainView = EpisodeDetailsView()
    var episode: Episode?

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
    }
}

extension EpisodeDetailsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodeDetailsTableViewCell.identifier) as? EpisodeDetailsTableViewCell
        cell?.setup(with: episode)
        return cell ?? UITableViewCell()
    }
}
