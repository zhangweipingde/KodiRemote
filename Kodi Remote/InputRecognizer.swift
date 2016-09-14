//
//  InputRecognizer.swift
//  Kodi Remote
//
//  Created by Mateo Olaya Bernal on 9/14/16.
//  Copyright © 2016 Mateo Olaya Bernal. All rights reserved.
//

import UIKit

class InputRecognizer  {
    let kodi = Kodi.sharedInstance
    
    @objc func moveKey(recognizer: UISwipeGestureRecognizer) {
        switch recognizer.direction {
        case UISwipeGestureRecognizerDirection.down:
            execute(command: .DownKey)
            break
        case UISwipeGestureRecognizerDirection.up:
            execute(command: .UpKey)
            break
        case UISwipeGestureRecognizerDirection.right:
            execute(command: .RightKey)
            break
        case UISwipeGestureRecognizerDirection.left:
            execute(command: .LeftKey)
            break
        default:
            break
        }
    }
    
    @objc func selectKey() {
        execute(command: .SelectKey)
    }
    
    @objc func backKey() {
        execute(command: .BackKey)
    }
    
    func execute(command: Control) {
        kodi.inputDevice.execute(
            method: KodiMethod(
                method: command,
                params: nil,
                id: nil
            )
        )
    }
}
