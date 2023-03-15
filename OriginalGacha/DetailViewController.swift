//
//  NewItemViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/09.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    
    //ここに画像の保存も入れる予定
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var explanationTextView: UITextView!
    
    let realm = try! Realm()
    var category: GachaName!
    
    //画像保存用のやつ
    var directoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    var selectdata: NSData? = nil
    var fileName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        saveImage()
        
        let item = GachaItem()
        item.title = titleTextField.text ?? "name"
        item.probability = Int(priceTextField.text ?? "") ?? 1
        item.explanation = explanationTextView.text ?? "This is test TextView."
        item.category = category
        print(fileName)
        //画像をRealmに保存
        item.picture = fileName
        createItem(item: item)
        
        let previousNC = self.presentingViewController as! UINavigationController
        let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! InsideListViewController
        
        self.dismiss(animated: true)
    }
    
    @IBAction func selectPicture(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerView = UIImagePickerController()
            pickerView.sourceType = .photoLibrary
            pickerView.delegate = self
            self.present(pickerView, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else{
            print("image not found")
            return
        }
        imageView.image = image
        let data = image.pngData()! as NSData
        selectdata = data
    }
    
    func createItem(item: GachaItem) {
        try! realm.write {
            realm.add(item)
        }
    }
    
    //画像保存用関数1
    func saveImage() {
        createLocalDataFile()
        
        let pngImageData = imageView.image?.pngData()
        do {
            try pngImageData!.write(to: directoryFileURL)
        } catch {
            print("エラー")
        }
    }
    
    //画像保存用関数2
    func createLocalDataFile() {
        fileName = "\(NSUUID().uuidString).png"
        if directoryFileURL != nil{
            let path = directoryFileURL.appendingPathComponent(fileName)
            directoryFileURL = path
            print("testtttt")
        }
    }

}
