//
//  ShoppingItem.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/09.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    @Persisted var explanation: String = ""
    
    @Persisted var category: Category?
}
