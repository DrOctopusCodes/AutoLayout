//
//  SwipeController.swift
//  AutoLayout
//
//  Created by Veena Revana Siddappa on 21/02/18.
//  Copyright © 2018 Veena Revana Siddappa. All rights reserved.
//

import UIKit
class SwipeController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: {(_) in self.collectionViewLayout.invalidateLayout()
            let indexPath=IndexPath(item:self.pageControl.currentPage, section:0)
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }){(_)in}
    }
    struct PageModel {
        let imageName:String
        let headerText:String
        let extraText:String
    }
    let pages=[PageModel(imageName: "feet", headerText: "Hello! Welcome to the jurassic world", extraText: "What are you waiting for? Join now and become exclusive member."),
               PageModel(imageName: "dino1", headerText: "Jurassic world is first of its kind in Asia", extraText: "You can find here fossils and models of various dino species"),
               PageModel(imageName: "dino2", headerText: "You can get into the dino costume and enjoy all day", extraText: "Jurassic world offers you some adventurous activities too!"),
               PageModel(imageName: "dino3", headerText: "Come revist the era of T-rex", extraText: "The 3-D T-rex is the one thing you will always remember")]
    
    private let previousButton:UIButton={
        let button=UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev(){
        let nextIndex=max(pageControl.currentPage-1,0)
        let indexPath=IndexPath(item:nextIndex,section:0)
        pageControl.currentPage=nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    private let nextButon:UIButton={
        let button=UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.titleLabel?.font=UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        let pinkColor=UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext(){
        let nextIndex=min(pageControl.currentPage+1,pages.count-1)
        let indexPath=IndexPath(item:nextIndex,section:0)
        pageControl.currentPage=nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl:UIPageControl={
        let pc=UIPageControl()
        pc.currentPage=0
        pc.numberOfPages=pages.count
        pc.currentPageIndicatorTintColor=UIColor.red
        pc.pageIndicatorTintColor=UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    fileprivate func setUpBottomButtons(){
        let blueView=UIView()
        blueView.backgroundColor=UIColor.blue
        let bottomControlsStackView=UIStackView(arrangedSubviews:[previousButton,pageControl,nextButon])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints=false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)])
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x=targetContentOffset.pointee.x
        pageControl.currentPage=Int(x/view.frame.width)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBottomButtons()
        collectionView?.backgroundColor=UIColor.white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled=true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
       let page=pages[indexPath.item]
        cell.page=page
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
