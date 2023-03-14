//
//  Category.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/10.
//

import Foundation
import RealmSwift

class GachaName: Object {
    @Persisted var title: String
    static let shared = GachaName()
}
