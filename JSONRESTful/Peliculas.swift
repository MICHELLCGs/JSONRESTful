//
//  Peliculas.swift
//  JSONRESTful
//
//  Created by Michell Condori on 10/06/24.
//

import Foundation
struct Peliculas:Decodable{
    let usuarioId:Int
    let id:Int
    let nombre:String
    let genero:String
    let duracion:String
    
}
