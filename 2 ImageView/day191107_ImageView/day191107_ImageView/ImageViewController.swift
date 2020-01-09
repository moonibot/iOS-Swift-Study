//
//  ViewController.swift
//  day191107_ImageView
//
//  Created by 무니 on 07/11/2019.
//  Copyright © 2019 com.mooni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isZOOM = false // 이미지 확대 여부를 나타내는 bool 타입의 변수
    var imgOn : UIImage? // 마신 후 커피 이미지를 가지고 있는 UIImage 타입의 변수
    var imgOff : UIImage? // 마시기 전 커피 이미지를 가지고 있는 UIImage 타입의 변수
    
    @IBOutlet var imgView: UIImageView! // 이미지 뷰에 대한 아웃렛 변수
    @IBOutlet var btnResize: UIButton! // 버튼에 대한 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 확대/축소 버튼에 대한 액션함수
        imgOn = UIImage(named: "IMG_3115.jpeg") // imgOn에 "IMG_3115.jpeg" 이미지를 할당
        imgOff = UIImage(named: "IMG_3107.jpeg") // imgOn에 "IMG_3107.jpeg" 이미지를 할당
        
        imgView.image = imgOn // 위에서 할당한 imgOn 이미지를 imgView에 할당
    

    }
    
    // 확대/축소 버튼에 대한 액션함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0 // 확대할 배율 값
        var newWidth:CGFloat, newHeught:CGFloat // 확대할 크기의 계산 값을 보관할 변수
        
        if (isZOOM){ //true 현재 확대된 그림일 경우(즉,타이틀은 축소)
            // 이미지 뷰의 프레임 너빗값을 scale 값으로 나눔
            newWidth = imgView.frame.width/scale
            // 이미지 뷰의 프레임 높잇값을 scale 값으로 나눔
            newHeught = imgView.frame.height/scale
            // 이미지 뷰의 프레임 크기를 수정된 너비와 높이로 변경
            imgView.frame.size = CGSize(width: newWidth, height: newHeught)
            
            // 버튼의 타이틀은 "확대"로 변경
            btnResize.setTitle("확대", for: .normal)
        }
        else{ // false 현재 축소된 그림일 경우(즉, 타이틀은 확대)
            // 이미지 뷰의 프레임 너빗값을 scale 값으로 곱함
            newWidth = imgView.frame.width*scale
            // 이미지 뷰의 프레임 높잇값을 scale 값으로 곱함
            newHeught = imgView.frame.height*scale
            // 이미지 뷰의 프레임 크기를 수정된 너비와 높이로 변경
            imgView.frame.size = CGSize(width: newWidth, height: newHeught)
            
            // 버튼의 타이틀은 "축소"로 변경
            btnResize.setTitle("축소", for: .normal)
        }
        isZOOM = !isZOOM // isZoom 변수의 상태를 !연산자를 사용하여 반전
    }
    
    // ON/OFF 스위치에 대한 액션 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{ // 만일 스위치가 On이면
            imgView.image = imgOn // 이미지 뷰의 이미지에 imgOn 이미지를 할당
        }else{ // 만일 스위치가 Off이면
            imgView.image = imgOff // 이미지 뷰의 이미지에 imgOff 이미지를 할당
        }
    }
    
}

