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
    //ここに画像の保存も入れる予定
    @IBOutlet var explanationTextView: UITextView!
    
    let realm = try! Realm()
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        let item = ShoppingItem()
        item.title = titleTextField.text ?? ""
        item.price = Int(priceTextField.text ?? "") ?? 0
        item.explanation = explanationTextView.text ?? ""
        item.category = category
        createItem(item: item)
        
        let previousNC = self.presentingViewController as! UINavigationController
        let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! ItemViewController
        
        self.dismiss(animated: true)
    }
    
    func createItem(item: ShoppingItem) {
        try! realm.write {
            realm.add(item)
        }
    }

}
