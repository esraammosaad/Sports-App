# SportaSphere - IOS APP ⚽️

#### An IOS APP to explore sports leagues, events, teams, and players for Football, Basketball, Tennis, and Cricket.

---

##  Features

- Onboarding with 3 screens using Page Controller and UserDefaults.
- Main sports displayed in a CollectionView with custom XIB/Nib cells.
- Leagues screen for each sport.
- League details screen shows:
  - Upcoming Events
  - Latest Events
  - Teams
- Team details screen shows players.
- Core Data used to save favorite leagues.
- Handles internet connection with Reachability.
- Smooth navigation and adaptive constraints.
- Unit testing for API service using:
  - XCTestExpectation for async Alamofire requests.
  - Mocking API responses.

---

## Technologies Used

- Swift
- Storyboard & Auto Layout
- MVP Architecture
- Alamofire (Networking)
- Reachability (Network check)
- Core Data (Persistence)
- XIB/Nib files (Reusable UI)
- UICollectionView with Compositional Layout
- XCTest (Unit Testing)
