//
//  AppDelegate.swift
//  BKMainStructureModule
//
//  Created by Tinghui Yuan on 2018/1/3.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window?.rootViewController = MainStructureApi.rootTabBarVC
        MainStructureApi.addChildVC(vc: TestOneController(), title: "测试1", normalImgName: "testone_n", selectedImgName: "testone_s", isNeedNavController: true)
        MainStructureApi.addChildVC(vc: TestTwoController(), title: "测试2", normalImgName: "testtwo_n", selectedImgName: "testtwo_s", isNeedNavController: true)
        MainStructureApi.addChildVC(vc: TestThreeController(), title: "测试3",  normalImgName: "testthree_n", selectedImgName: "testthree_s", isNeedNavController: true)
        MainStructureApi.addChildVC(vc: TestFourController(), title: "测试4", normalImgName: "testfour_n", selectedImgName: "testfour_s", isNeedNavController: true)
        
        MainStructureApi.setGlobalTabBarItemTitleAttributes(normalColorStr: "#bfbfbf", selectedColorStr: "#f55848", fontSize: 10)
//        MainStructureApi.setGlobalTextColor(textColorStr: "#bfbfbf", fontSize: 10)
//        MainStructureApi.setGlobalBackgroundImage(img: UIImage(color: UIColor.black, size: CGSize(width: 414, height: 64)))
        MainStructureApi.changeNavStatusBarStyle(style: .default)
//        MainStructureApi.setGlobalLeftBackButtonImage(img: UIImage(named: "testfour_n"))
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0.5))
        view.backgroundColor = .blue
        MainStructureApi.setNaviShadowImage(img: MainStructureApi.getImage(withView: view, size: view.bounds.size))
        
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

