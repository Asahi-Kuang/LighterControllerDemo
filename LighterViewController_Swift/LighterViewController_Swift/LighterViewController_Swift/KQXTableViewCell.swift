//
//  KQXTableViewCell.swift
//  LighterViewController_Swift
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/6.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

import UIKit

class KQXTableViewCell: UITableViewCell {
    
    @IBOutlet var cellLb: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellLb.backgroundColor = UIColor.purpleColor()
        cellLb.layer.masksToBounds = true
        cellLb.layer.cornerRadius  = 22.5
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
