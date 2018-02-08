//
//  Extensions.swift
//  BKMainStructureModule
//
//  Created by Tinghui Yuan on 2018/1/14.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit
import QuartzCore

extension NSObject {
    static func swizzleInstanceSelector(oldSel: Selector, newSel: Selector) {
        guard let oldMethod = class_getInstanceMethod(self, oldSel), let newMethod = class_getInstanceMethod(self, newSel) else {
            return
        }
        guard let oldImp = class_getMethodImplementation(self, oldSel), let newImp = class_getMethodImplementation(self, newSel) else {
            return
        }
        
        // 验证本类是否有oldSel的实现
        let vertify = class_addMethod(self, oldSel, newImp, method_getTypeEncoding(newMethod))
        if !vertify {
            method_exchangeImplementations(oldMethod, newMethod)
        }else {
            // 将父类的实现替换到我们的新方法
            class_replaceMethod(self, newSel, oldImp, method_getTypeEncoding(oldMethod))
        }
    }
    
    
    /// 把view转换为image
    ///
    /// - Parameters:
    ///   - view: 要转换的view
    ///   - size: view的尺寸
    /// - Returns: 返回image
    static func generateImage(withView view: UIView, size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, view.isOpaque, UIScreen.main.scale)
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            return nil
        }
        view.layer.render(in: currentContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIImage {
    
    class func originImage(named: String) -> UIImage? {
        return UIImage(named: named)?.withRenderingMode(.alwaysOriginal)
    }
    
    /// 生成纯色图片
    ///
    /// - Parameters:
    ///   - color: 图片颜色
    ///   - size: 图片尺寸
    convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            self.init()
            return
        }
        UIGraphicsEndImageContext()
        guard let aCgImage = image.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: aCgImage)
    }
}

extension UIColor {
    //MARK:- 随机色
    static var random : UIColor  {
        let aRedValue   = (CGFloat)(arc4random() % 255),
        aGreenValue = (CGFloat)(arc4random() % 255),
        aBlueValue  = (CGFloat)(arc4random() % 255)
        return UIColor(red: aRedValue / 255.0, green: aGreenValue / 255.0, blue: aBlueValue / 255.0, alpha: 1.0)
    }
    //MARK:- RGBA
    static func rgba(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a / 255.0)
    }
    
    //MARK:- 16进制
    convenience init(hex string: String, _ alpha: CGFloat = 1.0) {
        var hex = string.hasPrefix("#")
            ? String(string.dropFirst())
            : string
        guard hex.count == 3 || hex.count == 6
            else {
                self.init(white: 1.0, alpha: alpha)
                return
        }
        if hex.count == 3 {
            for (index, char) in hex.enumerated() {
                hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
            }
        }
        
        self.init(
            red:   CGFloat((Int(hex, radix: 16)! >> 16) & 0xFF) / 255.0,
            green: CGFloat((Int(hex, radix: 16)! >> 8) & 0xFF) / 255.0,
            blue:  CGFloat((Int(hex, radix: 16)!) & 0xFF) / 255.0, alpha: alpha)
    }
    
    //MARK:- 16进制
    static func colorWithHexString (hex: String, _ alpha: CGFloat = 1.0) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
