//
//  ViewController.swift
//  marvel-heroes
//
//  Created by Henrique Batista on 09/06/20.
//  Copyright © 2020 Henrique Batista. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UISearchBarDelegate,
    UITableViewDataSource,
    UITableViewDelegate {

    // MARK: - Atributos
    var listaComTodosHerois: Array<Heroi> = []
    var listaHerois: Array<Heroi> = []
    var heroiSelecionado: Heroi?
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchHeroes: UISearchBar!
    @IBOutlet weak var heroesTableView: UITableView!
    @IBOutlet weak var headerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchHeroes.delegate = self
        heroesTableView.dataSource = self
        heroesTableView.delegate = self
        headerImage.image = UIImage(named: "img3.jpg")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buscarHerois()
    }
    
    // MARK: - Metodos
    func buscarHerois() {
        HeroDAO().getHeroes { (herois) in
            self.listaHerois = herois
            self.listaComTodosHerois = herois
            self.heroesTableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaHerois = searchText.isEmpty ? listaComTodosHerois : listaComTodosHerois.filter { $0.name.contains(searchText) }
        heroesTableView.reloadData()
        print(searchText)
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaHerois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaHeroi = tableView.dequeueReusableCell(withIdentifier: "cellHero", for: indexPath) as! TableViewCell
        let heroiAtual = listaHerois[indexPath.row]
        
        celulaHeroi.setup(heroiAtual)
        celulaHeroi.labelTitulo.text = heroiAtual.name
//        celulaHeroi.imagemHeroi.image = UIImage(named: heroiAtual.thumbnail)
        celulaHeroi.imagemHeroi.layer.cornerRadius = 10
        celulaHeroi.imagemHeroi.layer.masksToBounds = true
        return celulaHeroi
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 350
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        heroiSelecionado = listaHerois[indexPath.row]
        performSegue(withIdentifier: "IrParaDetalhes", sender: self)
        
        print(listaHerois[indexPath.row].name)
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetalhesHeroiViewController
        vc.heroi = heroiSelecionado
    }


}

