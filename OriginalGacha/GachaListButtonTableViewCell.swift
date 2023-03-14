//
//  GachaListButtonTableViewCell.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/12.
//

import UIKit

class GachaListButtonTableViewCell: UITableViewCell {
    var delegate: CustomCellDelegate? //追加
    @IBOutlet var gachaTitleLabel: UILabel!
    var selectedCategory: GachaName?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func onButtonClick(_ sender: Any) {
        delegate?.customCellDelegateDidTapButton(cell: self, categoryTitle: gachaTitleLabel.text ?? "", category: selectedCategory!) //追加
        
    }

    func configure(title: String, category: GachaName) {
        gachaTitleLabel.text = String(title)
        selectedCategory = category
    }
    
}

//追加
protocol CustomCellDelegate {
    func customCellDelegateDidTapButton(cell: UITableViewCell, categoryTitle: String, category: GachaName)
}
