//
//  Fichas.swift
//  DominoGame
//
//  Created by Emiliano Medina on 26/03/23.
//

import Foundation
import UIKit

struct nomFicha{
    var numRigth: String
    var numLeft: String
}

struct Ficha {
    var nombre:nomFicha
    var imagen : UIImage
}


var Fichas: [Ficha] = [
    Ficha(nombre: nomFicha(numRigth: "6", numLeft: "6"), imagen: UIImage(named: "6-6")!),
    Ficha(nombre: nomFicha(numRigth: "6", numLeft: "5"), imagen: UIImage(named: "6-5")!),
    Ficha(nombre: nomFicha(numRigth: "6", numLeft: "4"), imagen: UIImage(named: "6-4")!),
    Ficha(nombre: nomFicha(numRigth: "6", numLeft: "3"), imagen: UIImage(named: "6-3")!),
    Ficha(nombre: nomFicha(numRigth: "6", numLeft: "2"), imagen: UIImage(named: "6-2")!),
    Ficha(nombre: nomFicha(numRigth: "6", numLeft: "1"), imagen: UIImage(named: "6-1")!),
    
    Ficha(nombre: nomFicha(numRigth: "5", numLeft: "5"), imagen: UIImage(named: "5-5")!),
    Ficha(nombre: nomFicha(numRigth: "5", numLeft: "4"), imagen: UIImage(named: "5-4")!),
    Ficha(nombre: nomFicha(numRigth: "5", numLeft: "3"), imagen: UIImage(named: "5-3")!),
    Ficha(nombre: nomFicha(numRigth: "5", numLeft: "2"), imagen: UIImage(named: "5-2")!),
    Ficha(nombre: nomFicha(numRigth: "5", numLeft: "1"), imagen: UIImage(named: "5-1")!),
    
    Ficha(nombre: nomFicha(numRigth: "4", numLeft: "4"), imagen: UIImage(named: "4-4")!),
    Ficha(nombre: nomFicha(numRigth: "4", numLeft: "3"), imagen: UIImage(named: "4-3")!),
    Ficha(nombre: nomFicha(numRigth: "4", numLeft: "2"), imagen: UIImage(named: "4-2")!),
    Ficha(nombre: nomFicha(numRigth: "4", numLeft: "1"), imagen: UIImage(named: "4-1")!),
    
    Ficha(nombre: nomFicha(numRigth: "3", numLeft: "3"), imagen: UIImage(named: "3-3")!),
    Ficha(nombre: nomFicha(numRigth: "3", numLeft: "2"), imagen: UIImage(named: "3-2")!),
    Ficha(nombre: nomFicha(numRigth: "3", numLeft: "1"), imagen: UIImage(named: "3-1")!),
    
    Ficha(nombre: nomFicha(numRigth: "2", numLeft: "2"), imagen: UIImage(named: "2-2")!),
    Ficha(nombre: nomFicha(numRigth: "2", numLeft: "2"), imagen: UIImage(named: "2-1")!),
    
    Ficha(nombre: nomFicha(numRigth: "1", numLeft: "1"), imagen: UIImage(named: "1-1")!),
    
    Ficha(nombre: nomFicha(numRigth: "blanca", numLeft: "6"), imagen: UIImage(named: "blanca-6")!),
    Ficha(nombre: nomFicha(numRigth: "blanca", numLeft: "5"), imagen: UIImage(named: "blanca-6")!),
    Ficha(nombre: nomFicha(numRigth: "blanca", numLeft: "4"), imagen: UIImage(named: "blanca-6")!),
    Ficha(nombre: nomFicha(numRigth: "blanca", numLeft: "3"), imagen: UIImage(named: "blanca-6")!),
    Ficha(nombre: nomFicha(numRigth: "blanca", numLeft: "2"), imagen: UIImage(named: "blanca-6")!),
    Ficha(nombre: nomFicha(numRigth: "blanca", numLeft: "1"), imagen: UIImage(named: "blanca-6")!),
    Ficha(nombre: nomFicha(numRigth: "blanca", numLeft: "blanca"), imagen: UIImage(named: "blanca-blanca")!),

]
