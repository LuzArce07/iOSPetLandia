//
//  Veterinaria.swift
//  Petlandia
//
//  Created by Alumno on 11/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Veterinaria {
    
    var nombreVeterinaria : String
    var horario : String
    var urlImagenLocal : String
    
    init(nombreVeterinaria : String, horario : String, urlImagenLocal : String) {
        
        self.nombreVeterinaria = nombreVeterinaria
        self.horario = horario
        self.urlImagenLocal = urlImagenLocal
        
    }
    
    init(diccionarioVeterinaria : NSDictionary) {
        
        self.urlImagenLocal = ""
        self.nombreVeterinaria = ""
        self.horario = ""
        
        if let acf = diccionarioVeterinaria.value(forKey: "acf") as? NSDictionary {
            
            if let urlImagenLocal = acf.value(forKey: "imagen_del_local") as? String {
                
                self.urlImagenLocal = "https://wadopcionveterinaria.azurewebsites.net/\(urlImagenLocal)"
                
            }
            
            if let nombreVeterinaria = acf.value(forKey: "nombre_de_la_veterinaria") as? String {
                
                self.nombreVeterinaria = nombreVeterinaria
                
            }
            
            if let horario = acf.value(forKey: "horario") as? String {
                
                self.horario = horario
                
            }
            
            
            
        }
        
    }
    
    
    
}
