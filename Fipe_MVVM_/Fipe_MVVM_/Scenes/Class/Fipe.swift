//
//  Fipe.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 08/12/20.
//

import Foundation
import SwiftyJSON

class Fipe {
    var name: String
    var code: String
        
    
    init(json: JSON) {
        self.name = json["nome"].stringValue
        self.code = json["codigo"].stringValue
    }
}
