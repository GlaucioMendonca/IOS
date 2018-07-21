//
//  ViewController.swift
//  LigaDaJustica
//
//  Created by IFPB on 21/07/2018.
//  Copyright © 2018 IFPB. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfImagem: UITextField!
    @IBOutlet weak var swPoder: UISwitch!
    @IBOutlet weak var lbNota: UILabel!
    @IBOutlet weak var stNota: UIStepper!
    @IBOutlet weak var ivImagem: UIImageView!
    
    var pnome : String!
    var pimagem:String!
    var ppoder: Bool!
    var pnota:Int!
    
    var cadastro: Cadastro!
    var index: Int!
    
    
    
    @IBAction func preview(_ sender: Any) {
        
       self.downloadImage(self.tfImagem.text!, inView: self.ivImagem)
    }
    
    
    @IBAction func setNota(_ sender: Any) {
        self.lbNota.text = String(Int(self.stNota.value))
    }
    
    
    @IBAction func salvar(_ sender: Any) {
        let nota = lbNota.text
        let persona = Personagem(nome: tfNome.text!, imagem: tfImagem.text!, poder: swPoder.isOn, nota: Int(nota!)!)
        
        if(self.index != nil){
            print("update")
            cadastro.update(index: index, personagem: persona)
        }else{
            print("create")
            cadastro.add(personagem: persona)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.cadastro = delegate.cadastro
        
        if (self.index != nil){
            self.tfNome.text = self.pnome
            self.tfImagem.text = self.pimagem
            self.swPoder.setOn(self.ppoder, animated: true)
            self.lbNota.text = String(self.pnota)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadImage(_ uri : String, inView: UIImageView){
        
        let url = URL(string: uri)
        
        let task = URLSession.shared.dataTask(with: url!) {responseData,response,error in
            if error == nil{
                if let data = responseData {
                    
                    DispatchQueue.main.async {
                        inView.image = UIImage(data: data)
                    }
                    
                }else {
                    print("no data")
                }
            }else{
                print(error)
            }
        }
        
        task.resume()
        
    }

}

