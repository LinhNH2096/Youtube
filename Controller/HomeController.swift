//
//  ViewController.swift
//  YoutubePhake
//
//  Created by Nguyễn Hồng Lĩnh on 27/03/2021.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationbar()
        setupCollectionView()
        setUpMenuBar()
    }
    
    let menuBar: MenuBar = {
       let menuBar = MenuBar()
        return menuBar
    }()
    
    
    ///Set up Navigation bar & title
   private func setupNavigationbar() {
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width - 32, height: view.frame.size.height))
        titleLabel.text = "Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .white
        navigationItem.titleView = titleLabel
    }
    
    
    ///Set up Collection view
    private func setupCollectionView() {
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    ///Set up Menu bar
    private func setUpMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintWithFormat("V:|[v0(50)]|", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.size.width - 32) * 9 / 16
        
        return CGSize(width: self.view.frame.size.width, height: height + 84)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


