//
//  HorizontalListCollectionViewCell.swift
//  TownDemo
//
//  Created by yumiao on 2017/2/20.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class HorizontalListCollectionViewCell: UICollectionViewCell {

    
    var iconView  = UIImageView()
    var nameLabel = CustomLabel.setupNewLabel(text: "标题", textAliment: .center, textColor: .black, textFont: UIFont.systemFont(ofSize: 10))
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        contentView.addSubview(iconView)
        self.contentView.backgroundColor = UIColor.orange
       iconView.image = UIImage.init(named: "cake")
        iconView.addSubview(nameLabel)
        iconView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(contentView.snp.edges)
            maker.height.equalTo(50)
            maker.bottom.equalTo(contentView.snp.bottom).offset(10)
        }
        
        nameLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(self.iconView.snp.centerX)
            maker.bottom.equalTo(self.iconView.snp.bottom).offset(-suggestMargin)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
