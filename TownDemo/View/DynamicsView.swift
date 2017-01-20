//
//  DynamicsView.swift
//  TownDemo
//
//  Created by richard_ym on 2017/1/18.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class DynamicsView: UITableView,UITableViewDelegate,UITableViewDataSource {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.backgroundColor = UIColor.yellow
        self.dataSource = self
        self.delegate = self
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "dynamic") as?
        SuggestedFollowsTableViewCell
        if cell == nil {
            cell = SuggestedFollowsTableViewCell(style: .default, reuseIdentifier: "dynamic")
        }
       
        return cell!
    }


}
