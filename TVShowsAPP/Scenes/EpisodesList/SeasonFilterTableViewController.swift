//
//  EpisodeDetailsVIewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 04/04/21.
//

import UIKit
protocol SeasonSelectionDelegate: class {
    func didSelectSeason(season: Season?)
}

class SeasonFilterTableViewController: UITableViewController {

    var seasons: [Season]?
    var currentSeason = 1
    weak var delegate: SeasonSelectionDelegate?

    lazy var blur: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .systemThickMaterialDark)
        let blurView = UIVisualEffectView(effect: effect)
        blurView.alpha = 1.0
        blurView.frame = self.view.bounds
        return blurView
    }()

    lazy var closeButtonView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: Parameters.closeButtonViewSize))
        view.backgroundColor = .black
        view.alpha = 0.8
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .clear
        self.tableView.backgroundView = blur
        self.tableView.separatorStyle = .none
        self.setupContentSeasonsIfNeeded()
        self.setupCloseButtonView()
        let indexPath = IndexPath(row: currentSeason - 1, section: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }

    func setupContentSeasonsIfNeeded() {
        if seasons?.count ?? 0 <= 7 {
            self.tableView.contentInset = UIEdgeInsets(
                top: UIScreen.main.bounds.height/4, left: 0,
                bottom: -UIScreen.main.bounds.height/3.5,
                right: 0)
        } else if seasons?.count ?? 0 <= 12 {
            self.tableView.contentInset = UIEdgeInsets(
                top: 32, left: 0,
                bottom: -UIScreen.main.bounds.height/3.5,
                right: 0)
        } else {
            self.tableView.contentInset = UIEdgeInsets(
                top: 32, left: 0, bottom: UIScreen.main.bounds.height/2, right: 0)
        }
    }

    func setupCloseButtonView() {
        guard let nav = navigationController else { return }
        nav.view.addSubview(closeButtonView)
        closeButtonView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

}

extension SeasonFilterTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.textLabel?.textAlignment = .center
        cell.selectedBackgroundView = UIView()
        let seasonNumber = seasons?[indexPath.row].number ?? 0
        cell.textLabel?.text = String("Season \(seasonNumber)")
        cell.textLabel?.textColor = .white
        if indexPath.item == currentSeason - 1 {
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectSeason(season: seasons?[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}

extension SeasonFilterTableViewController {

    private enum Parameters {
        static let closeButtonViewSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
    }
}
