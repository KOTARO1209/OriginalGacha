//
//  GachaViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/13.
//

import UIKit

class GachaViewController: UIViewController {
    
    @IBOutlet var objectNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.gachagacha()
    }
    
    
    // GachaItemから「title: String = ""」を取り出してnameに入れたい
    // 選択したガチャの中身の名前を最初の画面に表示する
    func gachagacha(){
        guard let name = GachaName.shared.gachaData.title else {return}
        self.objectNameLabel.text = name
    }

}
