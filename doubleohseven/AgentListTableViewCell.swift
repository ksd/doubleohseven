//
//  AgentListTableViewCell.swift
//  doubleohseven
//
//  Created by ksd on 15/02/2021.
//

import UIKit

class AgentListTableViewCell: UITableViewCell {

    @IBOutlet weak var agentBackgroundView: UIView! {
        didSet {
            agentBackgroundView.layer.cornerRadius = 16
            agentBackgroundView.clipsToBounds = true
        }
    }
    @IBOutlet weak var agentNameLabel: UILabel!
    @IBOutlet weak var agentImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
