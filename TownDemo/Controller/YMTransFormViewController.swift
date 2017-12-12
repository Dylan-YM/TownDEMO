//
//  YMTransFormViewController.swift
//  TownDemo
//
//  Created by yumiao on 2017/10/17.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class YMTransFormViewController: UIViewController {

    
    var bigImageView : YMTransBigImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bigImageView = (Bundle.main.loadNibNamed("YMTransBigImageView", owner: nil, options: nil)?.first as? YMTransBigImageView)!
        self.view.addSubview(bigImageView!)
        bigImageView?.snp.makeConstraints({ (maker) in
            maker.edges.equalTo(self.view.snp.edges)
        })
        bigImageView?.seleteBlock = {
            self.navigationController?.popViewController(animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
