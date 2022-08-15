//
//  DataModel.swift
//  iosApp
//
//  Created by Marcin on 15/08/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation

struct cityListDataModel: Decodable, Identifiable {
    var id : Int
    var name : String
    var country : String
}

struct APIResponseDataModel: Decodable, Identifiable {
    let id = UUID()
    var main : main
    var name : String
}

struct main : Decodable {
    var temp : Double
   
}
