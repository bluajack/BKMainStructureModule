//
//  BKNavigationController.swift
//  BKMainStructureModule
//
//  Created by Tinghui Yuan on 2018/1/3.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit

open class BKNavigationController: UINavigationController {
    
    fileprivate static let onceToken = "bluajack"
    fileprivate var isPushing: Bool = false
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.delegate = self
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        defaultConfigNavBar()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // 解决iOS 11 左返回文字隐藏问题
        UIViewController.perpareSwizzLifeCycle()
    }
    
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.isPushing {
//            print("拦截")
            return
        }else {
            self.isPushing = true
        }
        
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        // 适配iPhoneX
        guard var frame = tabBarController?.tabBar.frame else {return}
        frame.origin.y = UIScreen.main.bounds.size.height - frame.size.height
        tabBarController?.tabBar.frame = frame
    }
    
    // 设置状态栏 (单独设置某个控制器的navigationBar.barStyle，可以改变其状态栏)
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return MainStructureApi.statusBarStyle
    }
    // (告诉系统不要调用我自己的preferredStatusBarStyle)
//    override var childViewControllerForStatusBarStyle: UIViewController? {
//        return topViewController
//    }
    
}

extension BKNavigationController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        self.isPushing = false
    }
}

// MARK:- 配置navbar
extension BKNavigationController {
    
    func defaultConfigNavBar() {
        DispatchQueue.once(token: BKNavigationController.onceToken) {
            let navBar = UINavigationBar.appearance()
            navBar.barTintColor = UIColor(hex: "#f55848")
            navBar.tintColor = UIColor.white // tintColor影响整个navBar的颜色
            navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
            
            // 设置左返回按钮
            if #available(iOS 11.0, *) {
                let backButtonImage = UIImage(named: "back_white")
                navBar.backIndicatorImage = backButtonImage
                navBar.backIndicatorTransitionMaskImage = backButtonImage
            }else {
                let backButtonImage = UIImage(named: "back_white")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0))
                let barButtonItem = UIBarButtonItem.appearance()
                barButtonItem.setBackButtonBackgroundImage(backButtonImage, for: .normal, barMetrics: .default)
                barButtonItem.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for: .default)
            }
        }
    }
}

