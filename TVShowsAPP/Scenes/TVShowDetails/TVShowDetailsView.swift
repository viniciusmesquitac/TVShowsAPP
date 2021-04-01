//
//  TVShowDetailsView.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit
import SnapKit
import Nuke

class TVShowDetailsView: UIView {

    let tableView = UITableView(frame: .zero)

    let backgroundImageView = UIImageView()

    let headerView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 300)))
        view.backgroundColor = .lightGray
        return view
    }()

    let closeButton: UIButton = {
        let button = UIButton(type: .close)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        setupTableView()
        setupBackgroundImageView()
    }

    func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        tableView.tableHeaderView = headerView
    }

    func setupBackgroundImageView() {
        headerView.addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupImage(url: URL?) {
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder"),
            transition: .fadeIn(duration: 0.33)
        )
        guard let url = url else { return }
        Nuke.loadImage(with: url, options: options, into: backgroundImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
