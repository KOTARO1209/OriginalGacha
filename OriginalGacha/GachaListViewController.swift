//
//  CategoryViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/10.
//
//TableViewにデータを追加するやつ

import UIKit
import RealmSwift

class GachaListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomCellDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var categories: [GachaName] = []
    var selectedCategory: GachaName? = nil
    
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
        let titleData = categories[indexPath.row].title
        
        cell?.configure(title: titleData, category: categories[indexPath.row])
        
        return cell!
    }
    
    //セルが押されたら画面遷移する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        self.performSegue(withIdentifier: "toItemView", sender: nil)
    }
    
    func readCategories() -> [GachaName] {
        return Array(realm.objects(GachaName.self))
    }
    
    //値の受け渡しをする。prepareはsegueが発動する時に実行される
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemView" {
            let itemViewController = segue.destination as! InsideListViewController
            itemViewController.selectedCategory = self.selectedCategory!
        }
    }
    
    //削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //Realmから消す
            try! realm.write {
                realm.delete(categories[indexPath.row])
            }
            
            //配列から消す？
            categories.remove(at: indexPath.row)
            //表示上消す
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
    
}

//GachaListViewControllerで選択したガチャのタイトルをセットしているみたいなので、ここでタイトルをセットするついでにガチャの中身もSelectGachaDataに保存してあげたら良いと思います！！ちなみにガチャのタイトルに該当するガチャの中身はRealmのフィルター機能を使えば取得できそう！！

// ボタンを押した時にガチャリストから”それ”をセットする
extension GachaListViewController {
    func customCellDelegateDidTapButton(cell: UITableViewCell, categoryTitle: String, category: GachaName) {
        GachaName.shared.title = categoryTitle
        GachaItem.shared.category = category
        self.navigationController?.popViewController(animated: true)
    }
}
