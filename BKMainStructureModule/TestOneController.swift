//
//  TestOneController.swift
//  BKMainStructureModule
//
//  Created by Tinghui Yuan on 2018/1/3.
//  Copyright © 2018年 Tinghui Yuan. All rights reserved.
//

import UIKit

class TestOneController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "测试1"
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(TestFourController(), animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
