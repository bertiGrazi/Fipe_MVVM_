//
//  YearsViewController.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 08/12/20.
//

import UIKit

class YearsViewController: UIViewController {

    @IBOutlet weak var tableViewYears: UITableView!
    
    var yearsViewModel: YearsViewModel?
    var getBrandID: String?
    var getModelID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yearsViewModel = YearsViewModel()
        
        tableViewYears.delegate = self
        tableViewYears.dataSource = self
        
        tableViewYears.register(UINib(nibName: "FileTableViewCell", bundle: nil), forCellReuseIdentifier: "FileTableViewCell")
        
        loadAllYears()
    }
    func loadAllYears() {
        yearsViewModel?.loadYearsAPI(brandID: getBrandID!, modelID: getModelID!, completion: {(sucess, error) in
            if sucess {
                DispatchQueue.main.async {
                    self.tableViewYears.reloadData()
                }
            }
        })
    }
}
extension YearsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let infoCar = UIStoryboard(name: "InfoCarViewController", bundle: nil).instantiateInitialViewController() as? InfoCarViewController {
            infoCar.getBrandID = self.getBrandID
            infoCar.getModelID = self.getModelID
            infoCar.getYearID = String(yearsViewModel!.arrayYears[indexPath.row].code)
            navigationController?.pushViewController(infoCar, animated: true)
        }
    }
}
extension YearsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let allYears = yearsViewModel?.numberOfRows() {
            return allYears
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileTableViewCell", for: indexPath) as! FileTableViewCell
        cell.setup(name: yearsViewModel!.arrayYears[indexPath.row].name)
        
        return cell
    }
    
    
}
