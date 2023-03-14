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
    
    // 配列の中に入っている要素の確率の合計値
    var calculationNumber: Int = 0
    var calculationRandomNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        probabilityCalculation()
        
        // UIへの反映
        self.objectNameLabel.text = outputValue![calculationRandomNumber].title
        self.objectProbabilityLabel.text = String(outputValue![calculationRandomNumber].price)
        self.objectExplanationTextView.text = outputValue![calculationRandomNumber].explanation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 確率の計算をしている
    func probabilityCalculation() {
        for i in 0..<outputValue!.count {
            calculationNumber += outputValue![i].price
        }
        print(calculationNumber)
        
        // UIへの反映の時に(0~数)としたいので意図的に-1している
        calculationRandomNumber = Int.random(in: 1...calculationNumber) - 1
        print(calculationRandomNumber)
        
        // [てぃーてぃー:1, えみりー:3, じねんじょ:3]
        //calculationNumber = 7
        //calculationRandomNumber = 1~7
        
        
    }
    
}
