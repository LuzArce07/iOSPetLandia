//
//  Adopcion.swift
//  Petlandia
//
//  Created by Luz Arce on 11/21/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Adopcion{
    
    var urlImagenMascota : String
    var nombreMascota : String
    var urlImagenAlimento : String
    var color : String
    var edad : String
    var nacimiento : String
    var vacunas : String
    var esterilizacion : String
    var tamaño : String
    var personalidad : String
    
    init(urlImagenMascota : String, nombreMascota : String, urlImagenAlimento : String, color : String, edad : String, nacimiento : String, vacunas : String, esterilizacion : String, tamaño : String, personalidad : String) {
        
        self.urlImagenMascota = urlImagenMascota
        self.nombreMascota = nombreMascota
        self.urlImagenAlimento = urlImagenAlimento
        self.color = color
        self.edad = edad
        self.nacimiento = nacimiento
        self.vacunas = vacunas
        self.esterilizacion = esterilizacion
        self.tamaño = tamaño
        self.personalidad = personalidad
        
    }
    
    init(diccionarioAdopcion : NSDictionary) {
    
    self.urlImagenMascota = ""
    self.nombreMascota = ""
    self.urlImagenAlimento = ""
    self.color = ""
    self.edad = ""
    self.nacimiento = ""
    self.vacunas = ""
    self.esterilizacion = ""
    self.tamaño = ""
    self.personalidad = ""
    
    
        if let acf = diccionarioAdopcion.value(forKey: "acf") as? NSDictionary {
            
            
            if let urlImagenMascota = acf.value(forKey: "imagen_de_la_mascota") as? String {
                
                self.urlImagenMascota = "https://wadopcionveterinaria.azurewebsites.net/\(urlImagenMascota)"
                
            }
            
            if let nombreMascota = acf.value(forKey: "nombre_de_la_mascota") as? String {
                
                self.nombreMascota = nombreMascota
                
            }
            
            if let urlImagenAlimento = acf.value(forKey: "alimento") as? String {
                
                self.urlImagenAlimento = "https://wadopcionveterinaria.azurewebsites.net/\(urlImagenAlimento)"
                
            }
            
            if let color = acf.value(forKey: "color") as? String {
                
                self.color = color
                
            }
            
            if let edad = acf.value(forKey: "edad_de_la_mascota") as? String {
                
                self.edad = edad
                
            }
            
            if let nacimiento = acf.value(forKey: "nacimiento") as? String {
                
                self.nacimiento = nacimiento
                
            }
            
            if let vacunas = acf.value(forKey: "vacunas") as? String {
                
                self.vacunas = vacunas
                
            }
            
            if let esterilizacion = acf.value(forKey: "esterilizacion") as? String {
                
                self.esterilizacion = esterilizacion
                
            }
            
            if let tamaño = acf.value(forKey: "tamano") as? String {
                
                self.tamaño = tamaño
                
            }
            
            if let personalidad = acf.value(forKey: "personalidad") as? String {
                
                self.personalidad = personalidad
                
            }
            
        }
        
    }
    
}
