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
    var nameLabel = UILabel()
    var subTitle = UILabel()
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
            make.left.equalTo(self.contentView.snp.left).offset(8)
            make.top.equalTo(self.contentView.snp.top).offset(8)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(8)
            make.centerY.equalTo(self.contentView.snp.centerY)
        }
        subTitle.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(8)
            make.centerY.equalTo(self.contentView.snp.centerY)
        }
        addFollows.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp.right).offset(-58)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        deleteBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.addFollows.snp.left).offset(-58)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        iconView.image = UIImage.init(named: "intro2")
        nameLabel.text = "我是你爹"
        
        subTitle.text = "过年了，大家新年快乐"
        addFollows.setImage(UIImage.init(named: "dynamic_profile_gray"), for: .normal)
        deleteBtn.setImage(UIImage.init(named: "error_yellow"), for: .normal)
    }
}


