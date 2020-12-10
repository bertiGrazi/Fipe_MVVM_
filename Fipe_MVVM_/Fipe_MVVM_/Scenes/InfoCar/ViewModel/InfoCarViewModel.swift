//
//  InfoCar.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 09/12/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class InfoCarViewModel {
    var infoCar: InfoCar?
    
    func loadInfoCarAPI(brandID: String, modelID: String, yearID: String, completion: @escaping (_ result: Bool, _ error: Error?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandID)/modelos/\(modelID)/anos/\(yearID)") .responseJSON { response in
            if let arrayDictionary = response.value as? [String: Any] {
                
                self.infoCar = InfoCar(json: JSON(arrayDictionary))
                
                completion(true, nil)
            } else {
                completion(false, response.error)
            }
            
        }
    }
    
    func getInfoCar() -> InfoCar? {
        return infoCar
    }
        
}
