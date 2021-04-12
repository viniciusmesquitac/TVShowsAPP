//
//  FavoriteListView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import UIKit

class FavoriteListView: UIView {

    let tableView = UITableView(frame: .zero, style: .plain)
    let labelEmptyState: UILabel = {
        let label = UILabel()
        label.text = "Please add some TV Show to your favorite list"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Stylesheet.Color.backgroundColor
        setupTableView()
        setupEmptyStateLabel()
    }

    fileprivate func setupTableView() {
        addSubview(tableView)
        tableView.rowHeight = 216
        tableView.separatorStyle = .none
        tableView.backgroundView = UIView()
        tableView.backgroundColor = Stylesheet.Color.backgroundColor
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.register(
            FavoriteListTableViewCell.self,
            forCellReuseIdentifier: FavoriteListTableViewCell.identifier)
    }

    fileprivate func setupEmptyStateLabel() {
        addSubview(labelEmptyState)
        labelEmptyState.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupEmptyStateIfNeeded(_ isEmpty: Bool) {
        labelEmptyState.isHidden = !isEmpty
        tableView.isScrollEnabled = !isEmpty
    }
}
