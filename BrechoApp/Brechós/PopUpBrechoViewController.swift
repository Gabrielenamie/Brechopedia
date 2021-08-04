//
//  PopUpBrechoViewController.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 22/07/21.
//

import UIKit

class PopUpBrechoViewController: UIViewController, UIGestureRecognizerDelegate {
    let defaults = UserDefaults.standard
    let myView = PopUpBrechoView()
    var brecho: BrechoData!
    let heartFill = UIImage(systemName: "heart.fill")
    let heart = UIImage(systemName: "heart")
    var favoritos : Bool = false
    static var brechoIndex : Int = -1
    var brechoslist : [BrechoData]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = myView
        
        favoritos = UserDefaults.standard.bool(forKey: brecho.title)
        myView.titleBrechos.text = brecho.title
        myView.descriptionBrechos.text = brecho.description
        myView.adressBrechos.text = brecho.adress
        myView.brechoPicture.image = brecho.images
        myView.backgroundColor = #colorLiteral(red: 0.8953674436, green: 0.9518613219, blue: 0.8891765475, alpha: 1)
        myView.buttonFav.addTarget(self, action: #selector(actFav), for: .touchUpInside)
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.backItem?.title = "Brechós"
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8953674436, green: 0.9518613219, blue: 0.8891765475, alpha: 1)
        
        setFavButton()
    }
    
    func setFavButton(){
        if defaults.bool(forKey: brecho.title) {
            myView.buttonFav.setTitle(" Favoritado!", for: .normal)
            myView.buttonFav.setImage(heartFill, for: .normal)
            
        } else{
            myView.buttonFav.setTitle(" Favoritar", for: .normal)
            myView.buttonFav.setImage(heart, for: .normal)
        }
    }
    
    @objc func actFav() {
        if favoritos{
            defaults.set(false, forKey: brecho.title)
        } else {
            defaults.set(true, forKey: brecho.title)
        }
        favoritos.toggle()
        brechoslist[PopUpBrechoViewController.brechoIndex].fav = favoritos
        setFavButton()
        
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


