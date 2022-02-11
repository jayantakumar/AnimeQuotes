//
//  quoteQueryManager.swift
//  AnimeQuotes
//
//  Created by Jayanta kumar on 11/02/22.
//

import Foundation

@MainActor
class QuoteQueryManager:ObservableObject {
    
    @Published private(set) var queryList:[QuoteObject] = []
    private let fetcherObject:FetcherObject
      
      init(fetcherObject:FetcherObject) {
          self.fetcherObject = fetcherObject
      }
      
      func getQueryObject() async {
          do{
              self.queryList = try await fetcherObject.fetch()
          }
          catch{
              print(error)
          }
      }
}
