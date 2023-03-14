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
    var category: GachaName!
    
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
        name = title
        self.gachaTitleLabel.text = title
    }
    
    func loadGachaData() {
        category = GachaItem.shared.category
        gachaData = Array(realm.objects(GachaItem.self).filter("category == %@", category))
    }
    
    // segueが動作することをViewControllerに通知するメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toGachaViewController" {
            // 2. 遷移先のViewControllerを取得
            let next = segue.destination as? GachaViewController
            // 3. １で用意した遷移先の変数に値を渡す
            next?.outputValue = self.gachaData
        }
    }
    
    @IBAction func tapTransitionButton(_ sender: Any) {
        // 4. 画面遷移実行
        performSegue(withIdentifier: "toGachaViewController", sender: nil)
    }
}
