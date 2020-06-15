//
//  MarvelAPI.swift
//  marvel-heroes
//
//  Created by Henrique Batista on 10/06/20.
//  Copyright © 2020 Henrique Batista. All rights reserved.
//

import UIKit
import Alamofire


class MarvelAPI: NSObject {
    let parameters = [
        "ts": "1591826816",
        "apikey": "b815a3497d58dc3785f469c00b91967f",
        "hash": "ddf8722a163a4f4b0b9238cad6c36a39",
        "limit":"80"
    ]
    let urlBase: String = "http://gateway.marvel.com/v1/public/characters"
    
    func buscarHerois(completion: @escaping() -> Void){
        guard let url = URL(string: urlBase) else { return }
        AF.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    if let json = try response.result.get() as? Dictionary<String, Any> {
                        if let jsonData = json["data"] as? Dictionary<String, Any> {
                            guard let listaDicionario = jsonData["results"] as? Array<Dictionary<String, Any>> else {return}
                            var listaHerois: Array<Heroi> = []
                            
                            for item in listaDicionario {
                                listaHerois.append(HeroDAO().toHero(dicionario: item))
                            }
                            HeroDAO().save(listaHerois)
                            completion()
                        }
                    }
                } catch {
                    print("ERRO ao converter!")
                    completion()
                }
                break
            case .failure:
                print("Erro: \(String(describing: response.error))")
                break
            }
        }
    }
}
