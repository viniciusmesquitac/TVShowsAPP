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
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EpisodesListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodesTableViewCell.identifier) as? EpisodesTableViewCell
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
}
