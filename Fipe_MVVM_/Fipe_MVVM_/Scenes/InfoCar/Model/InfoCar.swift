//
//  InfoCar.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 09/12/20.
//

import Foundation
import SwiftyJSON

class InfoCar {
    var value: String
    var brand: String
    var model: String
    var fuel: String
    var fipeCode: String
    var reference: String
    
    init(json: JSON) {
        self.value = json["Valor"].stringValue
        self.brand = json["Marca"].stringValue
        self.model = json["Modelo"].stringValue
        self.fuel = json["Combustivel"].stringValue
        self.fipeCode = json["CodigoFipe"].stringValue
        self.reference = json["MesReferencia"].stringValue
        
        
    }
    
}
