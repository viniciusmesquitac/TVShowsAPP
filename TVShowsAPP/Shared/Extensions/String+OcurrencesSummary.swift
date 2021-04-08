//
//  String+OcurrencesSummary.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 06/04/21.
//

import UIKit

extension String {

    func attributedText(boldString: String, font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self,
                                                     attributes: [NSAttributedString.Key.font: font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: font.pointSize)
        ]
        let range = (self as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }

    var removeAllOcurrences: String {
        var summaryStringReplaced = self
        summaryStringReplaced = summaryStringReplaced.replacingOccurrences(of: "</p>", with: "")
        summaryStringReplaced = summaryStringReplaced.replacingOccurrences(of: "<p>", with: "")
        summaryStringReplaced = summaryStringReplaced.replacingOccurrences(of: "<b>", with: "")
        summaryStringReplaced = summaryStringReplaced.replacingOccurrences(of: "</b>", with: "")
        summaryStringReplaced = summaryStringReplaced.replacingOccurrences(of: "<br>", with: "")
        summaryStringReplaced = summaryStringReplaced.replacingOccurrences(of: "<br>", with: "")
        summaryStringReplaced = summaryStringReplaced.replacingOccurrences(of: "<i>", with: "")
        summaryStringReplaced = summaryStringReplaced.replacingOccurrences(of: "</i>", with: "")
        return summaryStringReplaced
    }
}
