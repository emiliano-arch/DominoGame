//
//  libs.swift
//  DominoGame
//
//  Created by Emiliano Medina on 26/03/23.
//

import Foundation
import UIKit



/// ocurltar ficha sirve para que la ficha que se selecciona de la "mano", debe desaparecer al ser tocada
/// - Parameters:
///   - ficha: Ficha que va a desaparecer
///   - botonDeFicha: Boton que esta encima de la foto de la ficha
func ocultarFicha(ficha: UIImageView, botonDeFicha: UIButton){
    ficha.isHidden = true
    botonDeFicha.isHidden = true
}

/// desocurltar ficha sirve para que cuando comas una nueva ficha, aparesca en pantalla
/// - Parameters:
///   - ficha: Ficha que va a aparecer
///   - botonDeFicha: Boton que esta encima de la foto de la ficha
func desocultarFicha(ficha: UIImageView, botonDeFicha: UIButton){
    ficha.isHidden = false
    botonDeFicha.isHidden = false
}

/// seleccionarFicha sirve para poner la ficha de la mano, al contenedor de las fichas en la "mesa", esta función invoca a "ocultarFicha"
/// - Parameters:
///   - imagenContenedor: es el contenedor de la "mesa" donde se va a poner la ficha
///   - imagenAPoner: Es la imagen que se selccionó de la "mano"

func seleccionarFicha(imagenContenedor : UIImageView,imagenAPoner : UIImageView, botonDeFicha: UIButton ) {
    imagenContenedor.isHidden = false
    imagenContenedor.image = imagenAPoner.image
    ocultarFicha(ficha: imagenAPoner, botonDeFicha: botonDeFicha)
    
}

/// haveSpaceInHand sirve para validar si el participante o la maquina tiene espacio suficiente en la mano para poder comer
/// - Parameters:
///   - fichas: Es un arreglo de UIImageView que es equivalente a los espacios que se tienen en la mano
///   - botonComer: Es el boton que se utiliza para comer fichas
/// - Returns: Regresa un valor falso -> si NO hay espacio en la mano(por lo cual NO puede comer)
///            Regresa un valor Verdadero -> si hay espacio en la mano(por lo cual SI puede comer)
func haveSpaceInHand(fichas: [UIImageView], botonComer: UIButton)-> Bool{
    var bandera: Bool = false
    for ficha in fichas{
        //si la ficha NO esta oculta, regresamos falso
        if (!ficha.isHidden){
            botonComer.setTitle("No puedes comer, estas lleno", for: .normal)
            bandera = false
        // si la ficha SI esta oculta, entonces si podemos comer
        }else{
            bandera = true
        }
    }
    return bandera
}

/// Remueve la ficha que ya no se debe de encontrar en el arreglo enviado
/// - Parameter fichasEnMesa: son las fichas que quedan en la mesa para poder comer
/// - Returns: regresa el arreglo con 1 elemento menos (siempre se remueve el primer elemento)
func removeFichainMesa(fichasEnMesa: [Ficha]) -> [Ficha]{
    var array = fichasEnMesa
    array.remove(at: 0)
    print("-----------ARRAY---------------")
    print(array)
    return array
}


/// Asigna las fichas a las imagenes de quien corresponda
/// - Parameters:
///   - mano: Son las imagenes que aparecen en la pantalla
///   - fichasParaElJuego: Es un arreglo de fichas que se van a usar en el juego
/// - Returns: un Arreglo de arreglos de fichas, donde en [0] son las fichasRestantes y en [1] las fichas asignadas
func asignarFichas(mano: [UIImageView], fichasParaElJuego: [Ficha]) -> [[Ficha]] {
    var fichasRestantes: [Ficha] = fichasParaElJuego
    var fichasAsignadas: [Ficha] = []
    var i = 0
    
    for ficha in mano{
        if (i < 7){
            ficha.image = fichasRestantes[0].imagen
            fichasAsignadas.append(fichasRestantes[0])
            fichasRestantes.remove(at: 0)
            i += 1
        }
        
    }
    
    return [ fichasRestantes, fichasAsignadas]
    
}


/// Voltea relativamente las fichas para que el juegador no pueda ver la mano del oponente
/// - Parameter mano: arreglo de UIImageView que son los que controla el oponente
func voltearFichasOponente(mano: [UIImageView]){
    
    for ficha in mano{
        ficha.image = UIImage(named: "ficha-detras")
        
    }
}


/// Ordena la "mano" de quien reciba, poniendo todos los elementos en orden numerico
/// - Parameters:
///   - mano: array de UIImageView
///   - fichas: array de las fichas a ordenar
func reordenarMano(mano:[UIImageView] ,botones:[UIButton] , fichas: [Ficha]){
    var i = 0
    for ficha in mano{
        if (i < fichas.count){
            ficha.isHidden = false
            botones[i].isHidden = false
            ficha.image = fichas[i].imagen
            i += 1
        } else {
            ficha.isHidden = true
            if (i < botones.count){
                botones[i].isHidden = true
                i += 1
            }
        }
    }
    
}




//MARK: validaciones en el juego

func tirarPrimerFicha(manoJugador: [Ficha], manoOponente:[Ficha], contenedorImagen: UIImageView) -> [String:[Ficha]] {
    
    var i = 6
    var arrayToReturn : [Ficha]
    var ficha: Ficha
    var indiceEncontrado : Int
    
    while i > 0 {
        indiceEncontrado = buscarFicha(mano: manoJugador, nombreFicha: nomFicha(numRigth: "\(i)", numLeft: "\(i)"))
        
        if (indiceEncontrado != -1){
            arrayToReturn = manoJugador
            //tirar la ficha
            contenedorImagen.isHidden = false
            contenedorImagen.image = manoJugador[indiceEncontrado].imagen
            ficha = manoJugador[indiceEncontrado]
            arrayToReturn.remove(at: indiceEncontrado)
            
            arrayToReturn.append(ficha)
            return ["manoJugador":arrayToReturn]
            
        }
        
        indiceEncontrado = buscarFicha(mano: manoOponente, nombreFicha: nomFicha(numRigth: "\(i)", numLeft: "\(i)"))
        
        if (indiceEncontrado != -1){
            arrayToReturn = manoOponente
            contenedorImagen.isHidden = false
            contenedorImagen.image = manoOponente[indiceEncontrado].imagen
            ficha = manoJugador[indiceEncontrado]
            arrayToReturn.remove(at: indiceEncontrado)
            arrayToReturn.append(ficha)
            
            return ["manoOponente":arrayToReturn]
            
        }
        
        i = i - 1
    }
    
    indiceEncontrado = buscarFicha(mano: manoJugador, nombreFicha: nomFicha(numRigth: "blanca", numLeft: "blanca"))
    
    if (indiceEncontrado != -1){
        
        arrayToReturn = manoJugador
        //tirar la ficha
        contenedorImagen.isHidden = false
        contenedorImagen.image = manoJugador[indiceEncontrado].imagen
        ficha = manoJugador[indiceEncontrado]
        arrayToReturn.remove(at: indiceEncontrado)
        arrayToReturn.append(ficha)
        
        return ["manoJugador":arrayToReturn]
        
    }
    
    indiceEncontrado = buscarFicha(mano: manoOponente, nombreFicha: nomFicha(numRigth: "blanca", numLeft: "blanca"))
    
    if (indiceEncontrado != -1){
        arrayToReturn = manoOponente
        //tirar la ficha
        contenedorImagen.isHidden = false
        contenedorImagen.image = manoJugador[indiceEncontrado].imagen
        ficha = manoJugador[indiceEncontrado]
        arrayToReturn.remove(at: indiceEncontrado)
        arrayToReturn.append(ficha)
        
        return ["manoOponente":arrayToReturn]
    } else {
        //el jugador 1 pone la ultima ficha en su arreglo
        arrayToReturn = manoJugador
        //tirar la ficha
        contenedorImagen.isHidden = false
        contenedorImagen.image = manoJugador[-1].imagen
        ficha = manoJugador[indiceEncontrado]
        arrayToReturn.removeLast()
        arrayToReturn.append(ficha)
        return ["manoJugador":arrayToReturn]
    }
    
    
}

func buscarFicha(mano: [Ficha], nombreFicha: nomFicha) -> Int{
    var index = 0
    for ficha in mano{
        if (ficha.nombre.numLeft == nombreFicha.numLeft && ficha.nombre.numRigth == nombreFicha.numRigth){
            return index
            
        }
        index = index + 1
    }
    return -1
    
}

func sePuedePoner(fichaRight: Ficha, fichaLeft: Ficha, fichaPorPoner: Ficha) -> String{
    
    if(fichaLeft.nombre.numLeft == fichaPorPoner.nombre.numLeft){
        return "fichaLeft"
        
    } else if( fichaRight.nombre.numRigth == fichaPorPoner.nombre.numRigth){
        return "fichaRight"
        
    }
    return "default"
    
}


