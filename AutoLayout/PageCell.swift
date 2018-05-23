//
//  PageCell.swift
//  AutoLayout
//
//  Created by Veena Revana Siddappa on 21/02/18.
//  Copyright © 2018 Veena Revana Siddappa. All rights reserved.
//

import UIKit
class PageCell: UICollectionViewCell {
  
    var page:SwipeController.PageModel?{
        didSet{
            guard let unwrappedPage=page else {return}
            feetImage.image=UIImage(named:unwrappedPage.imageName)
            let attributedText=NSMutableAttributedString(string:unwrappedPage.headerText,attributes:[NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string:"\n\n\n\(unwrappedPage.extraText)",attributes:[NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13),NSAttributedStringKey.foregroundColor:UIColor.gray]))
            headingText.attributedText=attributedText
            headingText.textAlignment = .center
        }
    }
    
   private let feetImage:UIImageView={
        let image=UIImageView(image: #imageLiteral(resourceName: "feet"))
        image.translatesAutoresizingMaskIntoConstraints=false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let headingText:UITextView={
        let textView=UITextView()
        let attributedText=NSMutableAttributedString(string:"Hello! Welcome to the all new jurassic world",attributes:[NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 18)])
        textView.isEditable=false
        attributedText.append(NSAttributedString(string:"\n\n\nWhat are you waiting for? Join now and become the exclusive member of jurassic world",attributes:[NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13),NSAttributedStringKey.foregroundColor:UIColor.gray]))
        textView.attributedText=attributedText
        textView.translatesAutoresizingMaskIntoConstraints=false
        textView.textAlignment = .center
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    
    private func setUpLayout(){
        let topContainer=UIView()
        addSubview(topContainer)
        topContainer.translatesAutoresizingMaskIntoConstraints=false
        topContainer.topAnchor.constraint(equalTo: topAnchor).isActive=true
        topContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive=true
        topContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive=true
        topContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive=true
        
        topContainer.addSubview(feetImage)
        feetImage.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive=true
        feetImage.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive=true
        feetImage.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.5).isActive=true
        feetImage.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.5).isActive=true
        addSubview(headingText)

        headingText.topAnchor.constraint(equalTo: topContainer.bottomAnchor).isActive=true
        headingText.leftAnchor.constraint(equalTo: leftAnchor,constant:24).isActive=true
        headingText.rightAnchor.constraint(equalTo: rightAnchor,constant:-24).isActive=true
        headingText.bottomAnchor.constraint(equalTo: bottomAnchor, constant:0).isActive=true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
