//
//  ExplorarCell.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 23/07/21.
//

import UIKit

class ExplorarCell: UICollectionViewCell {
    let explorar = UIView()
    let titleExplorar = UILabel()
    let descripcionExplorar = UILabel()
    var colors = [
        #colorLiteral(red: 0, green: 0.4624930024, blue: 0.2363761067, alpha: 1),
        #colorLiteral(red: 0, green: 0.4274509804, blue: 0.3254901961, alpha: 1),
        #colorLiteral(red: 0.2901960784, green: 0.568627451, blue: 0.3647058824, alpha: 1),
        #colorLiteral(red: 0.4039215686, green: 0.6431372549, blue: 0.3215686275, alpha: 1),
        #colorLiteral(red: 0, green: 0.6156341434, blue: 0.2993324697, alpha: 1),
        #colorLiteral(red: 0.4838650227, green: 0.7061498761, blue: 0.4998754263, alpha: 1),
        #colorLiteral(red: 0.6088862419, green: 0.9289067388, blue: 0.5071129203, alpha: 1),
        #colorLiteral(red: 0.3610961437, green: 0.6249133348, blue: 0.4256796241, alpha: 1),
        #colorLiteral(red: 0.3064766526, green: 0.6472666264, blue: 0.2692793906, alpha: 1),
        #colorLiteral(red: 0.6171156764, green: 0.7809431553, blue: 0.5047352314, alpha: 1)
    ]
    
    var explorarData: ExplorarData? {
        didSet {
            guard let explorarData = explorarData else { return }
            titleExplorar.text = explorarData.title
            descripcionExplorar.text = explorarData.description
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(explorar)
        contentView.addSubview(titleExplorar)
        contentView.addSubview(descripcionExplorar)
        
        
        
        //Config Título
        
        //tituloExplorar.backgroundColor = UIColor.blue
        titleExplorar.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleExplorar.numberOfLines = 0
        titleExplorar.self.font = UIFont.systemFont(ofSize: 30.0, weight: .medium)
        titleExplorar.textAlignment = .center
        titleExplorar.translatesAutoresizingMaskIntoConstraints = false
        let tituloPassoConstraints: [NSLayoutConstraint] = [
            titleExplorar.topAnchor.constraint(equalTo: explorar.topAnchor, constant: 20),
            titleExplorar.bottomAnchor.constraint(equalTo: explorar.bottomAnchor, constant: -10),
            titleExplorar.leadingAnchor.constraint(equalTo: explorar.leadingAnchor, constant: 10),
            titleExplorar.trailingAnchor.constraint(equalTo: explorar.trailingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(tituloPassoConstraints)
        
        //Config Descrição
        descripcionExplorar.textColor = #colorLiteral(red: 0.9928911328, green: 0.9641671777, blue: 0.9425173402, alpha: 1)
        descripcionExplorar.self.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
        descripcionExplorar.numberOfLines = 0
        descripcionExplorar.translatesAutoresizingMaskIntoConstraints = false
        let descricaoPassoConstraints: [NSLayoutConstraint] = [
            descripcionExplorar.topAnchor.constraint(equalTo: titleExplorar.bottomAnchor),
            descripcionExplorar.bottomAnchor.constraint(equalTo: explorar.bottomAnchor, constant: -10),
            descripcionExplorar.leadingAnchor.constraint(equalTo: titleExplorar.leadingAnchor),
            descripcionExplorar.trailingAnchor.constraint(equalTo: explorar.centerXAnchor, constant: 28)
        ]
        NSLayoutConstraint.activate(descricaoPassoConstraints)
        
        //Config explorar
        explorar.contentMode = .scaleAspectFill
        explorar.clipsToBounds = true
        explorar.layer.cornerRadius = 10
        explorar.translatesAutoresizingMaskIntoConstraints = false
        let backgroundConstraints: [NSLayoutConstraint] = [
            explorar.topAnchor.constraint(equalTo: contentView.topAnchor),
            explorar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            explorar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            explorar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(backgroundConstraints)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


