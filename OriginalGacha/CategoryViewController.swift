//
//  CategoryViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/10.
//
//TableViewにデータを追加するやつ

import UIKit
import RealmSwift

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomCellDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var categories: [Category] = []
    var selectedCategory: Category? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "GachaListButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        categories = readCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        categories = readCategories()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? GachaListButtonTableViewCell
        cell?.delegate = self
        print(categories)
        let titleData = categories[indexPath.row].title
        
       print(titleData)
        cell?.configure(title: titleData)
//        cell.textLabel?.text = categories[indexPath.row].title
        
        return cell!
    }
    
    //セルが押されたら画面遷移する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        self.performSegue(withIdentifier: "toItemView", sender: nil)
    }
    
    func readCategories() -> [Category] {
        return Array(realm.objects(Category.self))
    }
    
    //値の受け渡しをする。prepareはsegueが発動する時に実行される
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemView" {
            let itemViewController = segue.destination as! ItemViewController
            itemViewController.selectedCategory = self.selectedCategory!
        }
    }

}

// ボタンを押した時にガチャリストから”それ”をセットする
extension CategoryViewController {
    func customCellDelegateDidTapButton(cell: UITableViewCell, categoryTitle: String) {
        SelectGachaData.shared.gachaTitle = categoryTitle
        self.navigationController?.popViewController(animated: true)
    }
}
