//
//  ViewController.swift
//  day200812_CollectionView
//
//  Created by 무니 on 2020/08/12.
//  Copyright © 2020 com.mooni. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

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
        return cell
    }

}

