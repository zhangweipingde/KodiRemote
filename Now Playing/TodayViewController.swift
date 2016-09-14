//
//  TodayViewController.swift
//  Now Playing
//
//  Created by Mateo Olaya Bernal on 9/14/16.
//  Copyright © 2016 Mateo Olaya Bernal. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        for c in self.view.constraints {
            if c.identifier == "UIView-Encapsulated-Layout-Height" {
                print("HELLO WORLD: \(c.constant)")
            }
        }
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize){
        if (activeDisplayMode == NCWidgetDisplayMode.compact) {
            self.preferredContentSize = maxSize;
        }
        else {
            self.preferredContentSize = CGSize(width: 0, height: 300);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func widgetPerformUpdate(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        for c in self.view.constraints {
            if c.identifier == "UIView-Encapsulated-Layout-Height" {
                print("HELLO WORLD: \(c.constant)")
            }
        }
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
