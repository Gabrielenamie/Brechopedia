//
//  BrechoCollectionViewController.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 22/07/21.
//

import UIKit
import Foundation

class Brechos{
    static var brecholist: [BrechoData] = [
        BrechoData(images: UIImage(named: "ineed1.png")!, title: "I Need Brechó", endereço: "Endereço: Rua Francisco Leitão, 713, São Paulo", description: "O I Need Brechó nasceu com propósito de dar um novo ciclo de vida para as peças, algumas das peças são trazidas de outros países malas com muita informação de moda e muito carinho em cada garimpo.  \n\n Horário de funcionamento: \n Segunda à sábado: 11 às 18hrs"),
        BrechoData( images: UIImage(named: "gato1.png")!, title: "Brechó Gato Preto", endereço: "Endereço: Rua Augusta, 1371 - Sobreloja 20, São Paulo", description: "Brechó conceito com uma enorme variedade de peças além de acessórios e calçados muito estilosos, trazendo estilo para os clientes de forma sustentátel. \n\n Horário de funcionamento: \n Segunda à sexta: 11 às 19hrs \n Sábado: 12 às 18 hrs"),
        BrechoData( images:UIImage(named: "rua1.png")!, title: "Rua da Saudade Brechó", endereço: "Endereço: Rua João Crudo, 165, Osasco", description: "Com a logo: A saudade é uma roupa que me veste! O brechó explora os estilos old school, vintage e retrô procurando trazendo uma seleção de peças únicas. \n\n Horário de funcionamento: \n Segunda à sábado: 10 às 19hrs"),
        BrechoData( images: UIImage(named: "villa.png")!, title: "Luz da Villa", endereço: "Endereço: Rua Áurea, 422, São Paulo", description: "O Luz da Villa é um microverso cultural inspirador, onde cada canto dessa casa, conta uma história. Resgatando a moda com um olhar além e costurando o passado ao futuro. O brechó trabalha com peças novas, usadas, acessórios, cosméticos, decoração e o que mais fizer sentido.\n\n Horário de funcionamento: \n Segunda à sábado: 10 às 17hrs"),
        BrechoData( images:UIImage(named: "vo1.png")!, title: "Brechó Vó Judith", endereço: "Endereço: Rua Cayowaá, 2304, São Paulo", description: "O Brechó Vó Judith é moda reciclada. Mais que estar na moda, quem compra no brechó faz a sua moda. Entre os adeptos: retrôs, vintages e descolados. No brechó é possível encontrar preciosidades como Dior, Prada, Marc Jacobs, Versace e muito mais. \n\n Horário de funcionamento: \n Segunda à sábado: 10 às 18hrs \n Aos domingos: 10 às 15 hrs"),
        BrechoData( images:UIImage(named: "asa1.png")!, title: "Asa Brechó", endereço: "Endereço: Rua dos Pinheiros, 972, São Paulo", description: "Asa Brechó é um brechó criado pela Associação Santo Agostinho, uma organização sem fins lucrativos e que possui como valor o compromisso com a transformação pessoal e social.No brechó você encontra de móveis a roupas e calçados, tendo uma enorme variedade. \n\n Horário de funcionamento: \n Segunda à sexta: 09 às 18hrs\n Aos sábados: 09 às 14:30 hrs"),
        BrechoData( images:UIImage(named: "brecholle.png")!, title: "Brechollé", endereço: "Endereço: Rua Carlos Camargo Aranha, 175, São Paulo", description: "Brechó cheio de peças modernas e autênticas, o Brechollé procura trazer para os clientes um atendimento único em um ambiente harmonioso e muito agradável! \n\n Horário de funcionamento: \n Segunda à sexta: 10 às 19 hrs\n Aos sábados: 10 às 16 hrs"),
        BrechoData( images:UIImage(named: "colmeia.png")!, title: "Brechó Colméia", endereço: "Endereço: Largo do Arouche, 438, São Paulo", description: "Brechó Colméia possui uma curadoria íncrivel, sendo um espaço desenvolvido por conjunto de brechós, assim o cliente encontra de tudo no brechó desde peças de roupas à itens de decoração. \n\n Horário de funcionamento: \n Segunda à sábado: 11 às 19hrs"),
        BrechoData( images:UIImage(named: "B.luxo.png")!, title: "B.Luxo", endereço: "Endereço: Rua Augusta, 2294-sala 22, São Paulo", description: "Um dos brechós mais influentes no Vintage Shop do Brasil, ponto de peças vintages garimpadas geralmente dos EUA, tendo como objetivo ressignificar algo que já está no mercado há tempos, desenvolvendo assim o consumo consciente tão importante nos dias de hoje. \n\n Horário de funcionamento: \n Segunda à sábado: 11 às 19 hrs")
    ]
    static func fetchFav() -> [BrechoData]{
        for brecho in Brechos.brecholist{
            brecho.fav = UserDefaults.standard.bool(forKey: brecho.title)
        }
        return Brechos.favs
        
    }
    static var favs: [BrechoData] {
        Brechos.brecholist.filter(\.fav)
    }
}

class BrechoCollectionViewController: UIViewController {
    
    let myView = BrechoView()
   // let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        self.navigationItem.title = "Brechós"
        myView.backgroundColor = .systemBackground
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        //configureSearchController()
        scrollViewWillBeginDecelerating(myView.collectionView)
        
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y > 0{
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.barTintColor = .systemBackground
            
        } else {
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.barTintColor = .systemBackground
        }
    }
    
}

extension BrechoCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return Brechos.brecholist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BrechoCell
        //cell.
        cell.brechoPicture.image = Brechos.brecholist[indexPath.row].images
        cell.titleBrechos.text = Brechos.brecholist[indexPath.row].title
        cell.adressBrechos.text = Brechos.brecholist[indexPath.row].adress
        cell.descriptionBrechos.text = Brechos.brecholist[indexPath.row].description
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        PopUpBrechoViewController.brechoIndex = indexPath.row
        performSegue(withIdentifier: "PopUpBrechoViewController", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PopUpBrechoViewController,
              let index = sender as? Int else {
            return
            }
        vc.brecho = Brechos.brecholist[index]
        vc.brechoslist = Brechos.brecholist
        
    }
}





