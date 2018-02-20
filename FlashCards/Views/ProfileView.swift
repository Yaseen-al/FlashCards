//
//  ProfileView.swift
//  FlashCards
//
//  Created by C4Q on 2/19/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit
import Firebase
class ProfileView: UIView {
    lazy var profileBackGroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = convertImageToBW(image: #imageLiteral(resourceName: "DuckProfile"))
        imageView.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.75
        imageView.addSubview(blurEffectView)
        return imageView
    }()
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "warMachines"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    lazy var profileImage: UIImageView = {
        let imageView = roundedImageView()
        imageView.layer.borderWidth = 2
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "DuckProfile")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    lazy var userEmail: UILabel = {
        let label = UILabel()
        label.text = "email"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    private func convertImageToBW(image:UIImage) -> UIImage {
        let filter = CIFilter(name: "CIPhotoEffectMono")
        // convert UIImage to CIImage and set as input
        let ciInput = CIImage(image: image)
        filter?.setValue(ciInput, forKey: "inputImage")
        // get output CIImage, render as CGImage first to retain proper UIImage scale
        let ciOutput = filter?.outputImage
        let ciContext = CIContext()
        let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
        return UIImage(cgImage: cgImage!)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        setupProfileBackGroundView()
        setupProfileImageView()
        setupUserNameLabel()
        setupUserEmailLabel()
    }
    private func setupProfileBackGroundView(){
        addSubview(profileBackGroundView)
        profileBackGroundView.snp.makeConstraints { (constraint) in
            constraint.edges.equalTo(snp.edges)
        }
    }
    private func setupProfileImageView(){
        addSubview(profileImage)
        profileImage.snp.makeConstraints { (constraint) in
            constraint.center.equalTo(snp.center)
            constraint.width.equalTo(snp.width).multipliedBy(0.45)
            constraint.height.equalTo(snp.width).multipliedBy(0.45)
        }
        
    }
    private func setupUserNameLabel(){
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(profileImage.snp.bottom).offset(5)
            constraint.centerX.equalTo(snp.centerX)
        }
    }
    private func setupUserEmailLabel(){
        addSubview(userEmail)
        userEmail.snp.makeConstraints { (constraint) in
            constraint.top.equalTo(userNameLabel.snp.bottom)
            constraint.centerX.equalTo(userNameLabel.snp.centerX)
        }
    }
    func configureProfileView(from endUser: EndUser, user: User){
        self.userNameLabel.text = endUser.userName
        self.userEmail.text = user.email
    }
}
//to fix snp autolayout issue
class roundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius: CGFloat = self.bounds.size.width / 2.0
        
        self.layer.cornerRadius = radius
    }
}
