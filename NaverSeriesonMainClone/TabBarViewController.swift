//
//  TabBarViewController.swift
//  NaverSeriesonMainClone
//
//  Created by 박현우 on 2022/05/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
    }
    
    private func setTabBar() {
        self.tabBar.backgroundColor = .black
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .systemGray3
    }
}
