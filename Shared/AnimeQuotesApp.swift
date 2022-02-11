//
//  AnimeQuotesApp.swift
//  Shared
//
//  Created by Jayanta kumar on 11/02/22.
//

import SwiftUI

@main
struct AnimeQuotesApp: App {
    @StateObject private var animeFetcher = QuoteQueryManager(fetcherObject: FetcherObject())
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(animeFetcher)
        }
    }
}
