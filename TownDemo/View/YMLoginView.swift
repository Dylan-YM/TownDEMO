//
//  YMLoginView.swift
//  TownDemo
//
//  Created by yumiao on 2017/11/28.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class YMLoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setupUI(){
     
        let horLineView = UIView()
        horLineView.backgroundColor = UIColor.black
        self.addSubview(horLineView)
        horLineView.snp.makeConstraints { (maker) in
            maker.left.top.equalTo(self).offset(50)
            maker.size.equalTo(CGSize(width: 50, height: 0.5))
        }
        
        
        let label = UILabel()
        label.text = "在你去过的地点，留下不忘的故事，启发别人，遇到同类。"
        self.addSubview(label)
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.snp.makeConstraints { (maker) in
            maker.left.equalTo(horLineView.snp.left)
            maker.top.equalTo(horLineView.snp.bottom).offset(50)
        }
        
        
        let loginBtn = UIButton()
        loginBtn.setBackgroundImage(UIImage.init(named: "loginBackView"), for: .normal)
        loginBtn.setTitle("登录/注册", for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        loginBtn.setTitleColor(UIColor.black, for: .normal)
        self.addSubview(loginBtn)
        
        loginBtn.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(self.snp.centerX)
            maker.centerY.equalTo(self.snp.centerY).offset(50)
            maker.size.equalTo(CGSize(width: 150, height: 150))
        }
        
        
        
    }
}
