//
//  BrechoView.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 20/07/21.
//

import UIKit

class BrechoData {
    var images: UIImage
    var title: String
    let adress: String
    var description: String
    var fav: Bool
    init(images:UIImage,title:String,endereço:String,description:String) {
        self.images = images
        self.title = title
        self.adress = endereço
        self.description = description
        self.fav = UserDefaults.standard.bool(forKey: title)
    }
}

class BrechoView: UIView {
    
    //Config passos
    
    let BrechosLabel = UILabel()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 336, height: 165)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 150, right: 50)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 150
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(BrechoCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = #colorLiteral(red: 0.9928911328, green: 0.9641671777, blue: 0.9425173402, alpha: 1)
        
        addSubview(BrechosLabel)
        addSubview(collectionView)
        
        
        // Config Collection View
        
        collectionView.backgroundColor = .clear
        let collectionViewConstraints: [NSLayoutConstraint] = [
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: self.bounds.height * 0.18),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


