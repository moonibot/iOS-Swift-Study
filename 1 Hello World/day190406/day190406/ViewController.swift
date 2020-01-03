//
//  ViewController.swift
//  day190406
//
//  Created by 무니 on 06/04/2019.
//  Copyright © 2019 com.mooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblHello: UILabel! // 출력 레이블용 아웃렛 변수
    @IBOutlet var txtName: UITextField! // 이름 입력용 아웃렛 변수

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        // "Hello , "라는 문자열과 txtName.text의 문자열을 결합하여 lblhello.txt에 넣음
        lblHello.text="Hello , "+txtName.text!
    }
    
}

