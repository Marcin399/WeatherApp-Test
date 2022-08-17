//
//  ViewModel.swift
//  iosApp
//
//  Created by Marcin on 15/08/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var arrayOfCitysAddToList : [APIResponseDataModel] = []
    @Published var allAviableCites : [cityListDataModel] = []
    @Published var searchText : String = ""
    @Published var networking = Networking()
    
    var searchResults: [cityListDataModel] {
        if searchText.isEmpty {
            return []
        } else {
            var searchResult : [cityListDataModel] = allAviableCites.filter { $0.name.lowercased().contains(searchText.lowercased())}
            if searchResult.count > 10 { searchResult.removeSubrange(10...(searchResult.count - 1)) }
            return searchResult
        }
    }
    
    func deleteCityFromList(_ indexSet: IndexSet){
        self.arrayOfCitysAddToList.remove(atOffsets: indexSet)
    }
    
    func parseData() -> [cityListDataModel]{
        guard let path = Bundle.main.path(forResource: "AviableCountrysList", ofType: "json") else { return [] }
        let URL = URL(fileURLWithPath: path)
        var result : [cityListDataModel]?
        do { let jsonData = try Data(contentsOf: URL)
            result = try JSONDecoder().decode([cityListDataModel].self, from: jsonData)
        } catch { print(error) }
        return result!
    }
    
    func searchListAction(_ city: String){
        self.searchText = ""
        self.networking.fetchData(city.replacingOccurrences(of: " ", with: "%20").lowercased(), { [weak self] returndata in
            self?.arrayOfCitysAddToList.append(returndata)
        })
    }
}

