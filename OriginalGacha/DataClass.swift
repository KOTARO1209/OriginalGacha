//
//  DataClass.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/12.
//

import Foundation

final class SelectGachaData {
    static let shared = SelectGachaData()
    var gachaTitle: String?
    var gachaData: [ShoppingItem]?
    private init() {}
}
