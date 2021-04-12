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

    let tableView = UITableView(frame: .zero, style: .plain)
    let backgroundImageView = UIImageView()
    let headerView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: Parameters.headerViewSize))
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupBackgroundImageView()
    }

    fileprivate func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        tableView.tableHeaderView = headerView
        tableView.allowsSelection = false
        tableView.register(
            TVShowDetailsTableViewCell.self,
            forCellReuseIdentifier: TVShowDetailsTableViewCell.identifier)
    }

    fileprivate func setupBackgroundImageView() {
        headerView.addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Input setup
extension TVShowDetailsView {
    public func setupImagePoster(url: URL) {
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder"),
            transition: .fadeIn(duration: 0.33)
        )
        DispatchQueue.main.async {
            Nuke.loadImage(with: url, options: options, into: self.backgroundImageView) { _ in
                self.headerView.backgroundColor = self.backgroundImageView.image?.averageColor
            }
        }
    }
}

extension TVShowDetailsView {

    enum Parameters {
        static let headerViewSize = CGSize(width: UIScreen.main.bounds.width, height: 300)
        static let imageSize = CGSize(width: 363, height: 216)
    }

}
