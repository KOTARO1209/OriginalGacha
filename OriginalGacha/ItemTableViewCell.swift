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
    @IBOutlet var markImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(title: String, price: Int, isMarked: Bool) {
        titleLabel.text = title
        priceLabel.text = String(price) + "円"
        markImageView.image = UIImage(systemName: "star")
    }
    
}
