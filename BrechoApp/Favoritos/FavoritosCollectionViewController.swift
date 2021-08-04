//
//  FavoritosCollectionViewController.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 24/07/21.
//

import UIKit

class FavoritosCollectionViewController: UIViewController,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITextFieldDelegate {
    
    let myView = FavoritosView()
    var brechosFav = Brechos.favs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        self.navigationItem.title = "Favoritos"
        myView.backgroundColor = .systemBackground
        scrollViewWillBeginDecelerating(myView.collectionView)
    }
    override func viewWillAppear(_ animated: Bool) {
        brechosFav = Brechos.fetchFav()
        myView.collectionView.reloadData()
    }
        func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y > 0{
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
    //MARK: Classe Pai
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brechosFav.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavoritosCell
        cell.brechosData = brechosFav[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 335, height: 165)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        PopUpBrechoViewController.brechoIndex = indexPath.row
        self.performSegue(withIdentifier: "conexaoFav", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PopUpBrechoViewController,
              let index = sender as? Int else {
            return
            }
        vc.brecho = Brechos.favs[index]
        vc.brechoslist = Brechos.favs
    }
}
    
    




