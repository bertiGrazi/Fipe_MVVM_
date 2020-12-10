//
//  ModelViewController.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 08/12/20.
//

import UIKit

class ModelViewController: UIViewController {

    @IBOutlet weak var tableViewModel: UITableView!
    
    var modelsViewModel: ModelsViewModel?
    var getBrandID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelsViewModel =  ModelsViewModel()
        
        tableViewModel.delegate = self
        tableViewModel.dataSource = self
        tableViewModel.register(UINib(nibName: "FileTableViewCell", bundle: nil), forCellReuseIdentifier: "FileTableViewCell")
        
        loadAllModels()
    }
   
    func loadAllModels() {
        modelsViewModel?.loadModelsAPI(brandID: getBrandID!, completion: {(sucess, error) in
            if sucess {
                DispatchQueue.main.async {
                    self.tableViewModel.reloadData()
                }
            }
        })
    }
}
extension ModelViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let year = UIStoryboard(name: "YearsViewController", bundle: nil).instantiateInitialViewController() as? YearsViewController {
            year.getBrandID = self.getBrandID
            year.getModelID = modelsViewModel!.arrayModel[indexPath.row].code
            navigationController?.pushViewController(year, animated: true)
        }
    }
}
extension ModelViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let allModel = modelsViewModel?.numberOfRows() {
            return allModel
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileTableViewCell", for: indexPath) as! FileTableViewCell
        cell.setup(name: modelsViewModel!.arrayModel[indexPath.row].name)
        return cell
    }
    
    
}
