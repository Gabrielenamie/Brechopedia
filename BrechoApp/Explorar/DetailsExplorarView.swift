//
//  DetailsExplorarView.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 23/07/21.
//

import UIKit

class DetailsExplorarView: UIView {
    let titleExplorar = UILabel()
    let descriptionExplorar = UILabel()
    let paragraph = NSMutableParagraphStyle()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(self.titleExplorar)
        self.addSubview(self.descriptionExplorar)
    
        //Config Título
        
        titleExplorar.textColor = #colorLiteral(red: 0, green: 0.352968514, blue: 0.1789174676, alpha: 1)
        titleExplorar.textAlignment = .center
        titleExplorar.self.font = UIFont.systemFont(ofSize: 30.0, weight: .medium)
        titleExplorar.translatesAutoresizingMaskIntoConstraints = false
        titleExplorar.numberOfLines = 0
        
        
        //Config Descrição
        
        descriptionExplorar.textColor = #colorLiteral(red: 0, green: 0.352968514, blue: 0.1789174676, alpha: 1)
        paragraph.alignment = .justified
        descriptionExplorar.self.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
        descriptionExplorar.numberOfLines = 0
        descriptionExplorar.translatesAutoresizingMaskIntoConstraints = false
        descriptionExplorar.attributedText = NSAttributedString(string: "String",attributes: [.paragraphStyle: paragraph])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleExplorar.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.13).isActive = true
        titleExplorar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleExplorar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        
        descriptionExplorar.topAnchor.constraint(equalTo: self.topAnchor, constant: self.bounds.height * 0.27).isActive = true
        descriptionExplorar.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        descriptionExplorar.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20).isActive = true
        
    }
}


