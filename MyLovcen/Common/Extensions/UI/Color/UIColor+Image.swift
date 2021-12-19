//
//  UIColor+Image.swift
//  MyLovcen
//
//  Created by Andrija Scepanovic on 10/1/21.
//

import UIKit.UIColor
import UIKit.UIImage

public extension UIColor {

    /// Method creates image filled with color on which method is called.
    ///
    /// - Parameter size: Size of image, default size is 1pt
    /// - Returns: Image filled with color on which method is called with the given size
    func image(withSize size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.setFill()
        UIRectFill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image ?? UIImage()
    }
}
