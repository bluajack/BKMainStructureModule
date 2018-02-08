//
//  BKTabBar.swift
//  BKMainStructureModule
//
//  Created by Tinghui Yuan on 2018/1/3.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit

class BKTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        if newWindow != nil {
            // 设置背景图片
//            backgroundImage = UIImage(color: .white, size: CGSize(width: self.bounds.size.width, height: self.bounds.size.height))
        }
    }
    
    /// 设置TabBarItem的title属性
    ///
    /// - Parameters:
    ///   - normalColorStr: 未选中颜色
    ///   - selectedColorStr: 选中字体颜色
    ///   - fontSize: 字体大小
    class func setGlobalTabBarItemTitleAttributes(normalColorStr: String, selectedColorStr: String, fontSize: CGFloat) {
        let titleDic = [NSAttributedStringKey.foregroundColor: UIColor(hex: normalColorStr),
                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)]
        let titleDic_s = [NSAttributedStringKey.foregroundColor: UIColor(hex: selectedColorStr),
                        NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)]
//        let tabBarItem = UITabBarItem.appearance(whenContainedInInstancesOf: [BKTabBarController.self])
        let tabBarItem = UITabBarItem.appearance()
        tabBarItem.setTitleTextAttributes(titleDic, for: .normal)
        tabBarItem.setTitleTextAttributes(titleDic_s, for: .selected)
        
    }
    
    
    /// 设置TabBar背景颜色
    ///
    /// - Parameter image: 设置图片
    class func setTabBarBackGroundImage(image: UIImage?) {
        let tabBar = UITabBar.appearance()
        tabBar.backgroundImage = image
    }
    
}

extension BKTabBar {
    func setup() {
        // 去除黑线
//        barStyle = .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
