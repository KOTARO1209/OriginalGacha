//
//  ShoppingItem.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/09.
//

import Foundation
import RealmSwift

class GachaItem: Object {
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    //ここに画像の保存も入る予定
    @Persisted var explanation: String = ""
    
    static let shared = GachaItem()
    
    @Persisted var category: GachaName?
}
