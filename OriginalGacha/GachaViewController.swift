//
//  GachaViewController.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/13.
//

import UIKit

class GachaViewController: UIViewController {
    
    @IBOutlet var objectNameLabel: UILabel!
    @IBOutlet var objectProbabilityLabel: UILabel!
    @IBOutlet var objectImageView: UIImageView!
    @IBOutlet var objectExplanationTextView: UITextView!
    
    @IBOutlet var capsuleImage: UIImageView!
    
    // 1. 遷移先に渡したい値を格納する変数を用意する
    var outputValue: [GachaItem]?
    var directoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    // 配列の中に入っている要素の確率の合計値
    var calculationNumber: Int = 0
    var calculationRandomNumber: Int = 0
    var now_rate: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        probabilityCalculation()
        
        // UIへの反映
        self.objectNameLabel.text = outputValue![now_rate].title
        self.objectProbabilityLabel.text = String(outputValue![now_rate].probability)
        self.objectExplanationTextView.text = outputValue![now_rate].explanation
        
        //画像のロード
        let fileURL = directoryFileURL.appendingPathComponent((outputValue![now_rate].picture)!)
        let filePath = fileURL.path
        
        if FileManager.default.fileExists(atPath: filePath){
            if let imageData = UIImage(contentsOfFile: filePath) {
                objectImageView.image = imageData
            } else {}
        } else {}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [self] in
            capsuleImage.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 確率の計算をする
    func probabilityCalculation() {
        for i in 0..<outputValue!.count {
            calculationNumber += outputValue![i].probability
        }
        
        calculationRandomNumber = Int.random(in: 1...calculationNumber)
        
        for i in 0..<outputValue!.count {
            now_rate += outputValue![i].probability
            if calculationRandomNumber <= now_rate {
                now_rate = i
                break
            }
        }
        
        //print("now_rate=",now_rate)
        print("ランダム=",calculationRandomNumber,"/",calculationNumber)
    }
}

// [てぃーてぃー:1, えみりー:3, じねんじょ:3]
//calculationNumber = 7

//calculationRandomNumber = 1~7
//outputValue = [てぃーてぃー, えみりー, じねんじょ]
//rate_list = [1, 3, 3]
//now_rate = 0
