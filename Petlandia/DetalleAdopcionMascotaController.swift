//
//  DetalleAdopcionMascotaController.swift
//  Petlandia
//
//  Created by Luz Arce on 11/21/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire

class DetalleAdopcionMascotaController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var detallesAdopcionMascota : Adopcion?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaAdopcionMascota") as? CeldaDetalleAdopcionMascota
        
        celda?.lblNombreMascota.text = detallesAdopcionMascota!.nombreMascota
    AF.request(detallesAdopcionMascota!.urlImagenMascota).responseImage {
            
        response in
            
        switch(response.result) {
                
            case .success(let data) :
                
                celda?.imgMascota.image = data
                
            case .failure(_) :
                
                print("Algo salió mal")
                
            }
            
        }
        
        celda?.lblEdad.text = detallesAdopcionMascota!.edad
        celda?.lblNacimiento.text = detallesAdopcionMascota!.nacimiento
        celda?.lblColor.text = detallesAdopcionMascota!.color
        celda?.lblTamaño.text = detallesAdopcionMascota!.tamaño
        celda?.lblVacunas.text = detallesAdopcionMascota!.vacunas
        celda?.lblEsterilizacion.text = detallesAdopcionMascota!.esterilizacion
        celda?.lblPersonalidad.text = detallesAdopcionMascota!.personalidad
        
    AF.request(detallesAdopcionMascota!.urlImagenAlimento).responseImage {
            
            response in
            
            switch(response.result) {
                
            case .success(let data) :
                
                celda?.imgAlimento.image = data
                
            case .failure(_) :
                
                print("Algo salió mal")
                
            }
            
        }
        
        return celda!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 785
    }
    
}
