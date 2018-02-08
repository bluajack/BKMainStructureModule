//
//  BKNavBar.swift
//  BKMainStructureModule
//
//  Created by Tinghui Yuan on 2018/1/3.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit

class BKNavBar: UINavigationBar {

    
    /// 设置全局导航栏背景图片
    ///
    /// - Parameter img: 背景图片
    class func setGlobalBackgroundImage(img: UIImage?) {
//        let nav = UINavigationBar.appearance(whenContainedInInstancesOf: [BKNavigationController.self])
        let nav = UINavigationBar.appearance()
        nav.setBackgroundImage(img, for: .default)
    }

    /// 设置全局导航栏标题颜色以及字体大小
    ///
    /// - Parameters:
    ///   - textColor: 字体颜色
    ///   - fontSize: 字体大小
    class func setGlobalTextColor(textColorStr: String, fontSize: CGFloat) {
        var sizeFont = fontSize
        if fontSize < 6 || fontSize > 40 { sizeFont = 16 }
//        let nav = UINavigationBar.appearance(whenContainedInInstancesOf: [BKNavigationController.self])
        let nav = UINavigationBar.appearance()
        // 设置导航栏颜色
        nav.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(hex: textColorStr),
                                   NSAttributedStringKey.font:UIFont.systemFont(ofSize: sizeFont)]
    }
    
    
    /// 设置导航栏左返回按钮图片
    ///
    /// - Parameter img: 左返回按钮图片
    class func setGlobalLeftBackButtonImage(img: UIImage?) {
        
//        let navBar = UINavigationBar.appearance(whenContainedInInstancesOf: [BKNavigationController.self])
        // 如果你不把图片的渲染模式改变为origin，左返回按钮会根据你导航栏的tintcolor还是barcolor来变化的
        let originImg = img?.withRenderingMode(.alwaysOriginal)
        let navBar = UINavigationBar.appearance()
        // 设置左返回按钮
        if #available(iOS 11.0, *) {
            navBar.backIndicatorImage = originImg
            navBar.backIndicatorTransitionMaskImage = originImg
        }else {
            let backButtonImage = originImg?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0))
            let barButtonItem = UIBarButtonItem.appearance()
            barButtonItem.setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
            barButtonItem.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for: .default)
        }
    }
    
    
    /// 设置导航栏下的黑线
    ///
    /// - Parameter img: 传入image
    class func setNaviShadowImage(img: UIImage?) {
        let originImg = img?.withRenderingMode(.alwaysOriginal)
        let navBar = UINavigationBar.appearance()
        navBar.shadowImage = originImg
    }
}
