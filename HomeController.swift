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
        
        navigationItem.title = "Home"
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


/// Custom Video Collection View Cell
class VideoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///Subview - Thumbnail Image
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    ///Subview - Separator Line
    let separator: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor.black
        return uiView
    }()
    
    ///Subview - User image profile
    let userImageProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    ///Subview - Title video
    let titleVideo: UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor.yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///Subview - Subtitle video
    let subTitleVideo: UITextView = {
       let textView = UITextView()
        textView.backgroundColor = UIColor.gray
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    func setUpView() {
        
        ///Add subviews
        addSubview(thumbnailImageView)
        addSubview(separator)
        addSubview(userImageProfile)
        addSubview(titleVideo)
        addSubview(subTitleVideo)
        
        ///Horizontal constaints
        addConstraintWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        
        addConstraintWithFormat("H:|-16-[v0(44)]|", views: userImageProfile)
        
        addConstraintWithFormat("H:|[v0]|", views: separator)
        
        ///Vertical constraint
        addConstraintWithFormat("V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userImageProfile, separator)
        
        ///Title video - Top constraint
        addConstraint(NSLayoutConstraint(item: titleVideo, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        ///Title video  - Left constraint
        addConstraint(NSLayoutConstraint(item: titleVideo, attribute: .left, relatedBy: .equal, toItem: userImageProfile, attribute: .right, multiplier: 1, constant: 8))
        
        ///Title video  - Right constraint
        addConstraint(NSLayoutConstraint(item: titleVideo, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        ///Title video  - Height constraint
        addConstraint(NSLayoutConstraint(item: titleVideo, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 18))
        
        ///Subtitle video - Top constraint
        addConstraint(NSLayoutConstraint(item: subTitleVideo, attribute: .top, relatedBy: .equal, toItem: titleVideo, attribute: .bottom, multiplier: 1, constant: 8))
        
        ///Subtitle video  - Left constraint
        addConstraint(NSLayoutConstraint(item: subTitleVideo, attribute: .left, relatedBy: .equal, toItem: userImageProfile, attribute: .right, multiplier: 1, constant: 8))
        
        ///Subtitle video  - Right constraint
        addConstraint(NSLayoutConstraint(item: subTitleVideo, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        ///Subtitle video  - Height constraint
        addConstraint(NSLayoutConstraint(item: subTitleVideo, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 18))
    }
    
    ///Func custom add constraint
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

