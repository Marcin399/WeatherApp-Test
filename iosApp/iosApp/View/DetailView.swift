//
//  DetailView.swift
//  iosApp
//
//  Created by Marcin on 15/08/2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct DetailView: View{
    
    @State var oneCityDataForDetailView : APIResponseDataModel
    
    var body : some View{
        VStack {
            Spacer()
            Text("\(Int(oneCityDataForDetailView.main.temp))°C")
                .fontWeight(.heavy)
                .font(.system(size: 85))
           Spacer()
            Text(oneCityDataForDetailView.name)
                .fontWeight(.heavy)
            Spacer()
        }
    }
}

