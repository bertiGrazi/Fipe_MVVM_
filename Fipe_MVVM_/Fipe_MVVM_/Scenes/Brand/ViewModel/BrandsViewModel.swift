//
//  BrandsViewModel.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 08/12/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class BrandsViewModel {
    
    var arrayBrands = [Brand] ()
    
    func loadBrandAPI(completion: @escaping (_ result: Bool, _ error: Error?) -> Void) {
            AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas").responseJSON { response in
                if let arrayDictionary = response.value as? [[String: String]] {
                    
                    for item in arrayDictionary {
                        let brand = Brand(json: JSON(item))
                        self.arrayBrands.append(brand)
                    }
                    completion(true, nil)
                } else {
                    completion(false, response.error)
                }
                
            }
            
        }
    
    func numberOfRows() -> Int {
        return arrayBrands.count
    }
}
