//
//  ViewController.swift
//  Kodi Remote
//
//  Created by Mateo Olaya Bernal on 9/13/16.
//  Copyright © 2016 Mateo Olaya Bernal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var recognizers:InputRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let k = Kodi.sharedInstance
        
        recognizers = InputRecognizer()
        
        k.inputDevice.execute(method: KodiMethod(method: Control.SelectKey, params: nil, id: nil))
        
        let tapGesture = UITapGestureRecognizer(target: recognizers, action: #selector(recognizers.selectKey))
        
        view.addGestureRecognizer(tapGesture)
        
        let backGesture = UITapGestureRecognizer(target: recognizers, action: #selector(recognizers.backKey))
        backGesture.numberOfTapsRequired = 2
        
        view.addGestureRecognizer(backGesture)
        
        
        let swipeGestureDown = UISwipeGestureRecognizer(target: recognizers, action: #selector(recognizers.moveKey))
        swipeGestureDown.direction = .down
        
        view.addGestureRecognizer(swipeGestureDown)
        
        let swipeGestureUp = UISwipeGestureRecognizer(target: recognizers, action: #selector(recognizers.moveKey))
        swipeGestureUp.direction = .up
        
        view.addGestureRecognizer(swipeGestureUp)
        
        let swipeGestureLeft = UISwipeGestureRecognizer(target: recognizers, action: #selector(recognizers.moveKey))
        swipeGestureLeft.direction = .left
        
        view.addGestureRecognizer(swipeGestureLeft)
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: recognizers, action: #selector(recognizers.moveKey))
        swipeGestureRight.direction = .right
        
        view.addGestureRecognizer(swipeGestureRight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

