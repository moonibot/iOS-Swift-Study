//
//  ViewController.swift
//  day200106_SwipeGestureGallery
//
//  Created by 무니 on 2020/01/06.
//  Copyright © 2020 com.mooni. All rights reserved.
//

import UIKit

var images = ["01.jpeg", "02.jpeg", "03.jpeg", "04.jpeg", "05.jpeg", "06.jpeg"]

class ViewController: UIViewController {
    
    let numOfTouchs = 2

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        imgView.image = UIImage(named: images[0])
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)

        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
        
        
    }
    
    // 한 손가락 스와이프 제스쳐를 행했을 때 실행할 액션 메서드
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        // 만일 제스쳐가 있다면
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.left :
                    pageControl.currentPage -= 1
                    imgView.image = UIImage(named: images[pageControl.currentPage])
                case UISwipeGestureRecognizer.Direction.right :
                    pageControl.currentPage += 1
                    imgView.image = UIImage(named: images[pageControl.currentPage])
                default:
                  break
            }

        }

    }
    
    // 두 손가락 스와이프 제스쳐를 행했을 때 실행할 액션 메서드
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
               case UISwipeGestureRecognizer.Direction.left:
                    pageControl.currentPage -= 1
                    imgView.image = UIImage(named: images[pageControl.currentPage])
               case UISwipeGestureRecognizer.Direction.right:
                    pageControl.currentPage += 1
                    imgView.image = UIImage(named: images[pageControl.currentPage])
               default:
                   break
            }
        }
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        print("page Changed")
        
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
}

