//
//  eGymTests.swift
//  eGymTests
//
//  Created by Vaibhav Bangde on 31/10/19.
//  Copyright © 2019 Vaibhav Bangde. All rights reserved.
//

import XCTest
@testable import eGym

class eGymTests: XCTestCase {

    var interactor : TopStoriesInteractorProtocol!
    
    struct testTopStoriesFetchService : FetchTopStoriesServiceProtocol {
        var testJsonData : Data
        
        init(data:Data) {
            self.testJsonData = data
        }
        
        func fetchTopStories(completion: @escaping (Data?) -> Void) {
            completion(testJsonData)
        }
    }
    
    override func setUp() {
        guard let jsonData = self.readJson() else { return }

        let topStoriesFetchService = testTopStoriesFetchService(data: jsonData)
        let createStoryEntityService = CreateStoryEntitiesService()
        let fetchImageUrlFromStory = FetchImageUrlFromStoryService()
        let apiService = ApiService()
        let fetchCellImageService = FetchCellImageService(apiService: apiService)
        
        self.interactor = TopStoriesInteractor(fetchTopStoriesService: topStoriesFetchService,
                                               createStoryEntityService: createStoryEntityService,
                                               fetchImageUrlFromStory: fetchImageUrlFromStory,
                                               fetchCellImageService: fetchCellImageService)
    }

    func readJson() -> Data? {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "topStories_test", ofType: "json") else {
            print("topStories_test.json not found")
            return nil
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            print("Unable to convert topStories_test.json to String")
            return nil
        }

        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Unable to convert topStories_test.json to Data")
            return nil
        }
        
        return jsonData
    }
    
    override func tearDown() {
        super.tearDown()
        self.interactor = nil
    }

    func testJsonParcing() {
        let testExpectation = expectation(description: #function)
        
        self.interactor.fetchTopStories { (response) in
            guard let stories = response else {
                XCTAssert(false)
                return
            }
            XCTAssertEqual(stories.count, 35)
            
            if let story = stories.first(where: { $0.title == "The Money Farmers: How Oligarchs and Populists Milk the E.U. for Millions" }) {
                
                XCTAssertEqual(story.byline, "By SELAM GEBREKIDAN, MATT APUZZO and BENJAMIN NOVAK")
            }
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
