//
//  BrechoView.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 20/07/21.
//

import UIKit



class FavoritosView: UIView {
    
    //Config passos
    
    let BrechosLabel = UILabel()
    var screenSize = UIScreen.main.bounds
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 150, right: 50)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 170
        layout.minimumLineSpacing = 170
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(FavoritosCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(BrechosLabel)
        addSubview(collectionView)
        
        // Config Collection View
        
        collectionView.backgroundColor = .clear
        let collectionViewConstraints: [NSLayoutConstraint] = [
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant:self.bounds.height * 0.2),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10 ),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ]
        NSLayoutConstraint.activate(collectionViewConstraints)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


