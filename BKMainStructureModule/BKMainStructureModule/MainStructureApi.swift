//
//  MainStructureApi.swift
//  BKMainStructureModule
//
//  Created by Tinghui Yuan on 2018/1/3.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit

 public class MainStructureApi: NSObject {
    
    public static var rootTabBarVC: UITabBarController {
        return BKTabBarController.shared
    }
    static var statusBarStyle: UIStatusBarStyle = .lightContent
    
    /// 改变BKNavigationController对应的导航栏的状态
    ///
    /// - Parameter style: UIStatusBarStyle
    public class func changeNavStatusBarStyle(style: UIStatusBarStyle) {
        statusBarStyle = style
        BKTabBarController.shared.setNeedsStatusBarAppearanceUpdate()
    }
    
    /// 添加子控制器
    ///
    /// - Parameters:
    ///   - vc: 需要添加的控制器(包装成导航栏)
    ///   - normalImgName: 正常图片名
    ///   - selectedImgName: 选中图片名
    ///   - isNeedNavController: 标题
    public class func addChildVC(vc: UIViewController, title: String, normalImgName: String, selectedImgName: String, isNeedNavController: Bool) {
        BKTabBarController.shared.addChildVC(vc: vc, title: title, normalImgName: normalImgName, selectedImgName: selectedImgName, isNeedNavController: isNeedNavController)
    }
    
    /// 添加子控制器
    ///
    /// - Parameters:
    ///   - vc: 需要添加的控制器(包装成导航栏)
    ///   - title: 标题
    ///   - normalImage: 正常图片
    ///   - selectedImage: 选中图片
    ///   - isNeedNavController: 是否需要导航栏
    public class func addChildVC(vc: UIViewController, title: String, normalImage: UIImage?, selectedImage: UIImage?, isNeedNavController: Bool) {
        BKTabBarController.shared.addChildVC(vc: vc, title: title, normalImage: normalImage, selectedImage: selectedImage, isNeedNavController: isNeedNavController)
    }
    
    
    /// 设置全局导航栏背景图片
    ///
    /// - Parameter img: 背景图片
    public class func setGlobalBackgroundImage(img: UIImage?) {
        BKNavBar.setGlobalBackgroundImage(img: img)
    }
    
    /// 设置全局导航栏标题颜色以及字体大小
    ///
    /// - Parameters:
    ///   - textColor: 字体颜色
    ///   - fontSize: 字体大小
    public class func setGlobalTextColor(textColorStr: String, fontSize: CGFloat) {
        BKNavBar.setGlobalTextColor(textColorStr: textColorStr, fontSize: fontSize)
    }
    
    /// 设置导航栏左返回按钮图片
    ///
    /// - Parameter img: 左返回按钮图片
    public class func setGlobalLeftBackButtonImage(img: UIImage?) {
        BKNavBar.setGlobalLeftBackButtonImage(img: img)
    }
    
    /// 设置TabBarItem的title属性
    ///
    /// - Parameters:
    ///   - normalColorStr: 未选中颜色
    ///   - selectedColorStr: 选中字体颜色
    ///   - fontSize: 字体大小
    public class func setGlobalTabBarItemTitleAttributes(normalColorStr: String, selectedColorStr: String, fontSize: CGFloat) {
        BKTabBar.setGlobalTabBarItemTitleAttributes(normalColorStr: normalColorStr, selectedColorStr: selectedColorStr, fontSize: fontSize)
    }
    
    /// 设置导航栏下的黑线
    ///
    /// - Parameter img: 传入image
    public class func setNaviShadowImage(img: UIImage?) {
        BKNavBar.setNaviShadowImage(img: img)
    }
    
    
    /// 设置TaBar背景图片
    ///
    /// - Parameter img: 设置图片
    public class func setTabBarBackGroundImage(img: UIImage?) {
        BKTabBar.setTabBarBackGroundImage(image: img)
    }
    
    /// 把view转换为image
    ///
    /// - Parameters:
    ///   - view: 要转换的view
    ///   - size: view的尺寸
    /// - Returns: 返回image
    public class func getImage(withView view: UIView, size: CGSize) -> UIImage? {
        return self.generateImage(withView: view, size: size)
    }
}
