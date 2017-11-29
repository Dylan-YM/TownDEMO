//
//  MainViewController.swift
//  TownDemo
//
//  Created by richard_ym on 2017/1/16.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIScrollViewDelegate {
    
    var seleteBtn = NoHightButton()
    // 导航按钮名
    lazy var navNameArr :  [String] = {
        let name = ["动态","城市","发现"]
        return name
    }()
    // 导航正常图片
    lazy var navNormalImageArr :  [String] = {
        let name = ["nav_search_gray","nav_message_gray","nav_my_gray","nav_add_gray"]
        return name
    }()
    // 导航点击图片
    lazy var navSeleteImageArr :  [String] = {
        let name = ["nav_search_yellow","nav_message_yellow","nav_my_yellow","nav_add_yellow"]
        return name
    }()
    lazy var navBtnArr :  [NoHightButton] = {
        let name = [NoHightButton]()
        return name
    }()
    
    let backScrollView =  UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //创建视图
    func setupScrollView(){
    self.backScrollView.frame = CGRect(x: 0, y: (CGFloat)(PHONE_NAVIGATIONBAR_HEIGHT), width: SCREEN_WIDTH, height: (SCREEN_HEIGHT - (CGFloat)(PHONE_NAVIGATIONBAR_HEIGHT)))
        self.backScrollView.contentSize = CGSize(width: CGFloat(Int(SCREEN_WIDTH) * navBtnArr.count), height: (SCREEN_HEIGHT - (CGFloat)(PHONE_NAVIGATIONBAR_HEIGHT)))
        self.view.addSubview(self.backScrollView)
        self.backScrollView.bounces = false
        self.backScrollView.backgroundColor = UIColor.white
        self.backScrollView.isPagingEnabled = true
        self.backScrollView.delegate = self
        let dynamicsView = DynamicsView.init(frame: self.view.bounds, style: .grouped)
        self.backScrollView.addSubview(dynamicsView)
//      self.backScrollView.contentOffset = CGPoint(x: 0, y: 50 + 44 * 3)
        dynamicsView.snp.makeConstraints { (make) in
            make.left.equalTo(self.backScrollView.snp.left)
            make.top.equalTo(self.backScrollView.snp.top)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: (SCREEN_HEIGHT )))
        }
        // 动态页面Block 回调
        dynamicsView.seleteBlock = {
            let transFormVc = YMTransFormViewController()
            self.navigationController?.pushViewController(transFormVc, animated: true)
        }
        
        // 城市页面
        let cityView = CityView.init(frame: self.view.bounds)
        backScrollView.addSubview(cityView)
        cityView.snp.makeConstraints { (make) in
            make.left.equalTo(self.backScrollView.snp.left).offset(SCREEN_WIDTH)
            make.top.equalTo(self.backScrollView.snp.top)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: (SCREEN_HEIGHT )))
        }
        
        // 发现页面
        let findView = YMFindView.init(frame: view.bounds)
        backScrollView.addSubview(findView)
        findView.snp.makeConstraints { (make) in
            make.left.equalTo(cityView.snp.left).offset(SCREEN_WIDTH)
            make.top.equalTo(self.backScrollView.snp.top)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: (SCREEN_HEIGHT )))
        }
        
        // 设置通知页面
        let notifyView = YMNotifyView(frame: view.bounds)
        backScrollView.addSubview(notifyView)
        notifyView.snp.makeConstraints { (make) in
            make.left.equalTo(findView.snp.left).offset(SCREEN_WIDTH)
            make.top.equalTo(self.backScrollView.snp.top)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: (SCREEN_HEIGHT )))
        }
        
        // 设置我的页面
        let mySelfView = YMMyView(frame: view.bounds)
        backScrollView.addSubview(mySelfView)
        mySelfView.snp.makeConstraints { (make) in
            make.left.equalTo(notifyView.snp.left).offset(SCREEN_WIDTH)
            make.top.equalTo(self.backScrollView.snp.top)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: (SCREEN_HEIGHT )))
        }
        
        // 设置我的页面
        let loginView = YMLoginView(frame: view.bounds)
        backScrollView.addSubview(loginView)
        loginView.snp.makeConstraints { (make) in
            make.left.equalTo(mySelfView.snp.left).offset(SCREEN_WIDTH)
            make.top.equalTo(self.backScrollView.snp.top)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: (SCREEN_HEIGHT )))
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        createNavBar()
        navBtnClick(btn: navBtnArr[0])
        setupScrollView()
    }
//    创建导航栏
    func createNavBar(){
        let navView:UIView = UIView()
        navView.frame = (self.navigationController?.navigationBar.frame)!
        navView.backgroundColor = UIColor.black
        self.view.addSubview(navView)
      var navBtn = UIButton()
        for  index in 0...5{
            switch index {
            case 0,1:
                navBtn = creatNavButton(title: navNameArr[index], tag: index, isText: true)
                navBtn.frame = CGRect(x:(index * Int(SCREEN_WIDTH / 6)), y: 0, width: 64, height: 44)
                navView.addSubview(navBtn)
                break
            case 2:
                navBtn = creatNavButton(title: navNameArr[index] , tag: index ,isText:  false)
                navBtn.frame = CGRect(x:(index * Int(SCREEN_WIDTH / 6)), y: 0, width: 64, height: 44)
                navView.addSubview(navBtn)
                break
                   case 3,4,5:
                    navBtn = creatNavButton(title: nil,  tag: index ,isText:  false)
                    navBtn.frame = CGRect(x:(index * Int(SCREEN_WIDTH / 6)), y: 0, width: 64, height: 44)
                     navView.addSubview(navBtn)
                break
            default:
                break
            }
        }
    }
    
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        return true
    }
    // 创建按钮
    func  creatNavButton(title:String?,tag:Int,isText:Bool) ->UIButton {
        let  navBtn = NoHightButton()
        if !isText {
            navBtn.setImage(UIImage.init(named: navNormalImageArr[tag - 2]), for: .normal)
            navBtn.setImage(UIImage.init(named: navSeleteImageArr[tag - 2]), for: .selected)
        }
//        navBtn.setBackgroundImage(image, for: .normal)
        navBtn.addTarget(self, action: #selector(navBtnClick(btn:)), for: .touchUpInside)
        navBtn.setTitle(title, for: .normal)
        navBtn.setTitle(title, for: .selected)
        navBtn.tag = tag
        navBtn.setTitleColor(UIColor.white, for: .normal)
        navBtn.setTitleColor(UIColor.yellow, for: .selected)
        navBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        navBtn.titleLabel?.textAlignment = .center
        navBtnArr.append(navBtn)
        return navBtn
    }
    func  navBtnClick(btn:NoHightButton){
        backScrollView.isScrollEnabled = true
        seleteBtn.isSelected = false
        btn.isSelected = true
           seleteBtn = btn
        self.backScrollView.contentOffset = CGPoint(x: CGFloat(btn.tag * (Int)(SCREEN_WIDTH)), y: 0)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        seleteBtn.isSelected = false
        let btn:NoHightButton =  navBtnArr[NSInteger(scrollView.contentOffset.x / SCREEN_WIDTH)]
        btn.isSelected = true
        seleteBtn = btn
        print(scrollView.contentOffset.x ,scrollView.contentOffset.y)
    }
   
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        

    }
    
    
}
