//
//  DetalleVeterinariaController.swift
//  Petlandia
//
//  Created by Alumno on 11/19/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class DetalleVeterinariaController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tvDetalleVeterinaria: UITableView!
    
    var detallesVeterinarias : Veterinaria?
    
    
    override func viewDidLoad() {
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaDetalleVeterinaria") as? CeldaDetalleVeterinariaController
        
        
        celda?.lblNombreVeterinaria.text = detallesVeterinarias!.nombreVeterinaria
        
        AF.request(detallesVeterinarias!.urlImagenLocal).responseImage {
            
            response in
            
            switch(response.result) {
                
            case .success(let data) :
                
                celda?.imgLocal.image = data
                
            case .failure(_) :
                
                print("Algo salió mal")
                
            }
            
        }
        
        celda?.lblHorario.text = detallesVeterinarias!.horario
        celda?.lblDireccion.text = detallesVeterinarias!.direccion
        celda?.lblNombreVeterinario.text = detallesVeterinarias!.veterinario
        
        AF.request(detallesVeterinarias!.urlFotoVeterinario).responseImage {
            
            response in
            
            switch(response.result) {
                
            case .success(let data) :
                
                celda?.imgVeterinario.image = data
                
            case .failure(_) :
                
                print("Algo salió mal")
                
            }
            
        }
        
        celda?.lblEmail.text = detallesVeterinarias!.email
        celda?.lblTelefono.text = detallesVeterinarias!.telefono
        celda?.lblCiudad.text = detallesVeterinarias!.ciudad
        celda?.lblUrgencias.text = detallesVeterinarias!.urgencias
        
        
        return celda!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 519
    }
}
