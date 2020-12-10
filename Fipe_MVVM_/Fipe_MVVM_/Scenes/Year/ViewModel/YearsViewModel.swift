//
//  YearsViewModel.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 08/12/20.
//

import Foundation
import SwiftyJSON
import Alamofire

class YearsViewModel {
    
    var arrayYears = [Year] ()
    
    func loadYearsAPI(brandID: String, modelID: String, completion: @escaping (_ result: Bool, _ error: Error?) -> Void) {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/\(brandID)/modelos/\(modelID)/anos").responseJSON { response in
            if let arrayDictionary = response.value as? [[String: Any]]{
                
                for item in arrayDictionary {
                   let year = Year(json: JSON(item))
                   self.arrayYears.append(year)
                }
                completion(true, nil)
            } else {
                completion(false, response.error)
            }
            
         }
        
       }
    func numberOfRows() -> Int {
        return arrayYears.count
    }
}
