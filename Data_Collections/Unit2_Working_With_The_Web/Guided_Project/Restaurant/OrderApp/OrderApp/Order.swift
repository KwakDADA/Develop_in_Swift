//
//  Order.swift
//  OrderApp
//
//  Created by 곽다은 on 3/7/24.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
