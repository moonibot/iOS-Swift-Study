//
//  ViewController.swift
//  day200812_CollectionView1
//
//  Created by 무니 on 2020/08/12.
//  Copyright © 2020 com.mooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let images = ["고등어무조림.jpeg", "삼치구이.jpeg", "청아라 미아점.jpeg",
                  "고등어무조림.jpeg", "삼치구이.jpeg", "청아라 미아점.jpeg",
                  "고등어무조림.jpeg", "삼치구이.jpeg", "청아라 미아점.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 아이템의 갯수를 카운트해주는 함수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 이미지 카운터 함수
        return images.count
    }
    
    // 셀 구성하기. 아이템 셀을 추가해주는 함수
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // dequeueReusableCell : RowCell 이란 아이디를 가진 셀을 복제한다.
           // 셀에 설정된 모든 값들이나 셀이 가지고 있는 뷰들 역시 모두 복제한다.
           // UICollectionViewCell 형식의 Class로 다운캐스팅을 하여 리턴값 형식을 맞춰준다.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
   
        // CustomCell 클래스로 다운캐스팅 됐으므로, 클래스 안에 있는 아웃렛 변수인 imageview의 이미지값을 위에서 선언 해두었던 images 상수배열에 들어가 있는 이미지들로 차례대로 변경 해준다.
        cell.image.image = UIImage(named: images[indexPath.row])
        cell.lblName.text = images[indexPath.row]
        // 텍스트에 맞춰서 라벨 사이즈가 조절되는 함수 .sizeToFit()
        //cell.lblName.sizeToFit()
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1

        // 변경된 이미지를 가진 셀을 리턴하여 새롭게 추가해준다.
        return cell

    }
    
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 컬렉션뷰 가로 전체 길이의 1/3을 길이로 설정한다.
        let collectionViewCellWithd = collectionView.frame.width / 3 - 1
        
        // 셀의 가로 길이, 세로길이를 같은 값으로 설정한다.
        return CGSize(width: collectionViewCellWithd, height: collectionViewCellWithd)

    }

    // 위아래 라인 간격
    // 컬렉션뷰에 있는 셀들의 위아래 간격(가로줄 간격)을 설정해준다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
        
    }

    // 옆 라인 간격
    // 컬렉션뷰에 있는 셀들의 양 옆 간격(세로줄 간격)을 설정해준다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }

}

// 커스텀 셀 구현
class CustomCell: UICollectionViewCell {
    @IBOutlet var image: UIImageView!
    @IBOutlet var lblName: UILabel!
}

