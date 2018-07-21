//
//  Personagem.swift
//  LigaDaJustica
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import UIKit

class Personagem: NSObject, NSCoding {
    var nome: String!
    var imagem:String!
    var poder: Bool! = nil
    var nota: Int!
    
    init(nome: String, imagem:String, poder:Bool, nota:Int){
        self.nome = nome
        self.imagem = imagem
        self.poder = poder
        self.nota = nota
    }
    required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as! String
        self.imagem = aDecoder.decodeObject(forKey: "imagem") as! String
        self.poder = aDecoder.decodeObject(forKey: "poder") as! Bool
        self.nota = aDecoder.decodeObject(forKey: "nota")as! Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nome, forKey:"nome")
        aCoder.encode(self.imagem, forKey: "imagem")
        aCoder.encode(self.poder, forKey: "poder")
        aCoder.encode(self.nota, forKey: "nota")
    }
    
    override var description: String{
        return "Heroi: \(self.nome!) Nota: \(self.nota!)"
    }
}
