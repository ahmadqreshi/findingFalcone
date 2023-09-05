//
//  FindingFalconeTests.swift
//  FindingFalconeTests
//
//  Created by Admin on 27/08/23.
//

import XCTest
@testable import FindingFalcone

final class FindingFalconeTests: XCTestCase {
    
    private var destination1: PlanetModel!
    private var destination2: PlanetModel!
    private var destination3: PlanetModel!
    private var destination4: PlanetModel!
    
    private var destination1Vehicle: VehicleModel!
    private var destination2Vehicle: VehicleModel!
    private var destination3Vehicle: VehicleModel!
    private var destination4Vehicle: VehicleModel!
    
    private var viewModel: MainViewModel!
    override func setUpWithError() throws {
        viewModel = MainViewModel()
        destination1 = .initialize()
        destination2 = .initialize()
        destination3 = .initialize()
        destination4 = .initialize()
        destination1Vehicle = .initialize()
        destination2Vehicle = .initialize()
        destination3Vehicle = .initialize()
        destination4Vehicle = .initialize()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        destination1 = nil
        destination2 = nil
        destination3 = nil
        destination4 = nil
        destination1Vehicle = nil
        destination2Vehicle = nil
        destination3Vehicle = nil
        destination4Vehicle = nil
    }

    
    func testDestinationsVariables() {
        XCTAssertEqual(destination1, viewModel.destination1)
        XCTAssertEqual(destination2, viewModel.destination2)
        XCTAssertEqual(destination3, viewModel.destination3)
        XCTAssertEqual(destination4, viewModel.destination4)
    }
    
    func testVehiclesVariables() {
        XCTAssertEqual(destination1Vehicle, viewModel.destination1Vehicle)
        XCTAssertEqual(destination2Vehicle, viewModel.destination2Vehicle)
        XCTAssertEqual(destination3Vehicle, viewModel.destination3Vehicle)
        XCTAssertEqual(destination4Vehicle, viewModel.destination4Vehicle)
    }
    
    func testDescreaseVehicleNumber() {
        viewModel.decreaseVehicleNumber(vehicle: destination1Vehicle)
        XCTAssertEqual(destination1Vehicle.totalNo, 0)
    }
    
    func testFindEnable() {
         XCTAssertFalse(viewModel.isFindEnable)
    }
}
