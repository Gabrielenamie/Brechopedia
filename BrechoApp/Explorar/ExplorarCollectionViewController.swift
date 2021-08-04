//
//  ExplorarCollectionViewController.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 23/07/21.
//

import UIKit
import Foundation

class ExplorarCollectionViewController: UIViewController {
    
    let myView = ExplorarView()
    var explorarlist = [ExplorarData]()
    var searching = false
    var searchedExplorar = [ExplorarData]()
    let searchController = UISearchController(searchResultsController: nil)
    let colorlist = ExplorarCell().colors
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = myView
        
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        let explorar1 = ExplorarData(  title: "O que é moda sustentável?", description: "A moda sustentável é uma vertente que se preocupa em utilizar métodos que não produzam ou minimizem os impactos ambientais gerados no processo de desenvolvimento de produtos.\n\n Ela surgiu da necessidade de repensar a conduta da nossa sociedade, do ponto de vista ecológico. Da etapa de produção de tecidos ao consumo desenfreado e descarte de peças usadas, a humanidade tem extraído grande quantidade de recursos naturais não renováveis, poluído e degradado a natureza, sem se preocupar com as consequências disso.")
        explorarlist.append(explorar1)
        let explorar2 = ExplorarData( title: "Brechó X Bazar", description: "Os bazares, geralmente, são locais mais bagunçados, com de peças amontoadas mesmo, porque não há seleção. O bazar pode ser em um espaço fixo em ponto comercial ou também pode ser feito em casas, garagens, igrejas e associações. Normalmente, em bazares, as peças são muito baratas, a partir de R$ 1 ou R$ 5.\n\nJá os brechós são mais organizados, funcionam como lojas fixas. Os donos de brechó têm um cuidado para selecionar as melhores peças, que passam por uma curadoria e até parecem novas, por isso são mais caras que roupas de bazar, mas ainda assim são peças mais baratas que de lojas convencionais.\n\nSe você nunca comprou de segunda mão, aventure-se e viva essa nova experiência.Além de ajudar o meio ambiente, você gasta menos e reforça o seu estilo próprio.")
        explorarlist.append(explorar2)
        let explorar3 = ExplorarData(  title: "Tipos de brechós", description: "Brechó de luxo:Foca em peças de grife a preços mais acessíveis.\n\nBrechó moderno:Esse tipo de brechó traz roupas de coleções atuais, expostas em ambientes clean.\n\nBrechó vintage:As roupas vendidas são peças de coleções antigas, raridades, focam no estilo retrô.\n\nBrechó de antiguidades: Mantém uma característica marcante de manter o estilo vintage, esses brechós geralmente tem peças para alugar para editoriais etc.\n\nBrechó tudo misturado:Aquele brechó com uma baguncinha e que não tem um estilo de peça único, atraindo variados tipos de clientes.")
        explorarlist.append(explorar3)
        let explorar4 = ExplorarData( title: "Sem preconceito!", description: "Apesar de soarem antiquados e coisas do passado para alguns, brechós, sebos e topa-tudo estão mais na moda do que nunca, sobretudo entre os jovens e após a pandemia.\n\nA conscientização principalmente das gerações Y e Z a respeito do impacto ambiental negativo deste setor e a consolidação das mídias sociais como oportunidade de consumo transformaram o desapego em tendência fashion.\n\nCom isso, o universo dos brechós se expandiu muito nos últimos tempos e pouco a pouco vem caindo no gosto das pessoas na hora de decidir comprar uma roupa nova, independente da classe social, e dos interesses que variam desde a procura por marcas famosas até a economia na aquisição de “novos” produtos.")
        explorarlist.append(explorar4)
        let explorar5 = ExplorarData( title: "Como aderir ao consumo consciente?", description: "1. Preste atenção no que você compra: consumir produtos orgânicos é bom para o meio ambiente.\n\n2. Observe de quem você compra: privilegie as marcas perto de você, apoiando pequenas empresas.\n\n3. Prefira empresas comprometidas com o desenvolvimento sustentável: que medidas a empresa toma para, por exemplo, reduzir o impacto ambiental de suas operações ou desenvolver a comunidade local? Qual a origem dos produtos?\n\n4.Fuja do plástico de uso único: Assim, você ajuda a reduzir a quantidade sacos plásticos no lixo e nos oceanos.Somente 7% do lixo plástico é reciclado.\n\n5.Compre menos: comece repensando se você realmente precisa de algo ou apenas deseja os produtos que consome.")
        explorarlist.append(explorar5)
        let explorar6 = ExplorarData( title: "Por que comprar em brechós?", description: "- Sustentabilidade: Consumir peças já existentes, aumentando ao máximo o ciclo de uso e de existência de uma peça é uma forma de praticar o consumo sustentável.\n\n- Preços acessíveis: Seja uma peça de luxo ou não, comprar peças usadas quase sempre será mais em conta que novas. \n\n- Investimento: Algumas peças vintage ou retrô, como bolsas de luxo clássicas, costumam nunca perder o valor e ficam até mais caras com o passar do tempo.\n\n- Exclusividade: Raramente você encontrará por aí alguém com a mesma roupa que você.\n\n- Aprendizado: Entrar em brechós é sempre uma aula!Mesmo que não seja para comprar, passear pelas araras batendo papo com os atendentes é uma verdadeira aula de história da moda.")
        explorarlist.append(explorar6)
        
        self.navigationItem.title = "Explorar"
        myView.backgroundColor = .systemBackground
        myView.collectionView.delegate = self
        myView.collectionView.dataSource = self
        configureSearchController()
        scrollViewWillBeginDecelerating(myView.collectionView)
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y > 0{
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
    }
    
    
    
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Pesquisar Assunto"
    }
}

extension ExplorarCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate,UISearchResultsUpdating, UISearchBarDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if searching{
            return searchedExplorar.count
        } else{
            return explorarlist.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExplorarCell
        let color = colorlist[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.backgroundColor = color
        if searching{
            //cell.myImage.image = UIImage(named: searchedBrechos[indexPath.row].gameImage)
            cell.titleExplorar.text = searchedExplorar[indexPath.row].title
            cell.descripcionExplorar.text = searchedExplorar[indexPath.row].description
        }else{
            cell.titleExplorar.text = explorarlist[indexPath.row].title
            cell.descripcionExplorar.text = explorarlist[indexPath.row].description
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfRowsInSection section: Int) -> Int {
        return colorlist.count
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty
        {
            searching = true
            searchedExplorar.removeAll()
            for explorar in explorarlist{
                if  explorar.title.lowercased().contains(searchText.lowercased()){
                    searchedExplorar.append(explorar)
                }
            }
        }else {
            searching = false
            searchedExplorar.removeAll()
            searchedExplorar = explorarlist
        }
        myView.collectionView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedExplorar.removeAll()
        myView.collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailsExplorarViewController()
 
        if searching{
            //cell.myImage.image = UIImage(named: searchedBrechos[indexPath.row].gameImage)
            vc.myView.titleExplorar.text = searchedExplorar[indexPath.row].title
            vc.myView.descriptionExplorar.text = searchedExplorar[indexPath.row].description
        }else{
            vc.myView.titleExplorar.text = explorarlist[indexPath.row].title
            vc.myView.descriptionExplorar.text = explorarlist[indexPath.row].description
        }
        
        self.performSegue(withIdentifier: "conexao", sender: indexPath.row)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DetailsExplorarViewController
        if searching{
            //cell.myImage.image = UIImage(named: searchedBrechos[indexPath.row].gameImage)
            vc?.myView.titleExplorar.text = searchedExplorar[sender as? Int ?? 0].title
            vc?.myView.descriptionExplorar.text = searchedExplorar[sender as? Int ?? 0].description
        }else{
            vc?.myView.titleExplorar.text = explorarlist[sender as? Int ?? 0].title
            vc?.myView.descriptionExplorar.text = explorarlist[sender as? Int ?? 0].description
        }
    }
}


