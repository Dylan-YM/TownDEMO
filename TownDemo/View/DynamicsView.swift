//
//  DynamicsView.swift
//  TownDemo
//
//  Created by richard_ym on 2017/1/18.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class DynamicsView: UITableView,UITableViewDelegate,UITableViewDataSource {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.backgroundColor = randomColor
        self.dataSource = self
        self.delegate = self
        self.estimatedRowHeight = 500;
        self.rowHeight = UITableViewAutomaticDimension
        
    }
    
    typealias didSeleteBlock = () -> (Void)
    var seleteBlock : didSeleteBlock?
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 3 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "suggestFollowCell") as?
            SuggestedFollowsTableViewCell
            if cell == nil {
                cell = SuggestedFollowsTableViewCell(style: .default, reuseIdentifier: "suggestFollowCell")
            }
 
            return cell!
        }else{
            var cell = tableView.dequeueReusableCell(withIdentifier: "bigImageCell") as?
            BigImageTableViewCell
            if cell == nil {
                cell = BigImageTableViewCell(style: .default, reuseIdentifier: "bigImageCell")
            }

              return cell!
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headSuggestView = UIView()
        let suggestLabel = CustomLabel.setupNewLabel(text: "推荐关注的人", textAliment: .left, textColor: .lightGray, textFont: UIFont.systemFont(ofSize: 11))
        let headButton = NoHightButton()
        headButton.setImage(UIImage.init(named: "dynamic_profile_gray"), for: .normal)
        headSuggestView.addSubview(headButton)
        headSuggestView.addSubview(suggestLabel)
        suggestLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(headSuggestView.snp.left).offset(suggestFollowBtnWeight)
            maker.centerY.equalTo(headSuggestView.snp.centerY)
        }
        
        headButton.snp.makeConstraints { (maker) in
            maker.right.equalTo(headSuggestView.snp.right).offset(-suggestMargin)
            maker.centerY.equalTo(headSuggestView.snp.centerY)
            maker.size.equalTo(CGSize(width: suggestFollowBtnWeight, height: suggestFollowBtnWeight))
        }
        
        return headSuggestView

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat(suggestFollowBtnWeight)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if (self.seleteBlock != nil) {
            self.seleteBlock!()
        }
    }
}
