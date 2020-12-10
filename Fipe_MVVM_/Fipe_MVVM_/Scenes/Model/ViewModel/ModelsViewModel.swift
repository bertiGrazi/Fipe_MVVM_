//
//  ModelsViewModel.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 08/12/20.
//

import Foundation
import SwiftyJSON
import Alamofire

class ModelsViewModel {
    
    var arrayModel = [Model] ()
    
    func loadModelsAPI(brandID: String, completion: @escaping (_ result: Bool, _ error: Error?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandID)/modelos").responseJSON { response in
            if let dictionary = response.value as? [String: Any], let modelList = dictionary["modelos"] as? [[String: Any]] {
                
                for item in modelList {
                   let carModel = Model(json: JSON(item))
                   self.arrayModel.append(carModel)
                                       
                }
                
                completion(true, nil)
            } else {
                completion(false, response.error)
            }
            
        }
        
    }
    
    func numberOfRows() -> Int {
        return arrayModel.count
    }
}
