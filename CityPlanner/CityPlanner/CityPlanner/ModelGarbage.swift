//
//  ModelGarbage.swift
//  CityPlanner
//
//  Created by Baid, Arhat Pushparaj on 3/1/18.
//  Copyright © 2018 Baid, Arhat Pushparaj. All rights reserved.
//

import Foundation

class ModelGarbage {
    
    var unhapinessValue : Double = 0
    var posX : Int = 0
    var posY : Int = 0
    
    init(){
        
    }
    
    init(_ unhapinessValue : Double,_ posX: Int, _ posY: Int){
        self.unhapinessValue = unhapinessValue
        self.posX = posX
        self.posY = posY
    }
}
