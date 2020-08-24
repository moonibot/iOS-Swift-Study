//
//  ViewController.swift
//  day200824_PhotoKitExample
//
//  Created by 무니 on 2020/08/24.
//  Copyright © 2020 com.mooni. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  

    @IBOutlet var collectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 지정된 섹션의 항목의 수를 반환(항목 개수)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          <#code#>
      }
      
    // 지정된 인덱스 경로에서 표시되는 셀 개체를 가져옴...
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          <#code#>
    }

}

