//
//  MenuBar.swift
//  YoutubePhake
//
//  Created by Nguyễn Hồng Lĩnh on 28/03/2021.
//

import UIKit

class MenuBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Why do we need to use lazy key word at here ?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    let cellId = "cellId"
    
    let imageNames = ["home", "trending", "subscription", "user"]
    
    let indexFirstSelected = IndexPath(item: 0, section: 0)
    
    func setupCollectionView() {
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        ///Add collection view and set constraint
        addSubview(collectionView)
        addConstraintWithFormat("H:|[v0]|", views: collectionView)
        addConstraintWithFormat("V:|[v0]|", views: collectionView)
        
        collectionView.backgroundColor = UIColor.rgb(230, 31, 32)
        
    }
}

extension MenuBar: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.setupCell(imageName: imageNames[indexPath.row])
        
        if indexPath == indexFirstSelected {
            cell.isSelected = true
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
        } else {
            cell.isSelected = false
            collectionView.deselectItem(at: indexPath, animated: false)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width/4, height: frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
