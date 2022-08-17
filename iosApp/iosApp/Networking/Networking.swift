//
//  Networking.swift
//  iosApp
//
//  Created by Marcin on 15/08/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Alamofire
import Foundation
import shared

class Networking {
    
    func fetchData(_ city :String, _ completionhandler: @escaping (_ data : APIResponseDataModel) -> ()) {
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=45bc59854b598288f7a5e310e4a6dd7f"
        AF.request(url)
            .responseDecodable(of: APIResponseDataModel.self) { response in
                switch response.result {
                case .success(let JSON):
                    completionhandler(JSON)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
