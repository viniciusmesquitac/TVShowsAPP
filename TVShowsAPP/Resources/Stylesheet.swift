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
    }

    enum Images {
        static let placeholderEpisode = UIImage(named: "placehodel_episode")
    }

    enum Icons {
        static let home = UIImage(named: "􀎟")
        static let search = UIImage(named: "􀒓")
        static let favorites = UIImage(named: "􀋆")
        static let settings = UIImage(named: "􀣌")
    }
}

protocol ThemeColor {
    var backgroundColor: UIColor { get }
    var primaryColor: UIColor { get }
}

enum Style: ThemeColor {

    case light
    case dark

    var backgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor.white
        case .dark:
            return UIColor.red
        }
    }

    var primaryColor: UIColor {
        switch self {
        case .light:
            return UIColor.red
        case .dark:
            return UIColor.red
        }
    }

}
