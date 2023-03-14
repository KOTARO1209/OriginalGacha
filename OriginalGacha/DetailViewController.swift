//
//  NewItemViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/09.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    //ここに画像の保存も入れる予定
    @IBOutlet var explanationTextView: UITextView!
    
    let realm = try! Realm()
    var category: GachaName!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        let item = GachaItem()
        item.title = titleTextField.text ?? "name"
        item.probability = Int(priceTextField.text ?? "") ?? 1
        item.explanation = explanationTextView.text ?? "This is test TextView."
        item.category = category
        createItem(item: item)
        
        let previousNC = self.presentingViewController as! UINavigationController
        let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! InsideListViewController
        
        self.dismiss(animated: true)
    }
    
    func createItem(item: GachaItem) {
        try! realm.write {
            realm.add(item)
        }
    }

}
