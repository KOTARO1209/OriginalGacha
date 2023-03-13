//
//  NewCategoryViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/12.
//

import UIKit
import RealmSwift

class GachaNameViewController: UIViewController {

    @IBOutlet var categoryTextField: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        let category = GachaList()
        category.title = categoryTextField.text ?? ""
        createCategory(category: category)
        
        self.dismiss(animated: true)
    }
    
    func createCategory(category: GachaList) {
        try! realm.write {
            realm.add(category)
        }
    }
    
}
