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
    
    var initialFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        if (pinch.state == UIPinchGestureRecognizer.State.began) {
            initialFontSize = txtPinch.font.pointSize
        } else {
            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
        }
    }


}

