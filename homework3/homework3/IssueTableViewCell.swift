//
//  IssueTableViewCell.swift
//  homework3
//
//  Created by 周越 on 1/31/22.
//

import UIKit

class IssueTableViewCell: UITableViewCell {

    @IBOutlet weak var leftCell: UILabel!
    @IBOutlet weak var rightCell: UILabel!
    @IBOutlet weak var picture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
