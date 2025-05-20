//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by Macos on 19/05/2025.
//

import XCTest
@testable import SportsApp

final class SportsAppTests: XCTestCase {
    
    var sportsServices : SportsServicesProtocol!
    
    override func setUpWithError() throws {
        
        sportsServices = SportsServices()
    }

    override func tearDownWithError() throws {
        
        sportsServices = nil
        
    }



    func testFootballLeagueRequest(){
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.leagueRequest(url: "\(Strings.BASEURL)\(Strings.FOOTBALL_ENDPOINT)/?met=\(Strings.LEAGUES_ENDPOINT)&APIkey=\(Strings.API_KEY)"){ leaguesResponse in
            if let leaguesResponse = leaguesResponse {
                
                //Then
                XCTAssertEqual(leaguesResponse.success , 1)
                XCTAssertEqual(leaguesResponse.result?.first?.league_name, "UEFA Europa League")
                exp.fulfill()
                
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
        }
    
    func testBasketballLeagueRequest(){
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.leagueRequest(url: "\(Strings.BASEURL)\(Strings.BASKETBALL_ENDPOINT)/?met=\(Strings.LEAGUES_ENDPOINT)&APIkey=\(Strings.API_KEY)"){ leaguesResponse in
            if let leaguesResponse = leaguesResponse {
                
                //Then
                XCTAssertEqual(leaguesResponse.success , 1)
                exp.fulfill()
                
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
        }
    
    func testTennisLeagueRequest(){
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.leagueRequest(url: "\(Strings.BASEURL)\(Strings.TENNIS_ENDPOINT)/?met=\(Strings.LEAGUES_ENDPOINT)&APIkey=\(Strings.API_KEY)"){ leaguesResponse in
            if let leaguesResponse = leaguesResponse {
                
                //Then
                XCTAssertEqual(leaguesResponse.success , 1)
                exp.fulfill()
                
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
        }
    
    func testCricketLeagueRequest(){
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.leagueRequest(url: "\(Strings.BASEURL)\(Strings.CRICKET_ENDPOINT)/?met=\(Strings.LEAGUES_ENDPOINT)&APIkey=\(Strings.API_KEY)"){ leaguesResponse in
            if let leaguesResponse = leaguesResponse {
                
                //Then
                XCTAssertEqual(leaguesResponse.success , 1)
                exp.fulfill()
                
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
        }
    
    func testFootballLeagueDetailsRequest(){
        
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.leagueDetailsRequest(url: "\(Strings.BASEURL)\(Strings.FOOTBALL_ENDPOINT)//?APIkey=\(Strings.API_KEY)&met=\(Strings.EVENTS_ENDPOINT)&from=2025-01-01&to=2025-06-30&leagueId=266"){ LeagueEventResponse in
            
            if let LeagueEventResponse = LeagueEventResponse {
                XCTAssertEqual(LeagueEventResponse.success , 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
        }
    func testBasketBallLeagueDetailsRequest(){
        
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.leagueDetailsRequest(url: "\(Strings.BASEURL)\(Strings.BASKETBALL_ENDPOINT)//?APIkey=\(Strings.API_KEY)&met=\(Strings.EVENTS_ENDPOINT)&from=2025-01-01&to=2025-06-30&leagueId=266"){ LeagueEventResponse in
            
            if let LeagueEventResponse = LeagueEventResponse {
                XCTAssertEqual(LeagueEventResponse.success , 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
        }
    
    func testFootballTeamsRequest(){
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.teamsRequest(url: "\(Strings.BASEURL)\(Strings.FOOTBALL_ENDPOINT)//?APIkey=\(Strings.API_KEY)&met=\(Strings.TEAMS_ENDPOINT)&leagueId=152"){ teamResponse in
            
            if let teamResponse = teamResponse {
                //Then
                XCTAssertEqual(teamResponse.success , 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout:5)
        }
    func testBasketBallTeamsRequest(){
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.teamsRequest(url: "\(Strings.BASEURL)\(Strings.BASKETBALL_ENDPOINT)//?APIkey=\(Strings.API_KEY)&met=\(Strings.TEAMS_ENDPOINT)&leagueId=152"){ teamResponse in
            
            if let teamResponse = teamResponse {
                //Then
                XCTAssertEqual(teamResponse.success , 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout:5)
        }
    func testCricketTeamsRequest(){
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.teamsRequest(url: "\(Strings.BASEURL)\(Strings.CRICKET_ENDPOINT)//?APIkey=\(Strings.API_KEY)&met=\(Strings.TEAMS_ENDPOINT)&leagueId=152"){ teamResponse in
            
            if let teamResponse = teamResponse {
                //Then
                XCTAssertEqual(teamResponse.success , 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout:5)
        }
    
    func testGetCricketLeagueDetails(){
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.getCricketLeagueDetails(url: "\(Strings.BASEURL)\(Strings.CRICKET_ENDPOINT)/?met=\(Strings.EVENTS_ENDPOINT)&APIkey=\(Strings.API_KEY)&from=2024-03-13&to=2025-05-17&leagueId=733"){ cricketLeagueDetails in
            if let cricketLeagueDetails = cricketLeagueDetails {
                //Then
                XCTAssertEqual(cricketLeagueDetails.success , 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout:5)
        }
    
    func testGetTennisLeagueDetails(){
        //Given
        let exp = expectation(description: "loading")
        //When
        AlamofireFactory.getTennisLeagueDetails(url: "\(Strings.BASEURL)\(Strings.TENNIS_ENDPOINT)/?met=\(Strings.EVENTS_ENDPOINT)&APIkey=\(Strings.API_KEY)&from=2025-05-9&to=2025-05-18&countryId=281"){ tennisEventResponse in
            if let tennisEventResponse = tennisEventResponse {
                //Then
                XCTAssertEqual(tennisEventResponse.success, 1)
                exp.fulfill()
            } else
            {
                XCTFail()
            }
        }
        waitForExpectations(timeout:5)
        }

    }
