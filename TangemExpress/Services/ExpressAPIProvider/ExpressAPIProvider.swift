//
//  ExpressAPIProvider.swift
//  TangemExpress
//
//  Created by Sergey Balashov on 08.11.2023.
//  Copyright © 2023 Tangem AG. All rights reserved.
//

import Foundation

public protocol ExpressAPIProvider {
    /// Requests from Express API `exchangeAvailable` state for currencies included in filter
    /// - Returns: All `ExpressCurrency` that available to exchange specified by filter
    func assets(with filter: [ExpressCurrency]) async throws -> [ExpressAsset]
    func pairs(from: [ExpressCurrency], to: [ExpressCurrency]) async throws -> [ExpressPair]

    func providers() async throws -> [ExpressProvider]
    func exchangeQuote(item: ExpressSwappableItem) async throws -> ExpressQuote
    func exchangeData(item: ExpressSwappableItem) async throws -> ExpressTransactionData
    func exchangeStatus(transactionId: String) async throws -> ExpressTransaction
    func exchangeSent(result: ExpressTransactionSentResult) async throws

    // TODO: Add onramp endpoints
    // https://tangem.atlassian.net/browse/IOS-8156
}
