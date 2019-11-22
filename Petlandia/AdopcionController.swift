//
//  AdopcionController.swift
//  Petlandia
//
//  Created by Luz Arce on 11/21/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class AdopcionController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var mascotasAdopciones : [Adopcion] = []
    
    @IBOutlet weak var tvMascotasAdopcion: UITableView!
    
    override func viewDidLoad() {
        
        AF.request("https://wadopcionveterinaria.azurewebsites.net/wp-json/wp/v2/adopciones").responseJSON {
            
            response in
            
            switch (response.result) {
                
            case .success(let datos) :
                
                if let arregloAdopcion = datos as? NSArray {
                    
                    for mascotaAdopcion in arregloAdopcion {
                        
                        if let diccionarioAdopcion = mascotaAdopcion as? NSDictionary {
                            
                            let nuevaAdopcion = Adopcion(diccionarioAdopcion: diccionarioAdopcion)
                            self.mascotasAdopciones.append(nuevaAdopcion)
                            
                        }
                        
                    }
                    
                    self.tvMascotasAdopcion.reloadData()
                    
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
        return mascotasAdopciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaMascota") as? CeldaAdopcionMascotaController
        
        celda?.lblNombreMascota.text = mascotasAdopciones[indexPath.row].nombreMascota
        celda?.lblEdad.text = mascotasAdopciones[indexPath.row].edad
        
        AF.request(mascotasAdopciones[indexPath.row].urlImagenMascota).responseImage {
            
            response in
            
            switch(response.result) {
                
            case .success(let data) :
                
                celda?.imgMascota.image = data
                
            case .failure(_) :
                
                print("Algo salió mal")
                
            }
            
        }
        
        return celda!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 157
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDetalleAdopcion"{
            
            let destino = segue.destination as? DetalleAdopcionMascotaController
            destino?.detallesAdopcionMascota = mascotasAdopciones[tvMascotasAdopcion.indexPathForSelectedRow!.row]
         
            
        }
 
    }
    
}
