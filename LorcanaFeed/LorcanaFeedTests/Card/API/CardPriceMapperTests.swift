//
//  CardPriceMapperTests.swift
//  LorcanaFeedTests
//
//  Created by marlon von ansale on 04/01/2024.
//

import XCTest
import LorcanaFeed

final class CardPriceMapperTests: XCTestCase {
    func test_map_deliversItemsOn200HTTPResponseWithJSONItems() throws {
        
    }
}

fileprivate let jsonString = """
{
    "258459": [
            {
                "id": 215426424,
                "blueprint_id": 258459,
                "name_en": "Hades - King of Olympus",
                "expansion": {
                    "code": "ch1",
                    "id": 3469,
                    "name_en": "The First Chapter"
                },
                "price_cents": 8328,
                "price_currency": "GBP",
                "quantity": 1,
                "description": null,
                "properties_hash": {
                    "condition": "Slightly Played",
                    "lorcana_rarity": "Enchanted",
                    "collector_number": "205/204",
                    "signed": false,
                    "lorcana_language": "en",
                    "lorcana_foil": true,
                    "altered": false
                },
                "graded": null,
                "bundle_size": 1,
                "on_vacation": false,
                "user": {
                    "country_code": "US",
                    "too_many_request_for_cancel_as_seller": false,
                    "user_type": "pro",
                    "can_sell_sealed_with_ct_zero": false,
                    "max_sellable_in24h_quantity": 8,
                    "id": 60638,
                    "username": "Darkwater Games",
                    "can_sell_via_hub": true
                },
                "price": {
                    "cents": 8328,
                    "currency": "GBP",
                    "currency_symbol": "£",
                    "formatted": "£83.28"
                }
            }
    ]
}
"""
