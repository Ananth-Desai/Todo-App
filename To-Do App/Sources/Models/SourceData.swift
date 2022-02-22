//
//  SourceData.swift
//  To-Do App
//
//  Created by Ananth Desai on 18/02/22.
//

import Foundation

struct Item {
    var title: String
    var items: [String]

    init(category title: String, array list: [String]) {
        self.title = title
        items = list
    }

    mutating func addItem(_ item: String) {
        items.append(item)
    }
}

var sourceData: [Item] = [Item(category: "Shopping", array: ["Bread", "Butter", "Jam"]),
                          Item(category: "Sports", array: ["Shoes", "Raquet", "Ball"]),
                          Item(category: "School", array: ["Books", "Pens"])]
