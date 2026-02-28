//
//  Person.swift
//  frontend_meneses
//
//  Created by Américo MQ on 27/02/26.
//

import Foundation

struct Person: Identifiable, Codable {
    var id: Int?
    var nombre: String
    var apellido: String
    var fechaNacimiento: String
    var puesto: String
    var sueldo: Double
}
