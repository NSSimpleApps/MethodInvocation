//
//  ViewController.swift
//  MethodInvocation
//
//  Created by NSSimpleApps on 19.11.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let obj = ObjcClass()
        let block1: (Int) -> Int = extractMethod(fromObject: obj, selector: Selector(("integerMethodForInteger:")))
        print(block1(222))
        
        let block2: (Int) -> Int = extractMethod(fromClass: ObjcClass.self, selector: Selector(("integerClassMethodForInteger:")))
        print(block2(222))
        
    }
}

func extractMethod(fromClass cl: AnyClass, selector: Selector) -> ((Int) -> Int) {
    if let method = class_getClassMethod(cl, selector) {
        let implementation = method_getImplementation(method)
        typealias Function = @convention(c) (AnyClass, Selector, Int) -> Int
        let function = unsafeBitCast(implementation, to: Function.self)
        
        return { arg in function(cl, selector, arg) }
    } else {
        fatalError()
    }
}

func extractMethod(fromObject object: AnyObject, selector: Selector) -> ((Int) -> Int) {
    if let method = class_getInstanceMethod(type(of: object), selector) {
        let implementation = method_getImplementation(method)
        typealias Function = @convention(c) (AnyObject, Selector, Int) -> Int
        let function = unsafeBitCast(implementation, to: Function.self)
        
        return { arg in function(object, selector, arg) }
    } else {
        fatalError()
    }
}


