//
//  CityView.swift
//  TownDemo
//
//  Created by yumiao on 2017/2/9.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit
import SnapKit

class CityView: UIView,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UIScrollViewDelegate {
    var horizontalConstraint  : Constraint?
       let  horizontalScrollView = UIScrollView()
    var horizontalListView : CityHoHorizontalListView = {
       var FlowLayout = UICollectionViewFlowLayout()
        FlowLayout.itemSize = CGSize.init(width: 70, height: 50)
        FlowLayout.scrollDirection = .vertical
//        FlowLayout.minimumInteritemSpacing = CGFloat(suggestMargin)
    let  collectionView = CityHoHorizontalListView(frame: CGRect.init(x: 0, y: 30, width: SCREEN_WIDTH , height: CGFloat(Int(SCREEN_WIDTH) - suggestMargin)),collectionViewLayout: FlowLayout)
        collectionView.bounces = false
    collectionView.backgroundColor = UIColor.yellow
    return collectionView
    }()
  
    var cityBtn = NoHightButton.setupNohighButton(title: "北京", titleColor: .black, seleteColor:.black , normalImg: UIImage.init(named: "downArrow_black"), seleteImg: nil, backColor: .orange, textFont: UIFont.systemFont(ofSize: 11))
    var searchBar = YMCustomSearchBar()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        setupSearchBar()
        setupSegment()
        setupHorizontalListView()        
        
     
        
    }
//搭建横着滑动的View
    func setupSegment(){
     
        horizontalScrollView.delegate = self
        horizontalScrollView.contentSize = CGSize(width: SCREEN_WIDTH * 2, height: 0)
//        horizontalScrollView.frame = CGRect(x: 0, y: 0, width:SCREEN_WIDTH , height: 82*2)
        self.addSubview(horizontalScrollView)
        horizontalScrollView.snp.makeConstraints { (maker) in
            maker.left.equalTo(self.snp.left)
            maker.right.equalTo(self.snp.right)
            maker.top.equalTo(searchBar.snp.bottom).offset(10)
            maker.height.equalTo(184)
        }
        
        for i in 0...16{
            let  horizontalBtn = UIButton()
            horizontalScrollView.addSubview(horizontalBtn)
            horizontalBtn.setImage(UIImage.init(named: String.init(format: "i-country-%zd",i+1 )), for: .normal)
            horizontalBtn.backgroundColor = UIColor.white
            horizontalBtn.snp.makeConstraints({ (maker) in
                maker.width.equalTo(78 )
                maker.height.equalTo(82)
                if ((i + 1) * 78 > Int(SCREEN_WIDTH * 2)){
                    maker.top.equalTo(horizontalScrollView.snp.top).offset(suggestMargin + 82)
                    maker.left.equalTo(horizontalScrollView.snp.left).offset((16 - i) * 78)
                }else{
                    maker.top.equalTo(horizontalScrollView.snp.top).offset(suggestMargin)
                    maker.left.equalTo(horizontalScrollView.snp.left).offset(i * 78)
                }
                
            })
            let lineView = UIView()
            lineView.backgroundColor = UIColor.black
            horizontalBtn.addSubview(lineView)
            lineView.snp.makeConstraints({ (maker) in
                maker.left.equalTo(horizontalBtn.snp.right).offset(-0.5)
                maker.top.equalTo(horizontalBtn.snp.top)
                maker.bottom.equalTo(horizontalBtn.snp.bottom)
                maker.width.equalTo(0.5)
            })
            let VlineView = UIView()
            VlineView.backgroundColor = UIColor.black
            horizontalBtn.addSubview(VlineView)
            VlineView.snp.makeConstraints({ (maker) in
                maker.left.equalTo(horizontalBtn.snp.left)
                maker.top.equalTo(horizontalBtn.snp.bottom).offset(-0.5)
                maker.height.equalTo(0.5)
                maker.right.equalTo(horizontalBtn.snp.right)
            })
            if i < (16/2 + 1) {
                let topLine = UIView()
                horizontalBtn.addSubview(topLine)
                topLine.backgroundColor = UIColor.black
                topLine.snp.makeConstraints { (maker) in
                    maker.left.equalTo(horizontalBtn.snp.left)
                    maker.top.equalTo(horizontalBtn.snp.top)
                    maker.height.equalTo(0.5)
                    maker.right.equalTo(horizontalBtn.snp.right)
                }
  
            }
        }

       
    }
    func segmentClick(segment:UISegmentedControl){
        
    }
//搭建tableView
    func setupHorizontalListView(){
        let tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        self.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight  = 250;
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.snp.makeConstraints { (maker) in
            maker.left.equalTo(self.snp.left)
            maker.right.equalTo(self.snp.right)
            maker.top.equalTo(horizontalScrollView.snp.bottom).offset(suggestMargin)
            maker.bottom.equalTo(self.snp.bottom)
        }
        
        let swipe = UISwipeGestureRecognizer.init(target: self, action: #selector(CityView.tableViewSwipe))
        
        tableView.addGestureRecognizer(swipe)
        
        
        
    }
    func tableViewSwipe(){
    
        
    
    }
    // 搭建搜索框
    func setupSearchBar(){
        self.addSubview(cityBtn)
        cityBtn.snp.makeConstraints { (maker) in
            maker.left.equalTo(self.snp.left).offset(suggestMargin)
             maker.top.equalTo(self.snp.top).offset(suggestMargin)
            maker.size.equalTo(CGSize(width: 50, height: 30))
        }
        self.addSubview(searchBar)
        searchBar.placeholder = "搜索地点"
        searchBar.delegate = self
        searchBar.setSearchFieldBackgroundImage(UIImage.init(named: "searchBarBackground"), for: .normal)
        searchBar.snp.makeConstraints { (maker) in
            maker.left.equalTo(cityBtn.snp.right)
            maker.centerY.equalTo(cityBtn.snp.centerY)
            maker.right.equalTo(self.snp.right).offset(-suggestMargin)
            maker.height.equalTo(30)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: tableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cityBigImgCell") as?
        BigImageTableViewCell
        if cell == nil {
            cell = BigImageTableViewCell(style: .default, reuseIdentifier: "cityBigImgCell")
        }
        
        return cell!
        
    }
//MARK: tableView Delegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let segView = UIView()
        
        let segment = UISegmentedControl(items: ["故事","地点集","人物"])
        segment.backgroundColor = UIColor.white
        segment.tintColor = UIColor.black
        segment.selectedSegmentIndex = 0;
        
        segment.addTarget(self, action: #selector(segmentClick(segment:)), for: .touchUpInside)
        segView.addSubview(segment)
        segment.snp.makeConstraints { (maker) in
            maker.left.equalTo(segView.snp.left)
            maker.right.equalTo(segView.snp.right)
            maker.top.equalTo(segView.snp.top)
            maker.height.equalTo(44)
        }
        return segView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat(54)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    func ImageWithColorToImage(color:UIColor,size:CGSize)->UIImage{
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let  image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndPDFContext()
        return image!
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView,scrollView.contentOffset.x)
        searchBar.endEditing(true)

    }

}
