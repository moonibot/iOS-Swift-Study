//
//  ViewController.swift
//  day200812_CollectionView
//
//  Created by 무니 on 2020/08/12.
//  Copyright © 2020 com.mooni. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var collectionItems = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setCollectionItems()
    }
    
    func setCollectionItems() {
        collectionItems = ["Apple",
                           "Samung",
                           "LG",
                           "Sky",
                           "Huawei",
                           "xiaomi",
                           "window",
                           "Nokia"]
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return collectionItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
        
        //  Configure the Cell
        cell.collectionviewTest.text = collectionItems[indexPath.row]
        
        
        var bgColor = UIColor.init()
        if indexPath.row % 2 == 0 {
            bgColor = UIColor.green
        } else {
            bgColor = UIColor.red
        }
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.backgroundColor = bgColor
        
        return cell
    }
    
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWithd = collectionView.frame.width / 3 - 1
           
        return CGSize(width: collectionViewCellWithd, height: collectionViewCellWithd)

    }

       // 위아래 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 1

    }

    // 옆 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           
        return 1
    }
  
    // change background color when user touches cell
    /*
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
    */
    
    // change background color back when user releases touch
    /*
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.cyan
    }
    */

}

