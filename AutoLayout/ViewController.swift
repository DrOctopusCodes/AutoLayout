////
////  ViewController.swift
////  AutoLayout
////
////  Created by Veena Revana Siddappa on 20/02/18.
////  Copyright © 2018 Veena Revana Siddappa. All rights reserved.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    let feetImage:UIImageView={
//        let image=UIImageView(image: #imageLiteral(resourceName: "feet"))
//        image.translatesAutoresizingMaskIntoConstraints=false
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
//
//    let headingText:UITextView={
//        let textView=UITextView()
//        let attributedText=NSMutableAttributedString(string:"Hello! Welcome to the all new jurassic world",attributes:[NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 18)])
//
//        attributedText.append(NSAttributedString(string:"\n\n\nWhat are you waiting for? Join now and become the exclusive member of jurassic world",attributes:[NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13),NSAttributedStringKey.foregroundColor:UIColor.gray]))
//        textView.attributedText=attributedText
//        textView.translatesAutoresizingMaskIntoConstraints=false
//        textView.textAlignment = .center
//        return textView
//    }()
//
//    private let previousButton:UIButton={
//        let button=UIButton(type: .system)
//        button.setTitle("PREV", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints=false
//        button.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
//        button.setTitleColor(UIColor.gray, for: .normal)
//        return button
//    }()
//
//    private let nextButon:UIButton={
//        let button=UIButton(type: .system)
//        button.setTitle("NEXT", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints=false
//        button.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
//        button.setTitleColor(UIColor.gray, for: .normal)
//        let pinkColor=UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
//        button.setTitleColor(pinkColor, for: .normal)
//        return button
//    }()
//
//    private let pageControl:UIPageControl={
//        let pc=UIPageControl()
//        pc.currentPage=0
//        pc.numberOfPages=4
//        pc.currentPageIndicatorTintColor=UIColor.red
//        pc.pageIndicatorTintColor=UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
//        return pc
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(headingText)
//        setUpLayout()
//        setUpBottomButtons()
//
//    }
//
//    fileprivate func setUpBottomButtons(){
//        let blueView=UIView()
//        blueView.backgroundColor=UIColor.blue
//        let bottomControlsStackView=UIStackView(arrangedSubviews:[previousButton,pageControl,nextButon])
//        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints=false
//        bottomControlsStackView.distribution = .fillEqually
//        view.addSubview(bottomControlsStackView)
//        NSLayoutConstraint.activate([
//            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)])
//    }
//
//    private func setUpLayout(){
//        let topContainer=UIView()
//        view.addSubview(topContainer)
//        topContainer.translatesAutoresizingMaskIntoConstraints=false
//        topContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
//        topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
//        topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
//        topContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive=true
//
//        topContainer.addSubview(feetImage)
//        feetImage.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive=true
//        feetImage.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive=true
//        feetImage.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.5).isActive=true
//        feetImage.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.5).isActive=true
//
//        headingText.topAnchor.constraint(equalTo: topContainer.bottomAnchor).isActive=true
//        headingText.leftAnchor.constraint(equalTo: view.leftAnchor,constant:24).isActive=true
//        headingText.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-24).isActive=true
//        headingText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:0).isActive=true
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//
//}
//
