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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.objectNameLabel.text = outputValue![0].title
        self.objectProbabilityLabel.text = String(outputValue![0].price)
        self.objectExplanationTextView.text = outputValue![0].explanation
        probabilityCalculation()
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
        print(Int.random(in: 1...calculationNumber))
    }
    
}
