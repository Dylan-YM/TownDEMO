//
//  BigImageTableViewCell.swift
//  TownDemo
//
//  Created by richard_ym on 2017/2/7.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class BigImageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var vipIcon = UIImageView()
    var backImageIcon = UIImageView()
    var sixCircleIcon = UIImageView()
    var subTitleLabel = CustomLabel.setupNewLabel(text: "让我们红尘作伴好，活得潇潇洒洒飒飒飒飒", textAliment: .left, textColor: UIColor.white, textFont: UIFont.systemFont(ofSize: 10))
    var nameLabel = CustomLabel.setupNewLabel(text: "偶尔也一夜", textAliment: .left, textColor: UIColor.white, textFont: UIFont.systemFont(ofSize: 10))
    var avatarIcon = UIImageView()
    var eyeIcon = UIImageView()
    var messageIcon = UIImageView()
    var loveIcon = UIImageView()
    var positionLabel = CustomLabel.setupNewLabel(text: "本耶胡达市场", textAliment: .left, textColor: UIColor.yellow, textFont: UIFont.systemFont(ofSize: 10))
    var timeLabel = CustomLabel.setupNewLabel(text: "2016.11.06 19:55", textAliment: .left, textColor: UIColor.white, textFont: UIFont.systemFont(ofSize: 10))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        autoLayoutSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        self.contentView.addSubview(backImageIcon)
        backImageIcon.addSubview(vipIcon)
        backImageIcon.addSubview(sixCircleIcon)
        backImageIcon.addSubview(subTitleLabel)
        backImageIcon.addSubview(nameLabel)
        backImageIcon.addSubview(avatarIcon)
        backImageIcon.addSubview(eyeIcon)
        backImageIcon.addSubview(messageIcon)
        backImageIcon.addSubview(loveIcon)
        backImageIcon.addSubview(positionLabel)
        backImageIcon.addSubview(timeLabel)
        
        vipIcon.image = UIImage.init(named: "vip")
        sixCircleIcon.image = UIImage.init(named: "sixVenue-yellow")
        backImageIcon.image = UIImage.init(named: "avatar_userprofile_2")
        avatarIcon.image = UIImage.init(named: "intro1")
        eyeIcon.image = UIImage.init(named: "eyes")
        messageIcon.image = UIImage.init(named: "message_white")
        loveIcon.image = UIImage.init(named: "love_white")
        backImageIcon.snp.makeConstraints { (maker) in
            maker.left.equalTo(self.contentView.snp.left)
            maker.top.equalTo(self.contentView.snp.top)
            maker.right.equalTo(self.contentView.snp.right)
         maker.bottom.equalTo(contentView.snp.bottom).offset(200)
        }
        vipIcon.snp.makeConstraints { (maker) in
            maker.top.equalTo(backImageIcon.snp.top).offset(suggestMargin)
            maker.left.equalTo(backImageIcon.snp.left).offset(suggestMargin)
            maker.size.equalTo(CGSize(width: 50, height: 50))
        }
        timeLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(backImageIcon.snp.bottom).offset(-50)
            maker.left.equalTo(backImageIcon.snp.left).offset(50)
        }
        
        positionLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(timeLabel.snp.left)
            maker.top.equalTo(timeLabel.snp.bottom).offset(suggestMargin)
        }
        sixCircleIcon.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(vipIcon.snp.centerX)
            maker.centerY.equalTo(positionLabel.snp.centerY)
            maker.size.equalTo(CGSize(width: 25, height: 25))
        }
        
        subTitleLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(timeLabel.snp.left)
            maker.top.equalTo(positionLabel.snp.bottom).offset(suggestMargin)
        }
        nameLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(timeLabel.snp.left)
            maker.top.equalTo(subTitleLabel.snp.bottom).offset(suggestMargin)
        }
        avatarIcon.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(vipIcon.snp.centerX)
            maker.centerY.equalTo(nameLabel.snp.centerY)
            maker.size.equalTo(CGSize(width: 25, height: 25))
        }
        //        eyeIcon.snp.makeConstraints { (maker) in
        //
        //        }
        //        messageIcon.snp.makeConstraints { (maker) in
        //
        //        }
        //        loveIcon.snp.makeConstraints { (maker) in
        //
        //        }
       }
    func autoLayoutSetup(){
        
        
        
    }


}
