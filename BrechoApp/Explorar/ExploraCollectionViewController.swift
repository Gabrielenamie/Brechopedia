//
//  ExploraCollectionViewController.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 23/07/21.
//

import Foundation
import UIKit

class ExploraCollectionViewController: UIViewController {
    
    let myView = ExplorarView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        
        
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        
     

  
    }
//
//    @objc func popViewController() {
//        navigationController?.popViewController(animated: true)
//    }
//
//    @objc func changeViewController(_ sender: UIButton!) {
//        switch sender.tag {
//            case 0:
//                navigationController?.pushViewController(ExplorarViewController(), animated: true)
//            case 1:
//                // navigationController?.pushViewController(SaturationGameViewController(), animated: true)
//                return
//            case 2:
//                // navigationController?.pushViewController(BrightnessGameViewController(), animated: true)
    //                return
    //            default:
    //                return
    //        }
    //    }
    }



    extension ExploraCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 335, height: 155)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExplorarCell
        cell.explorarData = myView.explorarData[indexPath.row]
//        cell.passosBotao.addTarget(self, action: #selector(changeViewController), for: .touchUpInside)
        return cell
    }
    
}
