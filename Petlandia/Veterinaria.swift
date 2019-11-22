//
//  Veterinaria.swift
//  Petlandia
//
//  Created by Luz Arce on 11/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Veterinaria {
    
    var nombreVeterinaria : String
    var horario : String
    var urlImagenLocal : String
    
    var direccion : String
    var veterinario : String
    var urlFotoVeterinario : String
    var email : String
    var telefono : String
    var ciudad : String
    var urgencias : String
    
    
    init(nombreVeterinaria : String, horario : String, urlImagenLocal : String, direccion : String, veterinario : String, urlFotoVeterinario : String, email : String, telefono : String, ciudad : String, urgencias : String) {
        
        self.nombreVeterinaria = nombreVeterinaria
        self.horario = horario
        self.urlImagenLocal = urlImagenLocal
        
        self.direccion = direccion
        self.veterinario = veterinario
        self.urlFotoVeterinario = urlFotoVeterinario
        self.email = email
        self.telefono = telefono
        self.ciudad = ciudad
        self.urgencias = urgencias
        
    
        
    }
    
    init(diccionarioVeterinaria : NSDictionary) {
        
        self.urlImagenLocal = ""
        self.nombreVeterinaria = ""
        self.horario = ""
        self.direccion = ""
        self.veterinario = ""
        self.urlFotoVeterinario = ""
        self.email = ""
        self.telefono = ""
        self.ciudad = ""
        self.urgencias = ""
        
        
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
            
            if let direccion = acf.value(forKey: "direccion") as? String {
                
                self.direccion = direccion
                
            }
            
            if let veterinario = acf.value(forKey: "veterinario") as? String {
                
                self.veterinario = veterinario
                
            }
            
            if let urlFotoVeterinario = acf.value(forKey: "foto_veterinario") as? String {
                
                self.urlFotoVeterinario = "https://wadopcionveterinaria.azurewebsites.net/\(urlFotoVeterinario)"
                
            }
            
            if let email = acf.value(forKey: "email") as? String {
                
                self.email = email
                
            }
            
            if let telefono = acf.value(forKey: "telefono") as? String {
                
                self.telefono = telefono
                
            }
            
            if let ciudad = acf.value(forKey: "ciudad") as? String {
                
                self.ciudad = ciudad
                
            }
            
            if let urgencias = acf.value(forKey: "urgencias") as? String {
                
                self.urgencias = urgencias
                
            }
            
            
        }
        
    }
    
    
    
}
