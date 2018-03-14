//
//  ViewController.swift
//  swift-demo
//
//  Created by jingzhao on 2018/2/2.
//  Copyright © 2018年 zhaoxiaodong. All rights reserved.
//

import UIKit

private let kEdgeMargin : CGFloat = 8
private let kAnchorCellID = "kAnchorCellID"

public class ViewController: UIViewController {

    var homeType : HomeType!

    fileprivate lazy var homeVM : HomeViewModel = HomeViewModel()
    fileprivate lazy var collectionView : UICollectionView = {
        let layout = WaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: kEdgeMargin, left: kEdgeMargin, bottom: kEdgeMargin, right: kEdgeMargin)
        layout.minimumLineSpacing = kEdgeMargin
        layout.minimumInteritemSpacing = kEdgeMargin
        layout.dataSource = self
        
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        let nibUrl = "Frameworks/StudentSDK.framework/"
        collectionView.register(UINib(nibName: nibUrl + "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: kAnchorCellID)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        collectionView.backgroundColor  = .white
        return collectionView
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData(index: 0)
    }

}

extension ViewController{
    fileprivate func setupUI(){
        view.addSubview(collectionView)
    }
}

extension ViewController {
    fileprivate func loadData(index : Int){
//        if homeType == nil {
//             homeType.title = "全部"
//             homeType.type = 0
//        }
    
        homeType = HomeType(dict: ["title":"全部","type":"0"])
        homeType.title = "全部"
        homeVM.loadHomeData(type: homeType, index: index, finishedCallback: {
            self.collectionView.reloadData()
        })
     
    }
}

extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate,WaterfallLayoutDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeVM.anchorModels.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kAnchorCellID, for: indexPath) as! HomeViewCell
//        cell.anchorModel = homeVM.anchorModels[indexPath.item]
//
//        if indexPath.item == homeVM.anchorModels.count-1 {
//            loadData(index: homeVM.anchorModels.count)
//        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kAnchorCellID, for: indexPath) as! HomeViewCell
        
        cell.anchorModel = homeVM.anchorModels[indexPath.item]
        
        if indexPath.item == homeVM.anchorModels.count - 1 {
            loadData(index: homeVM.anchorModels.count)
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func waterfallLayout(_ layout: WaterfallLayout, indexPath: IndexPath) -> CGFloat {
         return indexPath.item % 2 == 0 ? kScreenW * 2 / 3 : kScreenW * 0.5
    }
    
    
}
