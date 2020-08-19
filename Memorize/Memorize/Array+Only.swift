//
//  Array+Only.swift
//  Memorize
//
//  Created by Danilo S Nascimento on 19/08/20.
//  Copyright © 2020 DanSantucci. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
