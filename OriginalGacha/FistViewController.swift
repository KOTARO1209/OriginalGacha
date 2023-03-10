//
//  FistViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/12.
//

import UIKit
import RealmSwift

class FistViewController: UIViewController {

    let realm = try! Realm()
    
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
        let title = GachaName.shared.title
        print(title)
        self.gachaTitleLabel.text = title
    }
    
}
