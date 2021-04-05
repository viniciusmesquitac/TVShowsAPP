//
//  EpisodeDetailsVIewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 04/04/21.
//

import UIKit
protocol SeasonSelectionDelegate: class {
    func didSelectSeason(season: Int)
}

class SeasonFilterTableViewController: UITableViewController {

    var seasons: [String] = ["Season 1", "Season 2", "Season 3"]
    weak var delegate: SeasonSelectionDelegate?
    
    lazy var blur: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .systemThickMaterialDark)
        let blurView = UIVisualEffectView(effect: effect)
        blurView.alpha = 1.0
        blurView.frame = self.view.bounds
        return blurView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .clear
        self.tableView.backgroundView = blur
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = UIEdgeInsets(
            top: UIScreen.main.bounds.height/3, left: 0, bottom: 0, right: 0)
    }

}

extension SeasonFilterTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.textLabel?.textAlignment = .center
        cell.selectedBackgroundView = UIView()
        cell.textLabel?.text = seasons[indexPath.row]
        cell.textLabel?.textColor = .white
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectSeason(season: indexPath.row + 1)
        self.dismiss(animated: true, completion: nil)
    }
}
