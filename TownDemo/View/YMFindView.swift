//
//  YMFindView.swift
//  TownDemo
//
//  Created by yumiao on 2017/11/23.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class YMFindView: UIView,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {

    let searchBar = YMCustomSearchBar()
    var titleTableView : UITableView?
    var storyTableView : UITableView?
    var findViewCell : YMFindViewTitleCell?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSearchBar()
        setupTitleTableView()
        setupStoryTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSearchBar(){
        self.addSubview(searchBar)
        searchBar.placeholder = "搜索故事、人物、话题、地点"
        searchBar.delegate = self
        searchBar.contentMode = .scaleAspectFill;
        searchBar.setSearchFieldBackgroundImage(UIImage.init(named: "searchBarBackground"), for: .normal)
        searchBar.snp.makeConstraints { (maker) in
            maker.left.equalTo(self.snp.left).offset(suggestMargin)
            maker.top.equalTo(self.snp.top).offset(suggestMargin)
            maker.right.equalTo(self.snp.right).offset(-suggestMargin)
            maker.height.equalTo(30)
        }

    }
    func setupTitleTableView(){
        titleTableView = UITableView(frame: .init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .grouped)
        titleTableView?.delegate = self
        titleTableView?.dataSource = self
        titleTableView?.separatorStyle = .none
        titleTableView?.backgroundColor = UIColor.white
        titleTableView?.estimatedRowHeight  = 80;
        titleTableView?.rowHeight = UITableViewAutomaticDimension
        titleTableView?.tag = 100
        self.addSubview(titleTableView!)
        titleTableView?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(self.snp.left)
            maker.top.equalTo(searchBar.snp.bottom).offset(10)
            maker.right.equalTo(self.snp.right)
            maker.height.equalTo(80)
        })
    }
    func setupStoryTableView(){
        storyTableView = UITableView(frame: .init(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        storyTableView?.delegate = self
        storyTableView?.dataSource = self
        storyTableView?.separatorStyle = .none
        storyTableView?.backgroundColor = UIColor.white
        storyTableView?.estimatedRowHeight  = 250;
        storyTableView?.rowHeight = UITableViewAutomaticDimension
        storyTableView?.tag = 101
        self.addSubview(storyTableView!)
        storyTableView?.snp.makeConstraints({ (maker) in
            maker.left.equalTo(self.snp.left)
            maker.top.equalTo(titleTableView!.snp.bottom)
            maker.right.equalTo(self.snp.right)
            maker.bottom.equalTo(self.snp.bottom)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 100 {
            return 1;
        }else{
        
            return 10;
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 100 {
            findViewCell = YMFindViewTitleCell(style: .default, reuseIdentifier: nil)
            findViewCell?.selectionStyle = .none
            findViewCell?.titleArr = ["我爱你","宝贝","这是你的id","薛之谦","刚刚好","为什么不能和我一起","我的果汁分你一半","么么哒","就这样和你一起","一辈子的幸福","绅士","不要好好的"]
            findViewCell?.seleteBlock = { (index:NSInteger, name:String) in
            print(index,name)
            
            }
            return findViewCell!
        }else{
            var cell = tableView.dequeueReusableCell(withIdentifier: "findViewCell")
            if cell == nil {
                cell = BigImageTableViewCell(style: .default, reuseIdentifier: "findViewCell")
            }
            return cell!
        }
    }
  
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag == 100 {
            return CGFloat.leastNormalMagnitude
        }else{
            return 50
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        if tableView.tag == 100 {
            return nil
        }else{
            
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
    }
    
    
    func segmentClick(segment:UISegmentedControl){
        
    }
}
