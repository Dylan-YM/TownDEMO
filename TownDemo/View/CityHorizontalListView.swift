//
//  CityHoHorizontalListView.swift
//  TownDemo
//
//  Created by yumiao on 2017/2/20.
//  Copyright © 2017年 richard_ym. All rights reserved.
//

import UIKit

class CityHoHorizontalListView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.delegate = self
        self.dataSource = self
        self.register(HorizontalListCollectionViewCell.self, forCellWithReuseIdentifier: "horizontalCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int{
    
    return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "horizontalCell", for: indexPath) as! HorizontalListCollectionViewCell
       
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row,indexPath.section)
    }
    
}
