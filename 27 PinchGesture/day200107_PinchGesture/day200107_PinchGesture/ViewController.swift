//
//  ViewController.swift
//  day200107_PinchGesture
//
//  Created by 무니 on 2020/01/07.
//  Copyright © 2020 com.mooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtPinch: UILabel!
    
    var initialFontSize: CGFloat! // 글자 크기를 저장하기 위한 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // UIPinchGestureRecognizer 클래스 상수 pinch 선언
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch) // 핀치 제스처 등록
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        // 핀치 제스처 상태 확인
        if (pinch.state == UIPinchGestureRecognizer.State.began) {
            // 시작 상태이면 현재 글자 크기를 저장
            initialFontSize = txtPinch.font.pointSize
        } else {
            // 시작 상태가 아니면 텍스트의 글자 크기를 변경
            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
        }
    }


}

