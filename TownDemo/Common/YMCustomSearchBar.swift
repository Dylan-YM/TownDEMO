//
//  YMCustomSearchBar.swift
//  TownDemo
//
//  Created by yumiao on 2017/11/22.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit


class YMCustomSearchBar: UISearchBar {
    var backImage : UIImage?
    var textFrame : CGRect?


    override func layoutSubviews() {
        
        if let view:UIView = self.subviews.first {
            for curr in view.subviews {
                guard let searchBarBackgroundClass = NSClassFromString("UISearchBarBackground") else {
                    return
                }
                if curr.isKind(of:searchBarBackgroundClass){
                    if let imageView = curr as? UIImageView{
                        imageView.removeFromSuperview()
                        break
                    }
                }
            }
        }
    

        for  view  in subviews{
    
            for subview in view.subviews {
                    print(  type(of: subview))
                if subview.isKind(of: UITextField.self){
                    // 搜索框
                    var backImageNew: UIImage?
                    
                    if (textFrame == .zero)  {
                        subview.frame = CGRect(x: 0, y: 7, width: self.frame.size.width, height: 30)
                    }else{
                        subview.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
                    }
                    if backImage == nil {
//                         backImageNew = UIImage.init(named: "searchBarBackground")
                    }else{
                        backImageNew = backImage!
                       
                    }

                    subview.layer.masksToBounds = true
                    
                }
            }
            }
        }
}
