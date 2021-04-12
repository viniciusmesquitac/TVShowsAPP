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
    var handleUpdateFavoriteButton: (() -> Void)?

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
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)

        if !isFavorite {
            repository.add(object: tvShow)
            print("\(tvShow.name) salvo!")
        } else {
            repository.delete(object: tvShow)
            print("\(tvShow.name) removido!")
        }
        handleUpdateFavoriteButton?()
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
        guard var summaryStringReplaced = tvShow?.summary
        else { return NSAttributedString(string: "") }
        summaryStringReplaced = summaryStringReplaced.removeAllOcurrences
        let attrStr = summaryStringReplaced.attributedText(
            boldString: tvShow?.name ?? "",
            font: .systemFont(ofSize: 16))
        return attrStr
    }

    var rating: String {
        guard let rating = tvShow?.rating?.average else { return "Not rated" }
        return "Rating: \(rating)"
    }

}
