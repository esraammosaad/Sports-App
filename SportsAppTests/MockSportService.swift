//
//  MockSportService.swift
//  SportsAppTests
//
//  Created by Macos on 20/05/2025.
//

import XCTest
@testable import SportsApp

final class MockSportService: XCTestCase {
    
    var fakeSportService : SportsServicesProtocol!
    
    override func setUpWithError() throws {
        
        fakeSportService = FakeSportsServices(shouldReturnError: false)
    }
    
    override func tearDownWithError() throws {
        
        fakeSportService = nil
        
    }
    
    func testFakeGetLeagues(){
        
        //Given
        
        //When
        fakeSportService.getLeagues(sportType: "")
        { response  in
            if response == nil{
                XCTFail()
            }
            else{
                //Then
                XCTAssertNotNil(response)
            }
            
        }
    }
    
    func testFakeGetLeagueDetails(){
        //Given
        
        //When
        fakeSportService.getLeagueDetails(sportType: "", leagueID: 1 )
        { response  in
            if response == nil{
                XCTFail()
            }
            else{
                //Then
                XCTAssertNotNil(response)
            }
            
        }
    }
    
    func testFakeGetLeagueTeams(){
        //Given
        
        //When
        fakeSportService.getLeagueTeams(sportType: "", leagueID: 1 )
        { response  in
            if response == nil{
                XCTFail()
            }
            else{
                //Then
                XCTAssertNotNil(response)
            }
        }
    }
    
    func testFakeGetCricketLeagueDetails(){
        //Given
        
        //When
        fakeSportService.getCricketLeagueDetails(leagueID: 1 )
        { response  in
            if response == nil{
                XCTFail()
            }
            else{
                //Then
                XCTAssertNotNil(response)
            }
        }
    }
    
    func testFakeGetTenniseLeagueDetails(){
        //Given
        
        //When
        fakeSportService.getTenniseLeagueDetails(countryID:  1 )
        { response  in
            if response == nil{
                XCTFail()
            }
            else{
                //Then
                XCTAssertNotNil(response)
            }
        }
    }
}
