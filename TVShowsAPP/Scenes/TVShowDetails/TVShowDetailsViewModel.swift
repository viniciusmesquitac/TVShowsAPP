//
//  TVShowDetailsViewModel.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

class TVShowDetailsViewModel {

    var tvShow: TVShow?
    let repository = FavoriteListRepository()

    init(tvShow: TVShow) {
        self.tvShow = tvShow
        if tvShow.image?.background == nil {
            getImageBackground()
        }
    }

    private func getImageBackground() {
        guard let tvShowId = tvShow?.id else { return }
        let tvMaze = TVMazeAPI()
        tvMaze.image(idShow: tvShowId) { images in
            let backgroundImages = images?.filter { $0.type == "background" }
            guard let stringUrl = backgroundImages?.first?.resolutions.original?.url else { return }
            self.tvShow?.image?.background = stringUrl
        }
    }

    @objc func didTapFavoriteButton() {
        guard let tvShow = tvShow else { return }
        repository.add(object: tvShow)
        print("\(tvShow.name) salvo!")
    }

    var isFavorite: Bool {
        guard let tvShow = tvShow else { return false }
        if repository.get(object: tvShow) != nil {
            return true
        }
        return false
    }

}

extension TVShowDetailsViewModel {

    var posterImage: String {
        return tvShow?.image?.medium ?? ""
    }

    var title: String {
        return tvShow?.name ?? "Untitle"
    }

    var genres: String {
        guard let genres = tvShow?.genres else { return "Casual" }
        if genres.isEmpty {
            return "Casual"
        }
        return genres.joined(separator: ", ")
    }

    var scheduleAt: String {
        guard let schedule = tvShow?.schedule else { return "" }
        if schedule.days.isEmpty {
            return ""
        }
        return schedule.days.joined(separator: ", ")
    }

    var summary: NSAttributedString {
        var summaryStringReplaced = tvShow?.summary?.replacingOccurrences(of: "<p>", with: "")
        summaryStringReplaced = summaryStringReplaced?.replacingOccurrences(of: "</p>", with: "")
        summaryStringReplaced = summaryStringReplaced?.replacingOccurrences(of: "<b>", with: "")
        summaryStringReplaced = summaryStringReplaced?.replacingOccurrences(of: "</b>", with: "")
        summaryStringReplaced = summaryStringReplaced?.replacingOccurrences(of: "<br>", with: "")
        summaryStringReplaced = summaryStringReplaced?.replacingOccurrences(of: "<br>", with: "")
        summaryStringReplaced = summaryStringReplaced?.replacingOccurrences(of: "<i>", with: "")
        summaryStringReplaced = summaryStringReplaced?.replacingOccurrences(of: "</i>", with: "")
        let attrStr = attributedText(
            withString: summaryStringReplaced ?? "",
            boldString: tvShow?.name ?? "",
            font: .systemFont(ofSize: 16))
        return attrStr
    }

    var rating: String {
        guard let rating = tvShow?.rating?.average else { return "Not rated" }
        return "Rating: \(rating)"
    }

}

extension TVShowDetailsViewModel {

    func attributedText(withString string: String, boldString: String, font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string,
                                                     attributes: [NSAttributedString.Key.font: font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: font.pointSize)
        ]
        let range = (string as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }

}
