//
//  TabBarViewController.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 22/07/21.
//

import UIKit

class TabBarViewController: UITabBarController {
    @IBOutlet weak var TabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.1056881323, green: 0.2348852456, blue: 0.1042859778, alpha: 1)
    }

}
