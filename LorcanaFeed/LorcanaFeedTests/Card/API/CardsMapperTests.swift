//
//  CardsMapperTests.swift
//  LorcanaFeedTests
//
//  Created by marlon von ansale on 27/12/2023.
//

import XCTest
import LorcanaFeed

final class CardsMapperTests: XCTestCase {
    
    func test_map_deliversItemsOn200HTTPResponseWithJSONItems() throws {
        let result = try CardMapper.map(Data(jsonString.utf8), from: HTTPURLResponse(statusCode: 200), chapter: "First")
        
        let card = result.first
        
        XCTAssertNotNil(card)
        XCTAssertEqual(card?.name, "Mickey Mouse - Wayward Sorcerer")
        XCTAssertEqual(card?.rarity, "Enchanted")
    }
    
}

fileprivate let jsonString = """
[
   {
      "id":258453,
      "name":"Mickey Mouse - Wayward Sorcerer",
      "version":"Alternate Art",
      "game_id":18,
      "category_id":214,
      "expansion_id":3469,
      "fixed_properties":{
         "collector_number":"208/204",
         "lorcana_rarity":"Enchanted"
      },
      "editable_properties":[
         {
            "name":"condition",
            "type":"string",
            "default_value":"Near Mint",
            "possible_values":[
               "Near Mint",
               "Slightly Played",
               "Moderately Played",
               "Played",
               "Poor"
            ]
         },
         {
            "name":"signed",
            "type":"boolean",
            "default_value":"false",
            "possible_values":[
               true,
               false
            ]
         },
         {
            "name":"altered",
            "type":"boolean",
            "default_value":"false",
            "possible_values":[
               true,
               false
            ]
         },
         {
            "name":"lorcana_language",
            "type":"string",
            "default_value":"en",
            "possible_values":[
               "en",
               "fr",
               "de"
            ]
         }
      ],
      "card_market_id":729396,
      "tcg_player_id":510154,
      "scryfall_id":"",
      "image_url":"https://cardtrader.com/uploads/blueprints/image/258453/preview_mickey-mouse-wayward-sorcerer-alternate-art-the-first-chapter.jpg",
      "image":{
         "url":"/uploads/blueprints/image/258453/mickey-mouse-wayward-sorcerer-alternate-art-the-first-chapter.jpg",
         "show":{
            "url":"/uploads/blueprints/image/258453/show_mickey-mouse-wayward-sorcerer-alternate-art-the-first-chapter.jpg"
         },
         "preview":{
            "url":"/uploads/blueprints/image/258453/preview_mickey-mouse-wayward-sorcerer-alternate-art-the-first-chapter.jpg"
         },
         "social":{
            "url":"/uploads/blueprints/image/258453/social_mickey-mouse-wayward-sorcerer-alternate-art-the-first-chapter.jpg"
         }
      },
      "back_image":null
   }
]
"""
