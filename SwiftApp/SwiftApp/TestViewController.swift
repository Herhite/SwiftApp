//
//  TestViewController.swift
//  SwiftApp
//
//  Created by quhong1v1 on 2022/3/11.
//

import UIKit

class TestViewController: ZABaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "二级页面"
        view.backgroundColor = .brown
        addNavBar(.cyan)
    }
}
