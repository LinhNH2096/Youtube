//
//  BaseCollectionViewCell.swift
//  YoutubePhake
//
//  Created by Nguyễn Hồng Lĩnh on 28/03/2021.
//

import UIKit

protocol BaseCellProtocol {
    func setupCell()
}

class BaseCell: UICollectionViewCell, BaseCellProtocol{
    func setupCell() {
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
