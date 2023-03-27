//
//  ViewControllerTablero.swift
//  DominoGame
//
//  Created by Emiliano Medina on 26/03/23.
//

import UIKit
//MARK: - Inicialización de Outlets y variables
class ViewControllerTablero: UIViewController {

    @IBOutlet weak var imgPrimeraFicha: UIImageView!
    
    @IBOutlet weak var imgFichaLeft: UIImageView!
    
    @IBOutlet weak var imgFichaRigth: UIImageView!
    
    @IBOutlet weak var lblConteo: UILabel!
    
    

//MARK: - Inicialización de img fichas oponente
    
    
    @IBOutlet weak var imgOp1: UIImageView!
    
    @IBOutlet weak var imgOp2: UIImageView!
    
    @IBOutlet weak var imgOp3: UIImageView!
    
    @IBOutlet weak var imgOp4: UIImageView!
    
    @IBOutlet weak var imgOp5: UIImageView!
   
    @IBOutlet weak var imgOp6: UIImageView!
    
    @IBOutlet weak var imgOp7: UIImageView!
    
    @IBOutlet weak var imgOp8: UIImageView!
    
    @IBOutlet weak var imgOp9: UIImageView!
    
//MARK: - Inicialización de img fichas jugador
    
    
    @IBOutlet weak var imgJu1: UIImageView!
    
    @IBOutlet weak var imgJu2: UIImageView!
    
    @IBOutlet weak var imgJu3: UIImageView!
    
    @IBOutlet weak var imgJu4: UIImageView!
    
    @IBOutlet weak var imgJu5: UIImageView!
    
    @IBOutlet weak var imgJu6: UIImageView!
    
    @IBOutlet weak var imgJu7: UIImageView!
    
    @IBOutlet weak var imgJu8: UIImageView!
    
    @IBOutlet weak var imgJu9: UIImageView!
    
    //MARK: - Buttons outlets
    
    
    @IBOutlet weak var bt1: UIButton!
    
    @IBOutlet weak var bt2: UIButton!
    
    @IBOutlet weak var bt3: UIButton!
    
    @IBOutlet weak var bt4: UIButton!
    
    @IBOutlet weak var bt5: UIButton!
    
    @IBOutlet weak var bt6: UIButton!
    
    @IBOutlet weak var bt7: UIButton!
    
    @IBOutlet weak var bt8: UIButton!
    
    @IBOutlet weak var bt9: UIButton!
    
    
    //MARK: - actions
    
    
    
    @IBAction func comerFicha(_ sender: Any) {
        if (!fichasJugador.isEmpty && !fichasEnMesa.isEmpty && fichasJugador.count < 9){
            fichasJugador.append(fichasEnMesa[0])
            fichasEnMesa.remove(at: 0)
            lblConteo.text = "Quedan: \(fichasEnMesa.count) fichas para comer"
            reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
        }
    }
    
    
    
    
    //MARK: - actions de fichas
    
    
    @IBAction func select1(_ sender: Any) {
        
        if (fichasJugador.count > 0){
            
            if(FichaLeft.nombre.numLeft == "" && FichaRight.nombre.numRigth == ""){
                
                let temp = sePuedePoner(fichaRight: FichaCentral, fichaLeft: FichaCentral, fichaPorPoner: fichasJugador[0])
                
                switch (temp){
                case "fichaLeft":
                    seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu1, botonDeFicha: bt1)
                    fichasJugador.remove(at: 0)
                    reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
                    desocultarFicha(ficha: imgJu1, botonDeFicha: bt1)
                    break
                case "fichaRight":
                    seleccionarFicha(imagenContenedor: imgFichaRigth, imagenAPoner: imgJu1, botonDeFicha: bt1)
                    fichasJugador.remove(at: 0)
                    reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
                    desocultarFicha(ficha: imgJu1, botonDeFicha: bt1)
                    break
                    
                default:
                    lblConteo.text = "No puedes poner esa ficha"
                }
                
            } else {
                let temp = sePuedePoner(fichaRight: FichaRight, fichaLeft: FichaLeft, fichaPorPoner: fichasJugador[0])
                switch (temp){
                case "fichaLeft":
                    seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu1, botonDeFicha: bt1)
                    fichasJugador.remove(at: 0)
                    reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
                    desocultarFicha(ficha: imgJu1, botonDeFicha: bt1)
                    break
                case "fichaRight":
                    seleccionarFicha(imagenContenedor: imgFichaRigth, imagenAPoner: imgJu1, botonDeFicha: bt1)
                    fichasJugador.remove(at: 0)
                    reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
                    desocultarFicha(ficha: imgJu1, botonDeFicha: bt1)
                    break
                    
                default:
                    lblConteo.text = "No puedes poner esa ficha"
                }
            }
            
            
            
            
            
            
            
        } else if (fichasJugador.isEmpty){
            imgJu1.image = UIImage(named: "winner")
            imgJu2.image = UIImage(named: "winner")
            imgJu3.image = UIImage(named: "winner")
        }
        
    }
        
    
    @IBAction func select2(_ sender: Any) {
        if (fichasJugador.count > 1){
            seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu2, botonDeFicha: bt2)
            fichasJugador.remove(at: 1)
            reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
            desocultarFicha(ficha: imgJu2, botonDeFicha: bt2)
        }
    }
    
    @IBAction func select3(_ sender: Any) {
        if (fichasJugador.count > 2){
            seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu3, botonDeFicha: bt3)
            fichasJugador.remove(at: 2)
            reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
            desocultarFicha(ficha: imgJu3, botonDeFicha: bt3)
        }
    }
    
    @IBAction func select4(_ sender: Any) {
        if (fichasJugador.count > 3){
            seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu4, botonDeFicha: bt4)
            fichasJugador.remove(at: 3)
            reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
            desocultarFicha(ficha: imgJu4, botonDeFicha: bt4)
        }
    }
    
    @IBAction func select5(_ sender: Any) {
        if (fichasJugador.count > 4){
            seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu5, botonDeFicha: bt5)
            fichasJugador.remove(at: 4)
            reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
            desocultarFicha(ficha: imgJu5, botonDeFicha: bt5)
        }
    }
    
    @IBAction func select6(_ sender: Any) {
        if (fichasJugador.count > 5){
            seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu6, botonDeFicha: bt6)
            fichasJugador.remove(at: 5)
            reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
            desocultarFicha(ficha: imgJu6, botonDeFicha: bt6)
        }
    }
    
    @IBAction func select7(_ sender: Any) {
        if (fichasJugador.count > 6){
            seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu7, botonDeFicha: bt7)
            fichasJugador.remove(at: 6)
            reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
            desocultarFicha(ficha: imgJu7, botonDeFicha: bt7)
        }
    }
    
    @IBAction func select8(_ sender: Any) {
        if (fichasJugador.count > 7){
            seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu8, botonDeFicha: bt8)
            fichasJugador.remove(at: 7)
            reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
            desocultarFicha(ficha: imgJu8, botonDeFicha: bt8)
        }
    }
    
    @IBAction func select9(_ sender: Any) {
        if (fichasJugador.count > 8){
            seleccionarFicha(imagenContenedor: imgFichaLeft, imagenAPoner: imgJu9, botonDeFicha: bt9)
            fichasJugador.remove(at: 8)
            reordenarMano(mano: [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu8,imgJu9], botones: [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9], fichas: fichasJugador)
            desocultarFicha(ficha: imgJu9, botonDeFicha: bt9)
        }
    }
    

    
    //MARK: - Variables
    var fichasEnMesa : [Ficha] = Fichas
    var fichasOponente : [Ficha] = []
    var fichasJugador : [Ficha] = []
    var FichaCentral : Ficha = Ficha(nombre: nomFicha(numRigth: "", numLeft: ""), imagen: UIImage(named: "ficha-detras")!)
    
    var FichaLeft : Ficha = Ficha(nombre: nomFicha(numRigth: "", numLeft: ""), imagen: UIImage(named: "ficha-detras")!)
    
    var FichaRight : Ficha = Ficha(nombre: nomFicha(numRigth: "", numLeft: ""), imagen: UIImage(named: "ficha-detras")!)
    
    
}


//MARK: - Actions and control of the game
extension ViewControllerTablero{
 
    override func viewDidLoad() {
        super.viewDidLoad()
        fichasEnMesa = fichasEnMesa.shuffled()
        
        let arrayOp : [UIImageView] = [imgOp1,imgOp2,imgOp3,imgOp4,imgOp5,imgOp6,imgOp7,imgOp8,imgOp9]
        let arrayJu : [UIImageView] =  [imgJu1,imgJu2,imgJu3,imgJu4,imgJu5,imgJu6,imgJu7,imgJu9,imgJu9]
        
        let arrayBtn : [UIButton] = [bt1,bt2,bt3,bt4,bt5,bt6,bt7,bt8,bt9]
        
        var temp = asignarFichas(mano: arrayJu, fichasParaElJuego: fichasEnMesa)
        
        fichasEnMesa = temp[0]
        fichasJugador = temp[1]
        temp = []
        
        temp = asignarFichas(mano: arrayOp, fichasParaElJuego: fichasEnMesa)
        
        fichasEnMesa = temp[0]
        fichasOponente = temp[1]
        
        temp = []
        
        imgFichaLeft.image = FichaLeft.imagen
        imgFichaRigth.image = FichaRight.imagen
        
        let tempDic = tirarPrimerFicha(manoJugador: fichasJugador, manoOponente: fichasOponente, contenedorImagen: imgPrimeraFicha)
        print(tempDic)
        
        
        if let manoOponente = tempDic["manoOponente"] {
            print("---------------")
            print("mano oponente")
            fichasOponente = manoOponente
            FichaCentral = fichasOponente.removeLast()
            print(fichasOponente)
        }
        
        if let manoJugador = tempDic["manoJugador"] {
            print("---------------")
            print("mano jugador")
            fichasJugador = manoJugador
            FichaCentral = fichasJugador.removeLast()
            
            print(fichasOponente)
        }
        
        
        reordenarMano(mano: arrayOp, botones: arrayBtn, fichas: fichasOponente)
        
        reordenarMano(mano: arrayJu, botones: arrayBtn, fichas: fichasJugador)
        lblConteo.text = "Quedan: \(fichasEnMesa.count) fichas para comer"
        //voltearFichasOponente(mano: [imgOp1,imgOp2,imgOp3,imgOp4,imgOp5,imgOp6,imgOp7])
        
        // Do any additional setup after loading the view.
    }
    
    
}
