//
//  TableViewCell.swift
//  marvel-heroes
//
//  Created by Henrique Batista on 09/06/20.
//  Copyright © 2020 Henrique Batista. All rights reserved.
//

import UIKit
import AlamofireImage

class TableViewCell: UITableViewCell {

    let formatoImagem = "/landscape_incredible.jpg"
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var imagemHeroi: UIImageView!

    
    func setup(_ heroi:Heroi) {
        let pathImage = heroi.thumbnail + formatoImagem
        guard let imageUrl = URL(string: pathImage) else { return }
        imagemHeroi.af.setImage(withURL: imageUrl)
    }
    
}
