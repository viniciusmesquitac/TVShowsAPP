//
//  UIImageView+AvarageColor.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 04/04/21.
//

import UIKit

extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(
            x: inputImage.extent.origin.x,
            y: inputImage.extent.origin.y,
            z: inputImage.extent.size.width,
            w: inputImage.extent.size.height)

        guard let filter = CIFilter(
                name: "CIAreaAverage",
                parameters: [kCIInputImageKey: inputImage,
                             kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull ?? (Any).self])
        context.render(
            outputImage, toBitmap: &bitmap,
            rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
            format: .RGBA8, colorSpace: nil)

        return UIColor(
            red: CGFloat(bitmap[0]) / 255,
            green: CGFloat(bitmap[1]) / 255,
            blue: CGFloat(bitmap[2]) / 255,
            alpha: CGFloat(bitmap[3]) / 255)
    }
}

extension CGFloat {
    static func randomGreen() -> CGFloat {
        return random(in: 0.3...0.6)
    }

    static func randomRed() -> CGFloat {
        return random(in: 0.8...1.0)
    }
}

extension UIColor {
    static func random() -> UIColor {
        let random = CGFloat.randomGreen()
        return UIColor(
            red: .randomRed(),
            green: random,
            blue: random,
            alpha: 1.0
        )
    }
}
