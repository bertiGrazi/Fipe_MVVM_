//
//  FileTableViewCell.swift
//  Fipe_MVVM_
//
//  Created by Grazi Berti on 08/12/20.
//

import UIKit

class FileTableViewCell: UITableViewCell {

    @IBOutlet weak var labelFipe: UILabel!
    
    func setup(name: String) {
        labelFipe.text = name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
