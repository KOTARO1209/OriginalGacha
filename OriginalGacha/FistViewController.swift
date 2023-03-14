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
    
    var gachaData: [GachaItem]!
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewSetUp()
        self.loadGachaData()
        print(gachaData)
    }
    
    // 選択したガチャの中身の名前を最初の画面に表示する
    func viewSetUp() {
        let title = GachaName.shared.title
        print(title)
        print(type(of: title))
        name = title
        self.gachaTitleLabel.text = title
    }
    
    func loadGachaData() {
        print(self.name)
        gachaData = Array(realm.objects(GachaItem.self).filter("category == %@", self.name))
        
    }
    
}
