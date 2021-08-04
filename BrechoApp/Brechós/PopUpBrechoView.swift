//
//  PopUpBrechoView.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 22/07/21.
//

import UIKit

class PopUpBrechoView: UIView {
    let titleBrechos = UILabel()
    let adressBrechos = UILabel()
    let brechoPicture = UIImageView()
    let descriptionBrechos = UILabel()
    let buttonFav = UIButton()
    let heart = UIImage(systemName: "heart")
    var brechoIndex : Int = 0
    let paragraph = NSMutableParagraphStyle()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(self.titleBrechos)
        self.addSubview(self.adressBrechos)
        self.addSubview(self.descriptionBrechos)
        self.addSubview(self.buttonFav)
        self.addSubview(self.brechoPicture)
        
        //Config Título
        
        titleBrechos.textColor = #colorLiteral(red: 0, green: 0.352968514, blue: 0.1789174676, alpha: 1)
        titleBrechos.self.font = UIFont.systemFont(ofSize: 28.0, weight: .semibold)
        titleBrechos.translatesAutoresizingMaskIntoConstraints = false

        adressBrechos.textColor = #colorLiteral(red: 0, green: 0.352968514, blue: 0.1789174676, alpha: 1)
        adressBrechos.numberOfLines = 0
        adressBrechos.self.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        adressBrechos.translatesAutoresizingMaskIntoConstraints = false
        
        //Config Descrição
        
        descriptionBrechos.textColor = #colorLiteral(red: 0, green: 0.352968514, blue: 0.1789174676, alpha: 1)
        descriptionBrechos.self.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
        paragraph.alignment = .natural
        descriptionBrechos.numberOfLines = 0
        descriptionBrechos.translatesAutoresizingMaskIntoConstraints = false

        brechoPicture.translatesAutoresizingMaskIntoConstraints = false
        brechoPicture.contentMode = .scaleAspectFill
        
        buttonFav.translatesAutoresizingMaskIntoConstraints = false
        buttonFav.setImage(heart, for: .normal)
        buttonFav.setTitleColor(#colorLiteral(red: 0, green: 0.3529114127, blue: 0.1788584292, alpha: 1), for: .normal)
        buttonFav.imageView?.tintColor = #colorLiteral(red: 0, green: 0.3529114127, blue: 0.1788584292, alpha: 1)
        buttonFav.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        buttonFav.layer.cornerRadius = 10

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        brechoPicture.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.bounds.height * -0.6).isActive = true
        brechoPicture.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        brechoPicture.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        titleBrechos.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.42).isActive = true
        titleBrechos.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        titleBrechos.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        adressBrechos.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.47).isActive = true
        adressBrechos.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        adressBrechos.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        descriptionBrechos.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.54).isActive = true
        descriptionBrechos.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        descriptionBrechos.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20).isActive = true
        
        buttonFav.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 25).isActive = true
        buttonFav.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20).isActive = true
        buttonFav.topAnchor.constraint(equalTo: topAnchor, constant: self.bounds.height * 0.86).isActive = true
    }
}




