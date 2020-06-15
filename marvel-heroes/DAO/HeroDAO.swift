//
//  HeroDAO.swift
//  marvel-heroes
//
//  Created by Henrique Batista on 09/06/20.
//  Copyright © 2020 Henrique Batista. All rights reserved.
//

import UIKit

class HeroDAO: NSObject {
    
    func save(_ herois: [Heroi]) {
        guard let caminho = getCaminho() else { return }
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: herois, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func recuperaHerois() -> [Heroi] {
        guard let caminho = getCaminho() else { return []}
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let heroisSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Heroi> else { return []}
            
            return heroisSalvos
        } catch {
            return []
        }
    }
    
    private func getCaminho() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        let caminho = diretorio.appendingPathComponent("herois")
        return caminho
    }
    
    
    func getHeroes(completion: @escaping(_ listaHerois: Array<Heroi>) -> Void){
        var listaHerois = recuperaHerois()
        
        if listaHerois.count == 0 {
            MarvelAPI().buscarHerois {
                listaHerois = self.recuperaHerois()
                completion(listaHerois)
            }
        } else {
            completion(listaHerois)
        }
    }
    
    func toHero(dicionario: Dictionary<String, Any>) -> Heroi {
        let id = dicionario["id"] as! Int
        let name = dicionario["name"] as! String
        let thumbnailDictionary = dicionario["thumbnail"] as! Dictionary<String,Any>
        let thumbnail = thumbnailDictionary["path"] as! String
        let descicao = dicionario["description"] as! String
        let heroDescription: String
        
        if descicao.count > 0 {
            heroDescription = descicao
        } else {
            heroDescription = "Sem Descricão"
        }
        
        return Heroi(id: id, name: name, heroDescription: heroDescription, thumbnail: thumbnail)
    }
}
