//
//  File.swift
//
//
//  Created by MD1 on 21/10/2022.
//

import Foundation
import StocksAPI
@main
enum StockAPIExec {
    static let stocksAPI = StocksAPI()
    static func main() async {
        do {
//            let quotes = try await stocksAPI.fetchQuotes(symbols: "AAPL,MSFT,GOOG,TSLA")
//            print(quotes)

//            let tickers = try await stocksAPI.searchTickers(query: "tesla")
//            print(tickers)
            
            if let chart = try await stocksAPI.fetchChartData(tickerSymbol: "AAPL", range: .oneDay){
                print(chart)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
