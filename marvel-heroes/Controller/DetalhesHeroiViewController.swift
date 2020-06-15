//
//  DetalhesHeroiViewController.swift
//  marvel-heroes
//
//  Created by Henrique Batista on 10/06/20.
//  Copyright © 2020 Henrique Batista. All rights reserved.
//

import UIKit
import AlamofireImage

class DetalhesHeroiViewController: UIViewController {

    var heroi: Heroi!
    var name: String = ""
    let formatoImagem: String = "/standard_amazing.jpg"
    
    @IBOutlet weak var imageHeroi: UIImageView!
    @IBOutlet weak var labelNomeHeroi: UILabel!
    @IBOutlet weak var labelDescricaoHeroi: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        let pathImage = heroi.thumbnail + formatoImagem
        guard let imageUrl = URL(string: pathImage) else { return }
        imageHeroi.af.setImage(withURL: imageUrl)
        
        labelNomeHeroi.text = heroi.name
        labelDescricaoHeroi.text = heroi.heroDescription
    }

}
