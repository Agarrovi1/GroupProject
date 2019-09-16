//
//  calcTableViewCell.swift
//  GroupProject
//
//  Created by hildy abreu on 9/16/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit

class calcTableViewCell: UITableViewCell {

    @IBOutlet weak var yearLabel: UILabel!
    
    
    @IBOutlet weak var interestLabel: UILabel!
    
    
    @IBOutlet weak var balanceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
