//
//  Extension.swift
//  YoutubePhake
//
//  Created by Nguyễn Hồng Lĩnh on 28/03/2021.
//

import Foundation
import UIKit

extension UIColor {
    
    ///Shortcut of set up RGB color
    static func rgb( _ red: CGFloat,_ green: CGFloat, _ blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    
    ///Func custom add constraint for subview of UIView
    func addConstraintWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let keyview = "v\(index)"
            ///Turn off auto create constraint of view cause constraints were customed
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[keyview] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }

}
