//
//  FistViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/12.
//

import UIKit

class FistViewController: UIViewController {

    @IBOutlet var gachaTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewSetUp()
    }
    
    // 選択したガチャの中身の名前を最初の画面に表示する
    func viewSetUp(){
        guard let title = SelectGachaData.shared.gachaTitle else {return}
        self.gachaTitleLabel.text = title
    }

}
