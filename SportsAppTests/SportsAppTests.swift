//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by Macos on 19/05/2025.
//

import XCTest
@testable import SportsApp

final class SportsAppTests: XCTestCase {
var networkService = SportsServices()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testgetLeaguesDetails(){
        let exp = expectation(description: "loading")
        AlamofireFactory.leagueDetailsRequest(url: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=edaabe5e8bfd4f780d114f7cafd181e0acc496f308f7685089b5cd9ecf224f5d"){ LeaguesDetails in
            if let LeaguesDetails = LeaguesDetails {
                XCTAssert(LeaguesDetails.success == 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
        }
    
    func testGetLeaguesEvent(){
        let exp = expectation(description: "loading")
        AlamofireFactory.leagueDetailsRequest(url: "https://apiv2.allsportsapi.com/football//?APIkey=edaabe5e8bfd4f780d114f7cafd181e0acc496f308f7685089b5cd9ecf224f5d&met=Fixtures&from=2025-01-01&to=2025-06-30&leagueId=266"){ LeagueEventResponse in
            if let LeagueEventResponse = LeagueEventResponse {
                XCTAssert(LeagueEventResponse.success == 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
        }
    
    func testTeamsResponse(){
        let exp = expectation(description: "loading")
        AlamofireFactory.teamsRequest(url: "https://apiv2.allsportsapi.com/football//?APIkey=edaabe5e8bfd4f780d114f7cafd181e0acc496f308f7685089b5cd9ecf224f5d&met=Teams&leagueId=152"){ teamResponse in
            if let teamResponse = teamResponse {
                XCTAssert(teamResponse.success == 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout:5)
        }
    
    
    func testTinnesLeagueResponse(){
        let exp = expectation(description: "loading")
        AlamofireFactory.tennisLeagueDetails(url: "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=edaabe5e8bfd4f780d114f7cafd181e0acc496f308f7685089b5cd9ecf224f5d&countryId=283"){ tennisLeagueResponse in
            if let tennisLeagueResponse = tennisLeagueResponse {
                XCTAssert(tennisLeagueResponse.success == 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout:5)
        }
    
    func testCreickeLeagueDetails(){
        let exp = expectation(description: "loading")
        AlamofireFactory.getCricketLeagueDetails(url: "https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=edaabe5e8bfd4f780d114f7cafd181e0acc496f308f7685089b5cd9ecf224f5d&from=2024-03-13&to=2025-05-17&leagueId=733"){ cricketLeagueDetails in
            if let cricketLeagueDetails = cricketLeagueDetails {
                XCTAssert(cricketLeagueDetails.success == 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout:5)
        }
    
    func testTinnesEvent(){
        let exp = expectation(description: "loading")
        AlamofireFactory.getTennisDetails(url: "https://apiv2.allsportsapi.com/tennis/?met=Fixtures&APIkey=edaabe5e8bfd4f780d114f7cafd181e0acc496f308f7685089b5cd9ecf224f5d&from=2025-05-9&to=2025-05-18&countryId=281"){ tennisEventResponse in
            if let tennisEventResponse = tennisEventResponse {
                XCTAssert(tennisEventResponse.success == 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout:5)
        }

    

    
    }
