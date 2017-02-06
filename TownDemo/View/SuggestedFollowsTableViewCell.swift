//
//  SuggestedFollowsCell.swift
//  TownDemo
//
//  Created by richard_ym on 2017/1/19.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit
import SnapKit

class SuggestedFollowsTableViewCell: UITableViewCell {

    
    var iconView = UIImageView()
    var nameLabel = CustomLabel.setupNewLabel(text: "我很好", textAliment: .left, textColor: .black, textFont: UIFont.systemFont(ofSize: 11))
    var subTitle =  CustomLabel.setupNewLabel(text: "下雨天了怎么办我好", textAliment: .left, textColor: .gray, textFont: UIFont.systemFont(ofSize: 11))
    var deleteBtn = UIButton()
    var addFollows = UIButton()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        
        self.contentView.addSubview(iconView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(subTitle)
        self.contentView.addSubview(deleteBtn)
        self.contentView.addSubview(addFollows)
        self.iconView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.left).offset(suggestMargin)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.size.equalTo(CGSize(width: suggestIconWeight, height: suggestIconWeight))
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(suggestMargin)
            make.centerY.equalTo(self.contentView.snp.centerY)
        }
        subTitle.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(suggestMargin)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.width.equalTo(suggestFollowBtnWeight * 2)
        }
        addFollows.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.right).offset(-(suggestFollowBtnWeight + suggestMargin))
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.size.equalTo(CGSize(width: suggestFollowBtnWeight, height: suggestFollowBtnWeight))
        }
        deleteBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.addFollows.snp.left).offset(-(suggestFollowBtnWeight + suggestMargin))
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.size.equalTo(CGSize(width: suggestFollowBtnWeight, height: suggestFollowBtnWeight))
        }
        
        iconView.image = UIImage.init(named: "intro2")
        addFollows.setImage(UIImage.init(named: "dynamic_profile_yellow"), for: .normal)
        deleteBtn.setImage(UIImage.init(named: "error_yellow"), for: .normal)
        self.contentView.snp.makeConstraints { (maker) in
            maker.left.equalTo(self.snp.left)
            maker.right.equalTo(self.snp.right)
            maker.top.equalTo(self.snp.top)
            maker.bottom.equalTo(iconView.snp.bottom).offset(suggestMargin )
        }
    }
    
}


