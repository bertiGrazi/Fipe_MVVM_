//
//  BrandViewController.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 08/12/20.
//

import UIKit

class BrandViewController: UIViewController {

  
    @IBOutlet weak var tableViewBrand: UITableView!
    
    var brandsViewModel: BrandsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brandsViewModel = BrandsViewModel()
        
        tableViewBrand.delegate = self
        tableViewBrand.dataSource = self
        
        tableViewBrand.register(UINib(nibName: "FileTableViewCell", bundle: nil), forCellReuseIdentifier: "FileTableViewCell")
        
        loadBrandData()
        
    }
   
    func loadBrandData() {
        brandsViewModel?.loadBrandAPI(completion: {  (sucess, error) in
            if sucess {
                DispatchQueue.main.async {
                    self.tableViewBrand.reloadData()
                }
            }
        })
    }
    
    
}
extension BrandViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = UIStoryboard(name: "ModelViewController", bundle: nil).instantiateInitialViewController() as? ModelViewController {
            model.getBrandID = brandsViewModel?.arrayBrands[indexPath.row].code
            navigationController?.pushViewController(model, animated: true)
        }
    }
}
extension BrandViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let allBrands = brandsViewModel?.numberOfRows() {
            return allBrands
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileTableViewCell", for: indexPath) as! FileTableViewCell
        cell.setup(name: brandsViewModel!.arrayBrands[indexPath.row].name)
        
        
        
        return cell
    }
    
    
}
