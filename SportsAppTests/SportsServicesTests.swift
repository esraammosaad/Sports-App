//
//  SportsServicesTests.swift
//  SportsAppTests
//
//  Created by Esraa Mohammed Mosaad on 20/05/2025.
//

import XCTest
@testable import SportsApp



final class SportsServicesTests: XCTestCase {
    
    var sportsServices : SportsServicesProtocol!


    override func setUpWithError() throws {
        
         sportsServices  = SportsServices()

    }

    override func tearDownWithError() throws {
        
        sportsServices = nil
    }
    
    func testGetFootballLeagues(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getLeagues(sportType: Strings.FOOTBALL_ENDPOINT){
            leaguesResponse in
            if let leaguesResponseCode = leaguesResponse?.success {
                //Then
                XCTAssertEqual(leaguesResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetBasketballLeagues(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getLeagues(sportType: Strings.BASKETBALL_ENDPOINT){
            leaguesResponse in
            if let leaguesResponseCode = leaguesResponse?.success {
                //Then
                XCTAssertEqual(leaguesResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }
    func testGetTennisLeagues(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getLeagues(sportType: Strings.TENNIS_ENDPOINT){
            leaguesResponse in
            if let leaguesResponseCode = leaguesResponse?.success {
                //Then
                XCTAssertEqual(leaguesResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }
    func testGetCricketLeagues(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getLeagues(sportType: Strings.CRICKET_ENDPOINT){
            leaguesResponse in
            if let leaguesResponseCode = leaguesResponse?.success {
                //Then
                XCTAssertEqual(leaguesResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetFootballLeagueDetails(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getLeagueDetails(sportType: Strings.FOOTBALL_ENDPOINT, leagueID: 4  ){
            leagueDetailsResponse in
            if let leagueDetailsResponseCode = leagueDetailsResponse?.success {
                //Then
                XCTAssertEqual(leagueDetailsResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetBasketballLeagueDetails(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getLeagueDetails(sportType: Strings.BASKETBALL_ENDPOINT, leagueID: 4  ){
            leagueDetailsResponse in
            if let leagueDetailsResponseCode = leagueDetailsResponse?.success {
                //Then
                XCTAssertEqual(leagueDetailsResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }
    func testGetTennisLeagueDetails(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getTenniseLeagueDetails(countryID: 281){
            tenniseLeagueDetailsResponse in
            if let tenniseLeagueDetailsResponseCode = tenniseLeagueDetailsResponse?.success {
                //Then
                XCTAssertEqual(tenniseLeagueDetailsResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }
    func testGetCricketLeagueDetails(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getCricketLeagueDetails(leagueID: 4){
            leagueDetailsResponse in
            if let cricketLeagueDetailsResponseCode = leagueDetailsResponse?.success {
                //Then
                XCTAssertEqual(cricketLeagueDetailsResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetFootballLeagueTeams(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getLeagueTeams(sportType: Strings.FOOTBALL_ENDPOINT, leagueID: 4){
            leagueTeamsResponse in
            if let leagueTeamsResponseCode = leagueTeamsResponse?.success {
                //Then
                XCTAssertEqual(leagueTeamsResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }
    func testGetBasketballLeagueTeams(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getLeagueTeams(sportType: Strings.BASKETBALL_ENDPOINT, leagueID: 4){
            leagueTeamsResponse in
            if let leagueTeamsResponseCode = leagueTeamsResponse?.success {
                //Then
                XCTAssertEqual(leagueTeamsResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }

    func testGetCricketLeagueTeams(){
        //Given
        let exp = expectation(description: "loading")
        //When
        sportsServices.getLeagueTeams(sportType: Strings.CRICKET_ENDPOINT, leagueID: 4){
            leagueTeamsResponse in
            if let leagueTeamsResponseCode = leagueTeamsResponse?.success {
                //Then
                XCTAssertEqual(leagueTeamsResponseCode, 1)
                exp.fulfill()
                } else{
                    
                    XCTFail()
                }
        }
        waitForExpectations(timeout: 5)
    }


}
