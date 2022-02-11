//
//  fetcher.swift
//  AnimeQuotes
//
//  Created by Jayanta kumar on 11/02/22.
//

import Foundation
protocol FetchService{
    func fetch(query:String) async throws -> [QuoteObject]
}
class FetcherObject:FetchService {
    
    enum FetchManagerError:Error {
    case urlError
    case dataError
        
    }
    

    func fetch(query:String = "Devops") async throws -> [QuoteObject] {

        guard let url = URL(string:"https://animechan.vercel.app/api/quotes")
                
                
        else{
            throw FetchManagerError.urlError
        }

        print(url.absoluteString)
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw FetchManagerError.dataError
        }
        print(data.count)
        let decodedData = try JSONDecoder().decode([QuoteObject].self, from: data)
        
        return decodedData
       
    }
}
