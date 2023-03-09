//
//  NewItemViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/09.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        let item = ShoppingItem()
        item.title = titleTextField.text ?? ""
        item.price = Int(priceTextField.text ?? "") ?? 0
        item.isMarked = markSwitch.isOn
        createItem(item: item)
        
        self.dismiss(animated: true)
    }
    
    func createItem(item: ShoppingItem) {
        try! realm.write {
            realm.add(item)
        }
    }

}
