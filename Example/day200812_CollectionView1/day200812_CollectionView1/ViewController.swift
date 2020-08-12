//
//  ViewController.swift
//  day200812_CollectionView1
//
//  Created by 무니 on 2020/08/12.
//  Copyright © 2020 com.mooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let images = ["a.png", "b.png", "c.png",
                  "a.png", "b.png", "c.png",
                  "a.png", "b.png", "c.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 이미지 카운터 함수
        return images.count
    }
    
    // 셀 구성하기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
        cell.image.image = UIImage(named: images[indexPath.row])

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

}

// 커스텀 셀 구현
class CustomCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
}

