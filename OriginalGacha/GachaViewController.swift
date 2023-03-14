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
    @IBOutlet var objectExplanationTextView: UITextView!
    
    // 1. 遷移先に渡したい値を格納する変数を用意する
    var outputValue: [GachaItem]?
    var rate_list: [Int]?
    
    // 配列の中に入っている要素の確率の合計値
    var calculationNumber: Int = 0
    var calculationRandomNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        probabilityCalculation()
        
        // UIへの反映
        self.objectNameLabel.text = outputValue![0].title
        self.objectProbabilityLabel.text = String(outputValue![0].price)
        self.objectExplanationTextView.text = outputValue![0].explanation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 確率の計算をする
    func probabilityCalculation() {
        for i in 0..<outputValue!.count {
            calculationNumber += outputValue![i].price
            
            //rate_listに確率の数字を追加してきたいけどなぜかできないいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい
            //rate_list.insert(outputValue![i].price, at: i)
            rate_list?.append(outputValue![i].price)
            rate_list? += [1]
            //rate_list?[i] = outputValue![i].price
            print("iの値は",i)
        }
        
        // UIへの反映の時に(0~数)としたいので意図的に-1している
        calculationRandomNumber = Int.random(in: 1...calculationNumber) - 1
        
        print("====")
        print(calculationNumber)
        print(rate_list)
        print(calculationRandomNumber)
    }
    
    func rateMake() {
        
    }
    
}

// [てぃーてぃー:1, えみりー:3, じねんじょ:3]
//calculationNumber = 7

//calculationRandomNumber = 1~7
//outputValue = [てぃーてぃー, えみりー, じねんじょ]
//rate_list = [1, 3, 3]
//now_rate = 0
