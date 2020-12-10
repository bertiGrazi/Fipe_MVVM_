//
//  InfoCarViewController.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 09/12/20.
//

import UIKit

class InfoCarViewController: UIViewController {

   
    
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelBrand: UILabel!
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var labelFuel: UILabel!
    @IBOutlet weak var labelFipeCode: UILabel!
    @IBOutlet weak var labelReference: UILabel!
    
    var infoCarViewModel: InfoCarViewModel?
    var getBrandID: String?
    var getModelID: String?
    var getYearID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoCarViewModel = InfoCarViewModel()
       
        loadAllInfoCars()
        
        
        
    }
    
    func loadAllInfoCars() {
        infoCarViewModel?.loadInfoCarAPI(brandID: getBrandID!, modelID: getModelID!, yearID: getYearID!, completion: {(sucess, error) in
            if sucess {
                DispatchQueue.main.async {
                    self.updateInfoCar()
                }
            }
        })
    }
    
    func updateInfoCar() {
        if let info = infoCarViewModel?.getInfoCar() {
            labelValue.text = info.value
            labelBrand.text = info.brand
            labelModel.text = info.model
            labelFuel.text = info.fuel
            labelFipeCode.text = info.fipeCode
            labelReference.text = info.reference
            
        }
    }
}
