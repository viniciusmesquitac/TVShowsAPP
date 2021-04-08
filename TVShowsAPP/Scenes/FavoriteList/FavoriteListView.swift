//
//  FavoriteListView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import UIKit

class FavoriteListView: UIView {

    let tableView = UITableView(frame: .zero, style: .plain)

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Stylesheet.Color.backgroundColor
        setupTableView()
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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
