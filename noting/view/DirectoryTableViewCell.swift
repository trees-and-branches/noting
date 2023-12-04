//
//  DirectoryTableViewCell.swift
//  noting
//
//  Created by shark boy on 12/3/23.
//

import UIKit

class DirectoryTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with url: URL) {
        
    }

}
