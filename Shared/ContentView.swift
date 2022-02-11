//
//  ContentView.swift
//  Shared
//
//  Created by Jayanta kumar on 11/02/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var animeFetcher:QuoteQueryManager
    var body: some View {
        VStack{
            ListView()
        }.task {
            await animeFetcher.getQueryObject()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListView: View {
    @EnvironmentObject var animeFetcher:QuoteQueryManager
    var body: some View {
        switch animeFetcher.queryList.isEmpty{
        case true:
            VStack {
                ProgressView().padding()
            }.frame(width: 300, height: 300)
            
        case false:
        
                    List {
                        
                        ForEach(animeFetcher.queryList,id: \.self){
                            item in
                            VStack(alignment: .trailing, spacing: 10) {
                                Text(item.quote).font(.title2).bold().multilineTextAlignment(.leading).padding()
                                Text("-" + item.character + "\n(\(item.anime))" ).multilineTextAlignment(.trailing).font(.footnote).padding()
                            }
                                
                        }
                       
                    }
                    .refreshable {
                        await animeFetcher.getQueryObject()
                    }
        }
    }
}
