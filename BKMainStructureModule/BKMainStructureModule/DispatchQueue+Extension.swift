
//
//  DispatchQueue+Extension.swift
//  BKMainStructureModule
//
//  Created by Tinghui Yuan on 2018/1/3.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
// url: https://www.jianshu.com/p/640b64faea9a url: http://swifter.tips/lock/

import Foundation

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    // @synchronized 差不多等同于 objc_sync_enter(anObj)~~~objc_sync_exit(anObj)
    public class func once(token: String, block:()->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}

