//
//  TableViewCell.swift
//  testingOnboardscreens
//
//  Created by siddappa tambakad on 19/12/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageViewText: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
