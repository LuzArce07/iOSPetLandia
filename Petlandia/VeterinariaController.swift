//
//  VeterinariaController.swift
//  Petlandia
//
//  Created by Alumno on 11/12/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire

class VeterinariaController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var veterinarias : [Veterinaria] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return veterinarias.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaVeterinaria") as? CeldaVeterinariaController
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 195
    }
    
    
    
    
    
}
