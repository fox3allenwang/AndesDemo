//
//  DemoTableViewCell.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/22.
//
//
//  TableViewCell.swift
//  AndesDemo
//
//  Created by Wang Allen on 2022/9/22.
//
import UIKit

class DemoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    static let identifier = "DemoTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
