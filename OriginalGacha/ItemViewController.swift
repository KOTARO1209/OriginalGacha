//
//  ViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/06.
//

//保存したデータ取り出し、TableViewに表示する！

import UIKit
import RealmSwift

class ItemViewController: UIViewController, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var items: [ShoppingItem] = []
    var selectedCategory: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItems()
        navigationItem.title = selectedCategory.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: ShoppingItem = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price, explanation: item.explanation)
        
        return cell
    }
    
    func readItems() -> [ShoppingItem] {
        return Array(realm.objects(ShoppingItem.self).filter("category == %@", selectedCategory!))
    }
    
    //「prepare()」メソッドを使って、Segueが発動する時に遷移先のNewItemViewControllerのcategory変数に、この画面(ItemViewController)のselectedCategoryを代入して値渡ししている
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewItemView" {
            let newItemViewController = segue.destination as! NewItemViewController
            newItemViewController.category = self.selectedCategory
        }
    }
    
    // 削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            //Realmから消す
            try! realm.write {
                realm.delete(items[indexPath.row])
            }

            //配列から消す？
            items.remove(at: indexPath.row)
            //表示上消す
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
}

