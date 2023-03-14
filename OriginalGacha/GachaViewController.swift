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
    var outputValue : [GachaItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.objectNameLabel.text = outputValue![0].title
        self.objectProbabilityLabel.text = String(outputValue![0].price)
        self.objectExplanationTextView.text = outputValue![0].explanation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func probabilityCalculation() {
        
    }
    
}
