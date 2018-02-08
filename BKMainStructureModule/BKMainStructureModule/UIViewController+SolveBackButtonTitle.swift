//
//  UIViewController+SolveBackButtonTitle.swift
//  BKMainStructureModule
//
//  Created by Tinghui Yuan on 2018/1/4.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    fileprivate static let token = "swizzLifeCycle"
    
    static func perpareSwizzLifeCycle() {
        DispatchQueue.once(token: token) {
            let viewDidLoadSeletor = #selector(viewDidLoad)
            let viewDidLoadModifyBackButtonSeletor = #selector(modifyBackButton_viewDidLoad)
            self.swizzleInstanceSelector(oldSel: viewDidLoadSeletor, newSel: viewDidLoadModifyBackButtonSeletor)
        }
    }
    
    @objc func modifyBackButton_viewDidLoad() {
        self.modifyBackButton_viewDidLoad()
        if #available(iOS 11.0, *) {
            /** UIBarButtonItem类似于model
             *  Class UIBarButtonItem {
             *      var title, target, action
             *  }
             *  系统的backBarButton 通过backBarButtonItem模型来设置其属性
             */
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
}
