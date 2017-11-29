//
//  YMFindViewTitleCell.swift
//  TownDemo
//
//  Created by yumiao on 2017/11/23.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class YMFindViewTitleCell: UITableViewCell {

    var titleLabel : UILabel?
    var width : CGFloat?
    var height : CGFloat?
    var titleArr : [String]?{
        didSet{
            if (titleArr != nil) {
                for (index,value) in (titleArr?.enumerated())! {
                    setupActomicLabelWithString(labelString: String.init(format:"#%@",value), index: index)
                }
                contentView.snp.makeConstraints { (maker) in
                    maker.left.equalTo(0)
                    maker.top.equalTo(0)
                    maker.width.equalTo(SCREEN_WIDTH)
                    maker.height.equalTo(height! + 28 + 8 + 14)
                }
            }
        }
    
    }
    typealias didSeleteBlock = (_ index:NSInteger,_ name:String) -> (Void)
    var seleteBlock : didSeleteBlock?
    
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
        width = 10
        height = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        titleLabel = UILabel()
        titleLabel?.textColor = UIColor.black
        titleLabel?.font = UIFont.systemFont(ofSize: 13)
        contentView.addSubview(titleLabel!)
    }
    func btnClick(btn:UIButton){
        if seleteBlock != nil {
            
            seleteBlock!(btn.tag,(btn.titleLabel?.text)!)
        }
    }
    func setupActomicLabelWithString(labelString:String,index:NSInteger){
        let btn = UIButton()
        btn.frame = CGRect(x: width!, y: height!, width: 0, height: 0)
        btn.setTitle(labelString, for: .normal)
        btn.tag = index
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        btn.setTitleColor(randomColor, for: .normal)
          contentView.addSubview(btn)
        btn.snp.makeConstraints { (maker) in
            maker.left.equalTo(contentView.snp.left).offset(width!)
            maker.top.equalTo(contentView.snp.top).offset(height!)
            maker.size.equalTo(CGSize(width: btn.frame.size.width, height: btn.frame.height))
            
        }
        if width! + btn.frame.size.width > 375 - 20 {
            btn.snp.removeConstraints()
            btn.snp.remakeConstraints({ (maker) in
                maker.left.equalTo(contentView.snp.left).offset(10)
                maker.top.equalTo(contentView.snp.top).offset(height! + 14 + 8)
                maker.size.equalTo(CGSize(width: btn.frame.size.width, height: btn.frame.height))
            })
            height = height! + 14 + 8
            width = 10
        }
        width = width! + btn.frame.width + 10
        
    }
    
}
