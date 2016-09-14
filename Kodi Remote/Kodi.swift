//
//  Kodi.swift
//  Kodi Remote
//
//  Created by Mateo Olaya Bernal on 9/14/16.
//  Copyright © 2016 Mateo Olaya Bernal. All rights reserved.
//

import Foundation
import Alamofire

enum Control : String {
    case UpKey      = "Input.Up"
    case DownKey    = "Input.Down"
    case LeftKey    = "Input.Left"
    case RightKey   = "Input.Right"
    case BackKey    = "Input.Back"
    case MenuKey    = "Input.ContextMenu"
    case HomeKey    = "Input.Home"
    case SelectKey  = "Input.Select"
    case ShowOSDKey = "Input.ShowOSD"
}

struct KodiMethod {
    var method:Control!
    var params:[String : Any]?
    var id:Int?
    
    func decode() -> [String : Any] {
        return [
            "jsonrpc": "2.0",
            "method": method.rawValue
        ]
    }
}

class Connection {
    let remoteDeviceAddress:String = {
        return "http://192.168.1.1:8080/jsonrpc"
    }()
}

fileprivate protocol KodiCommand {
    func execute(method:KodiMethod)
}

class InputDevice : Connection, KodiCommand {
    internal func execute(method: KodiMethod) {
        Alamofire.request(remoteDeviceAddress,
            method: .post,
            parameters: method.decode(),
            encoding: JSONEncoding.default
        ).responseJSON { response in
            debugPrint(response)
        }
    }
    
}

class Kodi {
    static let sharedInstance = Kodi()
    
    let inputDevice = InputDevice()
    
    fileprivate init() { }
}
