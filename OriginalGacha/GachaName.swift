//
//  DataClass.swift
//  OriginalGacha
//
//  Created by まちだこうたろう on 2023/03/12.
//

import Foundation

final class GachaName {
    static let shared = GachaName()
    var gachaTitle: String?
    var gachaData: [GachaItem]?
    private init() {}
}
