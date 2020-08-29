//
//  ViewController.swift
//  day200825_CollectionView
//
//  Created by 무니 on 2020/08/25.
//  Copyright © 2020 com.mooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // imageliteral
    let images = [ #imageLiteral(resourceName: "고등어무조림") , #imageLiteral(resourceName: "삼치구이") , #imageLiteral(resourceName: "청아라 미아점") , #imageLiteral(resourceName: "고등어무조림") , #imageLiteral(resourceName: "삼치구이") , #imageLiteral(resourceName: "청아라 미아점") , #imageLiteral(resourceName: "고등어무조림") , #imageLiteral(resourceName: "삼치구이") , #imageLiteral(resourceName: "청아라 미아점") ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 이미지 갯수 카운팅
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    // 셀(이미지) 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
        cell.imageview.image = images[indexPath.row]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        return cell
        
    }
    
    // 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 3
        
        return CGSize(width: width, height: width)
    }
    
    // 위 아래 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }
    
    // 양 옆 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }

}

class CustomCell: UICollectionViewCell {
    @IBOutlet var imageview: UIImageView!
}

