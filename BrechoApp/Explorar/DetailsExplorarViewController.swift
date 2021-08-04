//
//  DetailsExplorarViewController.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 23/07/21.
//

import UIKit

class DetailsExplorarViewController: UIViewController, UIGestureRecognizerDelegate {
    let myView = DetailsExplorarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = myView
        myView.backgroundColor = #colorLiteral(red: 0.8953674436, green: 0.9518613219, blue: 0.8891765475, alpha: 1)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.backItem?.title = "Explorar"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if wilmove {
            hidesBottomBarWhenPushed = false
        }
        wilmove = false
    }
    var wilmove = false
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        wilmove = true
        if !isViewLoaded {
            hidesBottomBarWhenPushed = true
        }
    }
}

