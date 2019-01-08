//
//  ModelCity.swift
//  CityPlanner
//
//  Created by Baid, Arhat Pushparaj on 3/1/18.
//  Copyright © 2018 Baid, Arhat Pushparaj. All rights reserved.
//

import Foundation

class ModelCity {
    var population : Int = 0
    var posX : Int = 0
    var posY : Int = 0
    
    init(_ population : Int,_ posX: Int, _ posY: Int){
        self.population = population * 1000
        self.posX = posX
        self.posY = posY
    }
}



