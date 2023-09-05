//
//  MainViewModel.swift
//  FindingFalcone
//
//  Created by Admin on 27/08/23.
//

import Foundation

class MainViewModel: ObservableObject {
    
    //MARK: - Variables
    
    /// Selected Destinations/Planets
    @Published var destination1: PlanetModel = .initialize() {
        didSet {
            removePlanetsFromList(planet: destination1)
        }
    }
    @Published var destination2: PlanetModel = .initialize()  {
        didSet {
            removePlanetsFromList(planet: destination2)
        }
    }
    @Published var destination3: PlanetModel = .initialize()  {
        didSet {
            removePlanetsFromList(planet: destination3)
        }
    }
    @Published var destination4: PlanetModel = .initialize()  {
        didSet {
           removePlanetsFromList(planet: destination4)
        }
    }
    
    /// Selected Vehicles for corresponding Destination
    @Published var destination1Vehicle: VehicleModel = .initialize() {
        didSet {
            if destination1.distance <= destination1Vehicle.maxDistance {
                timeTaken += destination1.distance / destination1Vehicle.speed
                decreaseVehicleNumber(vehicle: destination1Vehicle)
            }
            
        }
    }
    
    @Published var destination2Vehicle: VehicleModel = .initialize() {
        didSet {
            if destination2.distance <= destination2Vehicle.maxDistance {
                timeTaken += destination2.distance / destination2Vehicle.speed
                decreaseVehicleNumber(vehicle: destination2Vehicle)
            }
        }
    }
    @Published var destination3Vehicle: VehicleModel = .initialize() {
        didSet {
            if destination3.distance <= destination3Vehicle.maxDistance {
                timeTaken += destination3.distance / destination3Vehicle.speed
                decreaseVehicleNumber(vehicle: destination3Vehicle)
            }
        }
    }
    
    @Published var destination4Vehicle: VehicleModel = .initialize() {
        didSet {
            if destination4.distance <= destination4Vehicle.maxDistance {
                timeTaken += destination4.distance / destination4Vehicle.speed
                decreaseVehicleNumber(vehicle: destination4Vehicle)
            }
        }
    }
    
    
    /// Destinations and Vehicles List
    @Published var destinations: [PlanetModel] = []
    @Published var vehicles: [VehicleModel] = []
    
    
    /// variable for showing  progress view during api call
    @Published var showLoader: Bool = true
    
    /// variable for tracking timeTaken
    @Published var timeTaken: Int = Int()
    
    /// variable for storing result
    @Published var result: FindFalconeModel?
    
    /// varibale for storing error recieved from api
    @Published var apiResponseError: String?
    
    /// variable for navigating to result view
    @Published var navigateToResultView: Bool = false

    ///  data repository to call APIs
    private var dataRepository: DataRepository = DataRepository()
    

    ///  variable to store token
    private var token: String = String()
    
    init() {
        getVehiclesList()
        storeToken()
    }
    
    //MARK: - Reset Values
    func resetValues() {
        destination1 = .initialize()
        destination2 = .initialize()
        destination3 = .initialize()
        destination4 = .initialize()
        destination1Vehicle = .initialize()
        destination2Vehicle = .initialize()
        destination3Vehicle = .initialize()
        destination4Vehicle = .initialize()
        timeTaken = Int()
        getVehiclesList()
        storeToken()
        showLoader = true
    }
    
    
    //MARK: - Populate vehicle list
    private func getVehiclesList() {
        dataRepository.getVehiclesList { [weak self] (response) in
            DispatchQueue.main.async {
                self?.vehicles = response
                self?.getPlanetslist()
            }
        } failure: { error in
            debugPrint(error)
        }
    }
    
    //MARK: - Populate planet list
    private func getPlanetslist() {
        dataRepository.getPlanetsList { [weak self] (response) in
            DispatchQueue.main.async {
                self?.destinations = response
                self?.showLoader = false
            }
        } failure: { error in
            debugPrint(error)
        }
    }
    
    //MARK: - Populate store token
    private func storeToken() {
        dataRepository.getToken { [weak self] (response) in
            DispatchQueue.main.async {
                self?.token = response.token
            }
        } failure: {  error in
            debugPrint(error)
        }
    }
    
    //MARK: - Maintain vehicles numbers globally
    func decreaseVehicleNumber(vehicle: VehicleModel) {
        guard let index = vehicles.firstIndex(where: { info in
            return vehicle.name == info.name
        }) else { return }
        if vehicles[index].totalNo > 0 {
            vehicles[index].totalNo -= 1
        }
    }
    
    //MARK: - Finding Falcone logic and API call
    func findFalcone() {
        var planetNames: [String] = []
        planetNames.append(contentsOf: [destination1.name, destination2.name, destination3.name, destination4.name])
        
        var vehicleNames: [String] = []
        vehicleNames.append(contentsOf: [destination1Vehicle.name, destination2Vehicle.name, destination3Vehicle.name, destination4Vehicle.name])

        dataRepository.findFalcone(token: token, planetNames: planetNames , vehicleNames: vehicleNames) { [weak self] (response) in
            DispatchQueue.main.async {
                self?.showLoader = false
                self?.navigateToResultView = true
                self?.result = response
            }
            
        } failure: { [weak self] (error) in
            DispatchQueue.main.async {
                self?.showLoader = false
                self?.apiResponseError = error
                self?.navigateToResultView = true
            }
        }
    }
    
    //MARK: - variable to enable finding falcone button
    var isFindEnable: Bool {
        !destination1.name.isEmpty && !destination1Vehicle.name.isEmpty && !destination2.name.isEmpty && !destination2Vehicle.name.isEmpty && !destination3.name.isEmpty && !destination3Vehicle.name.isEmpty && !destination4.name.isEmpty && !destination4Vehicle.name.isEmpty
    }
    
    //MARK: - Remove selected planet from list
    func removePlanetsFromList(planet: PlanetModel) {
        if let index = destinations.firstIndex(where: { info in
            return planet.name == info.name
        }) {
            destinations.remove(at: index)
        }
    }
}
