//
//  quoteObject.swift
//  AnimeQuotes
//
//  Created by Jayanta kumar on 11/02/22.
//

import Foundation

struct QuoteObject:Hashable,Codable {
    let anime : String
    let character: String
    let quote: String
}
