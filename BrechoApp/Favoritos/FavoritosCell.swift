//
//  BrechoCell.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 20/07/21.
//

import UIKit

class FavoritosCell: UICollectionViewCell {
    let brechos = UIView()
    let titleBrechos = UILabel()
    let adressBrechos = UILabel()
    let descripcionBrechos = UILabel()
    let brechoPicture1 = UIImageView()
    var brechosData: BrechoData? {
        didSet {
            guard let brechosData = brechosData else { return }
            brechoPicture1.image = brechosData.images
            titleBrechos.text = brechosData.title
            adressBrechos.text = brechosData.adress
            descripcionBrechos.text = brechosData.description
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(brechos)
        contentView.addSubview(brechoPicture1)
        contentView.addSubview(titleBrechos)
        contentView.addSubview(adressBrechos)
        contentView.addSubview(descripcionBrechos)
        
        
        //Config Título
        
        titleBrechos.textColor = #colorLiteral(red: 0, green: 0.352968514, blue: 0.1789174676, alpha: 1)
        titleBrechos.self.font = UIFont.systemFont(ofSize: 25.0, weight: .medium)
        
        titleBrechos.translatesAutoresizingMaskIntoConstraints = false
        let tituloBrechosConstraints: [NSLayoutConstraint] = [
            titleBrechos.topAnchor.constraint(equalTo: brechos.topAnchor, constant: 180),
            titleBrechos.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 50),
            titleBrechos.leadingAnchor.constraint(equalTo: brechos.leadingAnchor, constant: 20),
            titleBrechos.trailingAnchor.constraint(equalTo: brechos.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(tituloBrechosConstraints)
        
        adressBrechos.textColor = #colorLiteral(red: 0, green: 0.352968514, blue: 0.1789174676, alpha: 1)
        adressBrechos.self.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        //enderecoBrechos.backgroundColor = .blue
        
        adressBrechos.translatesAutoresizingMaskIntoConstraints = false
        let enderecoBrechosConstraints: [NSLayoutConstraint] = [
            adressBrechos.topAnchor.constraint(equalTo: titleBrechos.bottomAnchor),
            adressBrechos.bottomAnchor.constraint(equalTo: descripcionBrechos.topAnchor),
            adressBrechos.leadingAnchor.constraint(equalTo: brechos.leadingAnchor, constant: 20),
            adressBrechos.trailingAnchor.constraint(equalTo: brechos.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(enderecoBrechosConstraints)
        
        //Config Descrição
        
        descripcionBrechos.textColor = #colorLiteral(red: 0, green: 0.352968514, blue: 0.1789174676, alpha: 1)
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .natural
        descripcionBrechos.attributedText = NSAttributedString(string: "String",attributes: [.paragraphStyle: paragraph])
        descripcionBrechos.self.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        descripcionBrechos.numberOfLines = 0
        //descricaoBrechos.backgroundColor = .red
        
        descripcionBrechos.translatesAutoresizingMaskIntoConstraints = false
        let descricaoBrechosConstraints: [NSLayoutConstraint] = [
            descripcionBrechos.topAnchor.constraint(equalTo: brechos.bottomAnchor, constant: -60),
            descripcionBrechos.bottomAnchor.constraint(equalTo: brechos.bottomAnchor, constant: -5),
            descripcionBrechos.leadingAnchor.constraint(equalTo: titleBrechos.leadingAnchor),
            descripcionBrechos.trailingAnchor.constraint(equalTo: brechos.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(descricaoBrechosConstraints)
        
        //Config passos
        
        brechos.backgroundColor = #colorLiteral(red: 0.8953674436, green: 0.9518613219, blue: 0.8891765475, alpha: 1)
        brechos.contentMode = .scaleAspectFill
        brechos.clipsToBounds = true
        brechos.layer.cornerRadius = 10
        brechos.translatesAutoresizingMaskIntoConstraints = false
        let backgroundConstraints: [NSLayoutConstraint] = [
            brechos.topAnchor.constraint(equalTo: contentView.topAnchor),
            brechos.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            brechos.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            brechos.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            brechos.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 135),
            //brechos.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ]
        NSLayoutConstraint.activate(backgroundConstraints)
        
        //Config foto
        
        brechoPicture1.translatesAutoresizingMaskIntoConstraints = false
        brechoPicture1.contentMode = .scaleAspectFill
        brechoPicture1.layer.cornerRadius = self.frame.height / 2
        brechoPicture1.layer.cornerRadius = 10
        brechoPicture1.clipsToBounds = true
        //fotoBrecho1.frame = CGRect(x: 10, y: 20, width: 100, height: 50)
        let fotoBrecho1Constraints: [NSLayoutConstraint] = [
            brechoPicture1.topAnchor.constraint(equalTo: brechos.topAnchor, constant: 15),
            brechoPicture1.bottomAnchor.constraint(equalTo: brechos.bottomAnchor, constant: -120),
            brechoPicture1.leadingAnchor.constraint(equalTo: brechos.leadingAnchor, constant: 15),
            brechoPicture1.trailingAnchor.constraint(equalTo: brechos.trailingAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(fotoBrecho1Constraints)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


