//
//  File.swift
//
//
//  Created by MD1 on 22/10/2022.
//

import Foundation
public struct SearchTickersResponse: Decodable {
    public let data: [Ticker]?
    public let error: ErrorResponse?
    enum CodingKeys: CodingKey {
        case quotes
        case finance
    }

    enum FinanceKeys: CodingKey {
        case error
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try? container.decodeIfPresent([Ticker].self, forKey: .quotes)
        error = try? container.nestedContainer(keyedBy: FinanceKeys.self, forKey: .finance).decodeIfPresent(ErrorResponse.self, forKey: .error)
    }
}

public struct Ticker: Codable, Identifiable, Hashable, Equatable {
    public let id = UUID()
    public let symbol: String
    public let quoteType: String?
    public let shortname: String?
    public let longName: String?
    public let sector: String?
    public let industry: String?
    public let exchDisp: String?

    public init(
        symbol: String,
        quoteType: String? = nil,
        shortname: String? = nil,
        longName: String? = nil,
        sector: String? = nil,
        industry: String? = nil,
        exchDisp: String? = nil
    ) {
        self.symbol = symbol
        self.quoteType = quoteType
        self.shortname = shortname
        self.longName = longName
        self.sector = sector
        self.industry = industry
        self.exchDisp = exchDisp
    }
}
