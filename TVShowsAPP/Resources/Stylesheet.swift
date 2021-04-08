//
//  StyleSheet.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 02/04/21.
//

import UIKit

struct Stylesheet {

    static var theme: ThemeColor {
        return Style.light
    }

    struct Color {
        static let backgroundColor = theme.backgroundColor
        static let primaryColor = theme.primaryColor
        static let primaryTextColor = theme.primaryTextColor
        static let secundaryTextColor = theme.secundaryTextColor
    }

    enum Images {
        static let placeholderEpisode = UIImage(named: "placeholderEpisode")
        static let placeholderEpisodeNotAvailable = UIImage(named: "placeholderEpisodeNotAvailable")
        static let placeholderPoster = UIImage(named: "placeholderPoster")
        static let placeholderPosterNotAvailable = UIImage(named: "placeholderPosterNotAvailable")
    }

    enum Icons {
        static let home = UIImage(named: "􀎟")
        static let search = UIImage(named: "􀒓")
        static let favorites = UIImage(named: "􀋆")
        static let settings = UIImage(named: "􀣌")
        static let bottomArrow = UIImage(named: "􀄩")
    }

    enum Font {
        static let boldOfSize32 = UIFont.boldSystemFont(ofSize: 32)
        static let boldOfSize16 = UIFont.boldSystemFont(ofSize: 16)
    }
}

protocol ThemeColor {
    var backgroundColor: UIColor { get }
    var primaryColor: UIColor { get }
    var primaryTextColor: UIColor { get }
    var secundaryTextColor: UIColor { get }

}

enum Style: ThemeColor {

    case light
    case dark

    var backgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor.systemBackground
        case .dark:
            return UIColor.systemBackground
        }
    }

    var primaryColor: UIColor {
        switch self {
        case .light:
            return #colorLiteral(red: 1, green: 0.3012212217, blue: 0.3363096416, alpha: 1)
        case .dark:
            return #colorLiteral(red: 1, green: 0.3012212217, blue: 0.3363096416, alpha: 1)
        }
    }

    var primaryTextColor: UIColor {
        return UIColor.darkText
    }

    var secundaryTextColor: UIColor {
        return UIColor.darkGray
    }
}
