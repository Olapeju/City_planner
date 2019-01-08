//
//  CityCalculation.swift
//  CityPlanner
//
//  Created by Baid, Arhat Pushparaj on 3/1/18.
//  Copyright © 2018 Baid, Arhat Pushparaj. All rights reserved.
//

import Foundation


class CityCalculation {
    
    private var arrCity = [ModelCity]()
    private var arrGarbage = [ModelGarbage]()
    private var mGarbageBest : ModelGarbage = ModelGarbage()
    
    private let stateSize : Int = 25
    private let distanceForInfiniteUnhapiness : Double = 2.0
    private var isSettingValueForFirstTime :  Bool = true
    
    func addCityInList(_ posX: String?, _ posY: String?, _ population: String?) -> (Bool, String) {
        
       
        if let cityAPosX = Int(posX!) {
            if  let cityAPosY = Int(posY!) {
                if  let cityAPopulation = Int(population!) {
                    
                    //To avoid max value
                    if cityAPosX > 25{
                        return (false, "Value should be less than 25")
                    }
                    
                    if cityAPosY > 25{
                        return (false, "Value should be less than 25")
                    }
                    
                    if cityAPopulation > 100{
                        return (false, "Value should be less than 100")
                    }
                    
                    //To avoid min value
                    if cityAPosX < 1{
                        return (false, "Value should be more than 1")
                    }
                    
                    if cityAPosY < 1{
                       return (false, "Value should be more than 1")
                    }
                    
                    if cityAPopulation < 1{
                      return (false, "Value should be more than 1")
                    }
                    
                    for city in arrCity{
                        if (Int(posY!) == city.posY && Int(posX!) == city.posX) {
                            return (false, "Cannot assign same coordinates to multiple city")
                        }
                    }
                    
                    arrCity.append(ModelCity(cityAPopulation, cityAPosX, cityAPosY))
                    return (true, "")
                }else{
                    arrCity.removeAll()
                    return (false,"Wrong Population value")
                }
            }else{
                arrCity.removeAll()
                return (false, "Wrong Y coordinate value")
            }
        } else{
            arrCity.removeAll()
            return (false,"Wrong X coordinate value")
        }
    
    }
    
    func resetValues()   {
        arrGarbage.removeAll()
        arrCity.removeAll()
        mGarbageBest = ModelGarbage()
    }
    
    
    
    func calculateValue() -> ModelGarbage  {
    
        for indexX in 1...stateSize { //To traverse in x direction
            
            for indexY in 1...stateSize{ //To traverse in Y direction
            
                var unhapinessValue :  Double = 0.0
                var cityTotalPopulation :  Double = 0.0
                let mGarbage : ModelGarbage = ModelGarbage()
                
                for mCity in arrCity{ //To calculate for each city
                
                    let distance = calculateDiatnceBtwGarbageCity(indexX, indexY, mCity)
                    
                    if distance >= distanceForInfiniteUnhapiness{
                        unhapinessValue = unhapinessValue + Double(mCity.population) / (distance)
                        cityTotalPopulation = cityTotalPopulation + Double(mCity.population)
                    }else{
                        //Assigning -1 as infinite unhapiness value
                        mGarbage.unhapinessValue = -1
                        unhapinessValue = -1
                        break
                    }
                }
                //If unhapiness value is not -1 the calculate avg value and set all the value to the grabage object
                if unhapinessValue > 0{
                    unhapinessValue = unhapinessValue / Double(cityTotalPopulation)
                    mGarbage.unhapinessValue = unhapinessValue
                }
                mGarbage.posX = indexX
                mGarbage.posY = indexY
                
                arrGarbage.append(mGarbage)
                
                //Comparing the best value with the current
//                if (mGarbageBest.unhapinessValue > mGarbage.unhapinessValue  || isSettingValueForFirstTime) {
//                    isSettingValueForFirstTime = false
//                    mGarbageBest = mGarbage
//                }
            }
        }
        
        arrGarbage.sort { (garbage1: ModelGarbage, garbage2: ModelGarbage) -> Bool in
            return garbage1.unhapinessValue < garbage2.unhapinessValue
        }
        
        for garbage in arrGarbage {
            if(garbage.unhapinessValue > -1){
                mGarbageBest = garbage
                break
            }
        }
        
        return mGarbageBest
    }
    
    private func calculateDiatnceBtwGarbageCity(_ indexX: Int,_ indexY: Int,_ mCity: ModelCity) -> Double {
        return sqrt(pow(Double(indexX - mCity.posX), 2) + pow(Double(indexY - mCity.posY), 2))
    }
    
    
    
    
    
}
