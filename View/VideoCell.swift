//
//  VideoCell.swift
//  YoutubePhake
//
//  Created by Nguyễn Hồng Lĩnh on 28/03/2021.
//

import UIKit

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
        imageView.image = UIImage(named: "son_tung_mtp_chung_ta_cua_hien_tai")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    ///Subview - Separator Line
    let separator: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return uiView
    }()
    
    ///Subview - User image profile
    let userImageProfile: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "son_tung_mtp_profile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    ///Subview - Title video
    let titleVideo: UILabel = {
       let label = UILabel()
        label.text = "SƠN TÙNG M-TP | CHÚNG TA CỦA HIỆN TẠI | OFFICIAL MUSIC VIDEO"
        label.font = label.font.withSize(14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///Subview - Subtitle video
    let subTitleVideo: UITextView = {
       let textView = UITextView()
        textView.text = "Sơn Tùng M-TP Official • 70M views • 3 months ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = UIColor.lightGray
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
        addConstraint(NSLayoutConstraint(item: subTitleVideo, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
    }
        
}

