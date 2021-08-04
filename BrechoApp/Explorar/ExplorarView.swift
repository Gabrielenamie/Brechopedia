//
//  ExplorarView.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 23/07/21.
//

import UIKit

    struct ExplorarData {
        //var image: UIImage
        var title: String
        var description: String
    }

    class ExplorarView: UIView {
        
        //Config passos

        let explorarLabel = UILabel()
       
        let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 100, right: 50)
            layout.itemSize = CGSize(width: 336, height: 155)
            layout.minimumInteritemSpacing = 25
            layout.minimumLineSpacing = 25
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.register(ExplorarCell.self, forCellWithReuseIdentifier: "cell")
            return cv
        }()
        
        override init(frame: CGRect) {
            super.init(frame: UIScreen.main.bounds)
            backgroundColor = #colorLiteral(red: 0.9928911328, green: 0.9641671777, blue: 0.9425173402, alpha: 1)
        
            addSubview(explorarLabel)
            addSubview(collectionView)
            
            //layoutSubviews
            

            // Config Collection View
            
            collectionView.backgroundColor = .clear
            let collectionViewConstraints: [NSLayoutConstraint] = [
                collectionView.topAnchor.constraint(equalTo: topAnchor, constant: self.bounds.height * 0.22),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 90)
            ]
            NSLayoutConstraint.activate(collectionViewConstraints)
            
        }
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
        }

    }


