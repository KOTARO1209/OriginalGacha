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
    @Persisted var probability: Int = 0
    @Persisted var picture: String!
    @Persisted var explanation: String = ""
    
    static let shared = GachaItem()
    
    @Persisted var category: GachaName?
}
