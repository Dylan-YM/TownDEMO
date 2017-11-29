//
//  YMNotifyView.swift
//  TownDemo
//
//  Created by yumiao on 2017/11/27.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class YMNotifyView: UIView,UITableViewDelegate,UITableViewDataSource {

    
    var tableView : UITableView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   func  setupUI(){
    
    let tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), style: .grouped)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.estimatedRowHeight = 500;
    tableView.rowHeight = UITableViewAutomaticDimension
    self.addSubview(tableView)
    tableView.snp.makeConstraints({ (maker) in
        maker.edges.equalTo(self.snp.edges)
    })
    
    let markView = UIImageView()
    self.addSubview(markView)
    markView.image = UIImage.init(named: "bottomView")
    markView.snp.makeConstraints { (maker) in
        maker.top.equalTo(self.snp.bottom).offset(-100)
        maker.centerX.equalTo(self.snp.centerX)
        maker.size.equalTo(CGSize(width: 100, height: 23.5))
    }
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "bigImageCell") as?
        BigImageTableViewCell
        if cell == nil {
            cell = BigImageTableViewCell(style: .default, reuseIdentifier: "bigImageCell")
        }
        
        return cell!

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let headerView = UIView()
        let closeBtn = UIButton()
        headerView.addSubview(closeBtn)
        closeBtn.setImage(UIImage.init(named: "notify_close"), for: .normal)
        closeBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(headerView.snp.right).offset(-suggestMargin)
            maker.top.equalTo(headerView.snp.top).offset(suggestMargin)
            maker.size.equalTo(CGSize(width: 50, height: 50))
        }
        let disLabel = UILabel()
        disLabel.text = "开启推送通知，当有朋友关注你，给你的故事点赞，评论你的故事时，不错过这些消息。"
        disLabel.font = UIFont.systemFont(ofSize: 13)
        disLabel.textColor = UIColor.black
        headerView.addSubview(disLabel)
        disLabel.numberOfLines = 0
        disLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(headerView.snp.top).offset(50)
            maker.left.equalTo(headerView.snp.left).offset(50)
            maker.right.equalTo(headerView.snp.right).offset(-suggestMargin)
        }
        let openNotifyBtn = UIButton()
        headerView.addSubview(openNotifyBtn)
        openNotifyBtn.setTitle("打开", for: .normal)
        openNotifyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        openNotifyBtn.setTitleColor(UIColor.black, for: .normal)
        openNotifyBtn.addTarget(self, action: #selector(openBtnClick), for: .touchUpInside)
        openNotifyBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(headerView.snp.right).offset(-suggestMargin)
            maker.bottom.equalTo(headerView.snp.bottom).offset(-suggestMargin)
            maker.size.equalTo(CGSize(width: 50, height: 30))
        }
        

        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    func openBtnClick(){
    
        let url = NSURL(string: "App-Prefs:root=richard-ym.TownDemo")
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.openURL(url! as URL)
        }
        
    
        
     
    }
}
