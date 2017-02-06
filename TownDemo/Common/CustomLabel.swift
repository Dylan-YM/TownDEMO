//
//  CustomLabel.swift
//  TownDemo
//
//  Created by richard_ym on 2017/1/19.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
 
    
    class func setupNewLabel(text:String,textAliment:NSTextAlignment,textColor:UIColor,textFont:UIFont) ->UILabel{
        let label = UILabel()
        label.text = text
        label.textAlignment = textAliment
        label.textColor = textColor
        label.font = textFont

        return label
    }

}
