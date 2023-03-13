//
//  Category.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/10.
//

import Foundation
import RealmSwift

class GachaList: Object {
    @Persisted var title: String = ""
}
