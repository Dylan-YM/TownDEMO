//
//  YMMyView.swift
//  TownDemo
//
//  Created by yumiao on 2017/11/28.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit
import MJRefresh
class YMMyView: UIView {

    var myViewBottomView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setupUI(){
    self.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "userprofile_2")!)
        
        self.addSubview(myViewBottomView)
        myViewBottomView.backgroundColor = UIColor.clear
        myViewBottomView.snp.makeConstraints({ (maker) in
            maker.left.right.bottom.equalTo(self)
            maker.height.equalTo(200)
        })
        setupBottomView()
    }
    func setupBottomView(){
    
        let fansBtn = UIButton()
        fansBtn.setTitle("粉丝", for: .normal)
        fansBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        fansBtn.setTitleColor(UIColor.white, for: .normal)
        myViewBottomView.addSubview(fansBtn)
        fansBtn.snp.makeConstraints { (maker) in
            maker.left.equalTo(myViewBottomView.snp.left).offset(50)
            maker.top.equalTo(myViewBottomView.snp.top)
            maker.size.equalTo(CGSize(width: 50, height: 30))
        }
        
        let registBtn = UIButton()
        registBtn.setTitle("关注", for: .normal)
        registBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        registBtn.setTitleColor(UIColor.white, for: .normal)
        myViewBottomView.addSubview(registBtn)
        registBtn.snp.makeConstraints { (maker) in
            maker.left.equalTo(fansBtn.snp.left).offset(100)
            maker.top.equalTo(myViewBottomView.snp.top)
            maker.size.equalTo(CGSize(width: 50, height: 30))
        }

        let lineView = UIView()
        lineView.backgroundColor = UIColor.white
        myViewBottomView.addSubview(lineView)
        lineView.snp.makeConstraints { (maker) in
            maker.top.equalTo(fansBtn.snp.bottom).offset(10)
            maker.left.equalTo(fansBtn.snp.left)
            maker.right.equalTo(myViewBottomView.snp.right)
            maker.height.equalTo(0.5)
        }
    
        let storyBtn = UIButton()
        storyBtn.setTitle("故事", for: .normal)
        storyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        storyBtn.setTitleColor(UIColor.white, for: .normal)
        myViewBottomView.addSubview(storyBtn)
        storyBtn.snp.makeConstraints { (maker) in
            maker.left.equalTo(fansBtn.snp.left)
            maker.top.equalTo(lineView.snp.bottom).offset(10)
            maker.size.equalTo(CGSize(width: 50, height: 30))
        }
        
        
        let addressBtn = UIButton()
        addressBtn.setTitle("地点", for: .normal)
        addressBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        addressBtn.setTitleColor(UIColor.white, for: .normal)
        myViewBottomView.addSubview(addressBtn)
        addressBtn.snp.makeConstraints { (maker) in
            maker.left.equalTo(registBtn.snp.left)
            maker.top.equalTo(lineView.snp.bottom).offset(10)
            maker.size.equalTo(CGSize(width: 50, height: 30))
        }
    }

    func btnClick(){
    
    
    }
}
