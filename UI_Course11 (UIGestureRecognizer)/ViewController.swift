//
//  ViewController.swift
//  UI_Course11 (UIGestureRecognizer)
//
//  Created by Александр Тарасов on 18/05/2019.
//  Copyright © 2019 Aleksandr Tarasov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipesObserver() //вызываем наблюдателя за свайпами
        tapObserver()  //вызываем наблюдателя за тапами
        
    }


    func swipesObserver() {  //наблюдатель за свайпами
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right //свайп слева-направо
        self.view.addGestureRecognizer(swipeRight) //вызов
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    func tapObserver() { //наблюдатель за тапами
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: doubleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        
        switch gester.direction {
        case .right:
            label.text = "Right swipe was recognized"
        case .left:
            label.text = "Left swipe was recognized"
        case .up:
            label.text = "Up swipe was recognized"
        case .down:
            label.text = "Down swipe was recognized"
        default:
            break
        }
    }

    @objc func tripleTapAction() {
        label.text = "Triple tap was recognized"
    }
    
    @objc func doubleTapAction() {
         label.text = "Double tap was recognized"
    }
    
}

