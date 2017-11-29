//
//  NoHightButton.swift
//  TownDemo
//
//  Created by richard_ym on 2017/1/17.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class NoHightButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override var isHighlighted: Bool{
        set{
        
        }
        get{
        return false
        }
    
    }
    
    class func setupNohighButton(title:String,titleColor:UIColor,seleteColor:UIColor,normalImg:UIImage?,seleteImg:UIImage?,backColor:UIColor,textFont:UIFont) ->NoHightButton{
    
        let btn = NoHightButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.setTitleColor(seleteColor, for: .selected)
        btn.setImage(normalImg, for: .normal)
        btn.setImage(seleteImg, for: .selected)
        btn.backgroundColor = backColor
        btn.titleLabel?.font = textFont
        return btn
    }
}
