//
//  MenuCell.swift
//  YoutubePhake
//
//  Created by Nguyễn Hồng Lĩnh on 28/03/2021.
//

import UIKit

class MenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(91, 14, 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(91, 14, 13)
        }
    }
    
    override func setupCell() {
        super.setupCell()
        addSubview(imageView)
        addConstraintWithFormat("H:[v0(28)]", views: imageView)
        addConstraintWithFormat("V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    func setupCell(imageName: String) {
        imageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.rgb(91, 14, 13)
    }
}
