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
    
    var allMedia: PHFetchResult<PHAsset>?
    let scale = UIScreen.main.scale
    var thumbnailSize = CGSize.zero
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        // MAKR: - 모든 미디어 가져오는 메소드
        self.allMedia = PHAsset.fetchAssets(with: nil)
        
        // MAKR: - 특정 타입(PHAssetMediaType) 미디어만 가져오는 메소드
        //self.allMedia = PHAsset.fetchAssets(with: .image, options: nil)
        self.collectionView.reloadData()
        self.thumbnailSize = CGSize(width: 1024 * self.scale, height: 1024 * self.scale)
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allMedia?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // self.registerClass(AssetsCollectionViewCell.self, forCellWithReuseIdentifier: AssetsCollectionViewCell)
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssetsCollectionViewCell", for: indexPath) as! AssetsCollectionViewCell
        
        let asset = self.allMedia?[indexPath.item]
        LocalImageManager.shared.requestImage(with: asset, thumbnailSize: self.thumbnailSize) { (image) in
            cell.configure(with: image)
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /*
        let size = CGSize(width: self.view.frame.width / 3, height: 100)
        return size
         */
        
        let width = collectionView.frame.width / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class AssetsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var assetImageView: UIImageView!
    fileprivate let imageManager = PHImageManager()
    
    var representAssetIdentifier: String?
    
    var thumbnailSize: CGSize {
        let scale = UIScreen.main.scale
        return CGSize(width: (UIScreen.main.bounds.width / 3) * scale, height: 100 * scale)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // self.assetImageView.contentMode = .scaleAspectFill
        if assetImageView != nil{
            self.assetImageView.contentMode = .scaleAspectFill
        } else {
            print(NSError.description())
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
        
    func configure(with image: UIImage?) {
        self.assetImageView.image = image
    }
}

final class LocalImageManager {
    
    static var shared = LocalImageManager()
    
    fileprivate let imageManager = PHImageManager()
    
    var representedAssetIdentifier: String?
    
    func requestImage(with asset: PHAsset?, thumbnailSize: CGSize, completion: @escaping (UIImage?) -> Void) {
        guard let asset = asset else {
            completion(nil)
            return
        }
        self.representedAssetIdentifier = asset.localIdentifier
        self.imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil, resultHandler: { image, info in
            if self.representedAssetIdentifier == asset.localIdentifier {
                completion(image)
            }
        })
    }

}
