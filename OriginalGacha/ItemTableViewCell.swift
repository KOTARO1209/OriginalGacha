//
//  ItemTableViewCell.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/09.
//

//CellにRealmのデータを格納する！

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var explanationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(title: String, price: Int, explanation: String) {
        titleLabel.text = title
        priceLabel.text = String(price)
        explanationLabel.text = explanation
    }
    
}
