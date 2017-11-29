//
//  YMTransBigImageView.swift
//  TownDemo
//
//  Created by yumiao on 2017/11/28.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit
import CoreMotion
class YMTransBigImageView: UIView {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var horicalBtn: UIButton!
    @IBOutlet weak var pointBtn: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    let motionManager = CMMotionManager()
    var timeInterval : CGFloat = 0;
    
    @IBOutlet weak var backImageViewLeftConstatraint: NSLayoutConstraint!
    @IBOutlet weak var backImageTopConstartint: NSLayoutConstraint!
    var isHorical : Bool = true
    typealias didSeleteBlock = () -> (Void)
    var seleteBlock : didSeleteBlock?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        timeInterval = 0.01
        //开始陀螺仪更新
        startGyroUpdates()
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        if seleteBlock != nil {
            seleteBlock!()
        }
    }
    @IBAction func homeBtnClick(_ sender: Any) {
    }
    @IBAction func transFromBtnClick(_ sender: Any) {
        if isHorical {
            let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            isHorical = false
        }else{
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            isHorical = true
            self.backImageViewLeftConstatraint.constant = -50
        }

    }
    func setupUI(){
    
    
    print("黑木耳！！！")
    }
    func startGyroUpdates() {
        //判断设备支持情况
        guard motionManager.isAccelerometerAvailable else {
            print("\n当前设备不支持陀螺仪\n")
            return
        }
        
        //设置刷新时间间隔
        self.motionManager.accelerometerUpdateInterval = TimeInterval(self.timeInterval)
        
        //开始实时获取数据
        let queue = OperationQueue.current
        
        self.motionManager.startAccelerometerUpdates(to: queue!) { (gyroData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            // 有更新
            if self.motionManager.isAccelerometerActive {
                if let rotationRate = gyroData {
                    var text = "---当前陀螺仪数据---\n"
                    
                      if self.isHorical {
                        if ((self.backImageViewLeftConstatraint.constant <= -200 && !(rotationRate.acceleration.x < 0)) || (self.backImageViewLeftConstatraint.constant >= 0 && !(rotationRate.acceleration.x > 0)) || (self.backImageViewLeftConstatraint.constant >= -200 && self.backImageViewLeftConstatraint.constant < 0)){
                            self.backImageViewLeftConstatraint.constant += (CGFloat)(rotationRate.acceleration.x * 10)
                            
                        }
                        if ((self.backImageTopConstartint.constant <= -400 && !(rotationRate.acceleration.z < 0)) || (self.backImageTopConstartint.constant >= -50 && !(rotationRate.acceleration.z > 0)) || (self.backImageTopConstartint.constant >= -400 && self.backImageTopConstartint.constant < -50)){
                            self.backImageTopConstartint.constant += (CGFloat)(rotationRate.acceleration.z * 10)
                        }
                      } else{
                            if ((self.backImageViewLeftConstatraint.constant <= -50 && !(rotationRate.acceleration.y < 0)) || (self.backImageViewLeftConstatraint.constant >= 0 && !(rotationRate.acceleration.y > 0)) || (self.backImageViewLeftConstatraint.constant >= -50 && self.backImageViewLeftConstatraint.constant < 0)){
                                self.backImageViewLeftConstatraint.constant += (CGFloat)(rotationRate.acceleration.y * 10)
                                
                            }
                            if ((self.backImageTopConstartint.constant <= -400 && !(rotationRate.acceleration.z < 0)) || (self.backImageTopConstartint.constant >= -50 && !(rotationRate.acceleration.z > 0)) || (self.backImageTopConstartint.constant >= -500 && self.backImageTopConstartint.constant < -50)){
                                self.backImageTopConstartint.constant += (CGFloat)(rotationRate.acceleration.z * 10)
                            }
                    }

                    print(self.backImageTopConstartint.constant,self.backImageViewLeftConstatraint.constant)
                      text += "x: \(rotationRate.acceleration.x)\n"
                    text += "y: \(rotationRate.acceleration.y)\n"
                    text += "z: \(rotationRate.acceleration.z)\n"
                    print(text)
                    
                }
            }

        }
    }
}
