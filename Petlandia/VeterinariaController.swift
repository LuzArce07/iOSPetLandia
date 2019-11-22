//
//  VeterinariaController.swift
//  Petlandia
//
//  Created by Luz Arce on 11/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire

class VeterinariaController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var veterinarias : [Veterinaria] = []
    
    @IBOutlet weak var tvVeterinaria: UITableView!
    
    var data = [Veterinaria]()
    var filterData = [Veterinaria]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://wadopcionveterinaria.azurewebsites.net/wp-json/wp/v2/veterinarias").responseJSON {
            
            response in
            
            switch (response.result) {
                
            case .success(let datos) :
                
                if let arregloVeterinarias = datos as? NSArray {
                    
                    for veterinaria in arregloVeterinarias {
                        
                        if let diccionarioVeterinaria = veterinaria as? NSDictionary {
                            
                            let nuevaVeterinaria = Veterinaria(diccionarioVeterinaria: diccionarioVeterinaria)
                            self.veterinarias.append(nuevaVeterinaria)
                            
                        }
                        
                    }
                    
                    self.tvVeterinaria.reloadData()
                    
                }
                
            case .failure(_) :
                
                print("Algo salió mal")
                
            }
            
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return veterinarias.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaVeterinaria") as? CeldaVeterinariaController
        
        celda?.lblNombreVeterinaria.text = veterinarias[indexPath.row].nombreVeterinaria
        celda?.lblHorario.text = veterinarias[indexPath.row].horario
        
        AF.request(veterinarias[indexPath.row].urlImagenLocal).responseImage {
            
            response in
            
            switch(response.result) {
                
            case .success(let data) :
                
                celda?.imgLocal.image = data
                
            case .failure(_) :
                
                print("Algo salió mal")
                
            }
            
        }
        
        
        /*
         
         celda?.lblNombre.text = eventos[indexPath.row].nombre
         celda?.lblFecha.text = eventos[indexPath.row].fecha
         
         AF.request(eventos[indexPath.row].urlFlyer).responseImage{
         
         response in
         
         switch(response.result) {
         
         case .success(let data) :
         
         celda?.imgFlyer.image = data
         
         case .failure(_) :
         
         print("Algo salió mal")
         
         }
         
         }
         
         */
        
        return celda!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDetalleVeterinaria"{
            
            let destino = segue.destination as? DetalleVeterinariaController
            destino?.detallesVeterinarias = veterinarias[tvVeterinaria.indexPathForSelectedRow!.row]
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 195
    }
    
    func GET_AlamoVeterinarias() {
        
        AF.request("https://wadopcionveterinaria.azurewebsites.net/wp-json/wp/v2/veterinarias").responseJSON {
            
            response in
            
            switch (response.result) {
                
            case .success(let datos) :
                
                if let arregloVeterinarias = datos as? NSArray {
                    
                    for veterinaria in arregloVeterinarias {
                        
                        if let diccionarioVeterinaria = veterinaria as? NSDictionary {
                            
                            let nuevaVeterinaria = Veterinaria(diccionarioVeterinaria: diccionarioVeterinaria)
                            self.veterinarias.append(nuevaVeterinaria)
                            
                        }
                        
                    }
                    
                    self.tvVeterinaria.reloadData()
                    
                }
                
            case .failure(_) :
                
                print("Algo salió mal")
                
            }
            
        }
        
    }
    
    
    
}
