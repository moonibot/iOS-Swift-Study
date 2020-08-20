//
//  ViewController.swift
//  day200820_CollecitonView1
//
//  Created by 무니 on 2020/08/20.
//  Copyright © 2020 com.mooni. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
   
    @IBOutlet var collectionView: UICollectionView!
    
    var allPhotos: PHFetchResult<PHAsset>?
    let scale = UIScreen.main.scale
    var thumbnailSize = CGSize.zero
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //self.allMedia = PHAsset.fetchAssets(with: nil)
        self.allPhotos = PHAsset.fetchAssets(with: nil)
        
        self.collectionView.reloadData()
        self.thumbnailSize = CGSize(width: 1024 * self.scale, height: 1024 * self.scale)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allPhotos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssetsCollectionViewCell", for: <#T##IndexPath#>) as! AssetsCollectionViewCell
        let asset = self.allPhotos?[indexPath.item]
        
        
        
        
    }
    
    
}

class AssetsCollectionViewCell: UICollectionViewCell {
    
}

final class LocalImageManager {
    
    static var shared = LocalImageManager()
    
    fileprivate let imageManager = PHImageManager()
    
    var representedAssetIdentifier: String?
    
    func requestImage(with asset: PHAsset?, thumbnailSize: CGSize, completion: @escapong )
    }

}
