//
//  ViewController.swift
//  CityPlanner
//
//  Created by Baid, Arhat Pushparaj on 2/28/18.
//  Copyright © 2018 Baid, Arhat Pushparaj. All rights reserved.
//
/*
 Things to do
 ->Edittext validation an sync with the stepper.
 ->Edittext sync with the slider
 ->Show the alert dialog for wringinput values
 */

import UIKit

class CityPlannerViewController: UIViewController, UITextFieldDelegate {
    
    //Starting welcome text
    @IBOutlet weak var lblWelcome: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    //=========City A====================
    @IBOutlet weak var txtCityACordX: UITextField!
    @IBOutlet weak var txtCityACordY: UITextField!
    @IBOutlet weak var txtCityAPopulation: UITextField!
    @IBOutlet weak var stepCityACordX: UIStepper!
    @IBAction func stepCityACordX(_ sender: UIStepper) {
    
        txtCityACordX.text = String(Int(sender.value))
    
    }
    @IBOutlet weak var stepCityACordY: UIStepper!
    @IBAction func stepCityACordY(_ sender: UIStepper) {
        
        txtCityACordY.text = String(Int(sender.value))
        
    }
    @IBOutlet weak var slidCityAPopulation: UISlider!
    @IBAction func slidCityAPopulation(_ sender: UISlider) {
        
        txtCityAPopulation.text = String(Int(sender.value))
        
    }
    
    //===========City B============
    @IBOutlet weak var txtCityBCordX: UITextField!
    @IBOutlet weak var txtCityBCordY: UITextField!
    @IBOutlet weak var txtCityBPopulation: UITextField!
    @IBOutlet weak var stepCityBCordX: UIStepper!
    @IBAction func stepCityBCordX(_ sender: UIStepper) {
        
        txtCityBCordX.text = String(Int(sender.value))
        
    }
    @IBOutlet weak var stepCityBCordY: UIStepper!
    @IBAction func stepCityBCordY(_ sender: UIStepper) {
        
        txtCityBCordY.text = String(Int(sender.value))
        
    }
    @IBOutlet weak var slidCityBPopulation: UISlider!
    @IBAction func slidCityBPopulation(_ sender: UISlider) {
        
        txtCityBPopulation.text = String(Int(sender.value))
        
    }
    
    //============City C=========
    @IBOutlet weak var txtCityCCordX: UITextField!
    @IBOutlet weak var txtCityCCordY: UITextField!
    @IBOutlet weak var txtCityCPopulation: UITextField!
    @IBOutlet weak var stepCityCCordX: UIStepper!
    @IBAction func stepCityCCordX(_ sender: UIStepper) {
        
        txtCityCCordX.text = String(Int(sender.value))
        
    }
    @IBOutlet weak var stepCityCCordY: UIStepper!
    @IBAction func stepCityCCordY(_ sender: UIStepper) {
        
        txtCityCCordY.text = String(Int(sender.value))
        
    }
    @IBOutlet weak var slidCityCPopulation: UISlider!
    @IBAction func slidCityCPopulation(_ sender: UISlider) {
        
        txtCityCPopulation.text = String(Int(sender.value))
        
    }
    
    //============City D===========
    @IBOutlet weak var txtCityDCordX: UITextField!
    @IBOutlet weak var txtCityDCordY: UITextField!
    @IBOutlet weak var txtCityDPopulation: UITextField!
    @IBOutlet weak var stepCityDCordX: UIStepper!
    @IBAction func stepCityDCordX(_ sender: UIStepper) {
        
        txtCityDCordX.text = String(Int(sender.value))
        
    }
    @IBOutlet weak var stepCityDCordY: UIStepper!
    @IBAction func stepCityDCordY(_ sender: UIStepper) {
        
        txtCityDCordY.text = String(Int(sender.value))
        
    }
    @IBOutlet weak var slidCityDPopulation: UISlider!
    @IBAction func slidCityDPopulation(_ sender: UISlider) {
        
        txtCityDPopulation.text = String(Int(sender.value))
        
    }
    
    @IBAction func btnStart(_ sender: UIButton) {
        //Can add the animation here
        lblWelcome.isHidden = true
        sender.isHidden = true
        scrollView.isHidden = false
    }
   
    var mCityCalculation = CityCalculation()
    
    //Start the calculation of unhapiness level
    @IBAction func calcuateUnhapiness(_ sender: UIButton) {
        
        mCityCalculation.resetValues()
        
        //Adding values for City A, B, C & D
        let (isCityAAdded, errorA): (Bool, String) = mCityCalculation.addCityInList(txtCityACordX.text, txtCityACordY.text, txtCityAPopulation.text)
        if  !isCityAAdded {
            alertDilaog(msg: errorA)
            return
        }
        
        let (isCityBAdded, errorB): (Bool, String) = mCityCalculation.addCityInList(txtCityBCordX.text, txtCityBCordY.text, txtCityBPopulation.text)
        if  !isCityBAdded {
            alertDilaog(msg: errorB)
            return
        }
        
        let (isCityCAdded, errorC): (Bool, String) = mCityCalculation.addCityInList(txtCityCCordX.text, txtCityCCordY.text, txtCityCPopulation.text)
        if  !isCityCAdded {
            alertDilaog(msg: errorC)
            return
        }
        
        let (isCityDAdded, errorD): (Bool, String) = mCityCalculation.addCityInList(txtCityDCordX.text, txtCityDCordY.text, txtCityDPopulation.text)
        if  !isCityDAdded {
            alertDilaog(msg: errorD)
            return
        }
        
        
        //Calculating unhapiness value
        let mGarbageModel: ModelGarbage = mCityCalculation.calculateValue()
    
        lblBestUnhappinessValue.isHidden = false
        lblBestCordniates.isHidden = false
        imageview.isHidden = false
        
        lblBestCordniates.text = "Cordinates: (X = \(mGarbageModel.posX), Y = \(mGarbageModel.posY))"
        lblBestUnhappinessValue.text =  String(format: "Unhappiness value:  =  %.4f", mGarbageModel.unhapinessValue)
        imageview.image = UIImage(named: "recovery.png")
    }
    
    @IBAction func resetCalculation(_ sender: UIButton) {
        
        mCityCalculation.resetValues()
        
        lblBestUnhappinessValue.isHidden = true
        lblBestCordniates.isHidden = true
        imageview.isHidden = true
        
        txtCityACordX.text = "1"
        stepCityACordX!.value = 1.0
        txtCityACordY.text = "1"
        stepCityACordY!.value = 1.0
        txtCityBCordX.text = "1"
        stepCityBCordX!.value = 1.0
        txtCityBCordY.text = "1"
        stepCityBCordY!.value = 1.0
        txtCityCCordX.text = "1"
        stepCityCCordX!.value = 1.0
        txtCityCCordY.text = "1"
        stepCityCCordY!.value = 1.0
        txtCityDCordX.text = "1"
        stepCityDCordX!.value = 1.0
        txtCityDCordY.text = "1"
        stepCityDCordY!.value = 1.0
        txtCityAPopulation.text = "1"
        slidCityAPopulation!.value = 1.0
        txtCityBPopulation.text = "1"
        slidCityBPopulation!.value = 1.0
        txtCityCPopulation.text = "1"
        slidCityCPopulation!.value = 1.0
        txtCityDPopulation.text = "1"
        slidCityDPopulation!.value = 1.0
    }
    
    
    @IBOutlet weak var lblBestCordniates: UILabel!
    @IBOutlet weak var lblBestUnhappinessValue: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.isHidden = false
        scrollView.isHidden = true
        changeLableBorderColor()
    }
    
    func changeLableBorderColor(){
        let myColor = UIColor.red
        txtCityACordX.layer.borderColor = myColor.cgColor
        txtCityACordY.layer.borderColor = myColor.cgColor
        txtCityBCordX.layer.borderColor = myColor.cgColor
        txtCityBCordY.layer.borderColor = myColor.cgColor
        txtCityCCordX.layer.borderColor = myColor.cgColor
        txtCityCCordY.layer.borderColor = myColor.cgColor
        txtCityDCordX.layer.borderColor = myColor.cgColor
        txtCityDCordY.layer.borderColor = myColor.cgColor
        txtCityAPopulation.layer.borderColor = myColor.cgColor
        txtCityBPopulation.layer.borderColor = myColor.cgColor
        txtCityCPopulation.layer.borderColor = myColor.cgColor
        txtCityDPopulation.layer.borderColor = myColor.cgColor
        
        let borderWidth : CGFloat = 1.0
        txtCityACordX.layer.borderWidth = borderWidth
        txtCityACordY.layer.borderWidth = borderWidth
        txtCityBCordX.layer.borderWidth = borderWidth
        txtCityBCordY.layer.borderWidth = borderWidth
        txtCityCCordX.layer.borderWidth = borderWidth
        txtCityCCordY.layer.borderWidth = borderWidth
        txtCityDCordX.layer.borderWidth = borderWidth
        txtCityDCordY.layer.borderWidth = borderWidth
        txtCityAPopulation.layer.borderWidth = borderWidth
        txtCityBPopulation.layer.borderWidth = borderWidth
        txtCityCPopulation.layer.borderWidth = borderWidth
        txtCityDPopulation.layer.borderWidth = borderWidth
    }
    
    
    func alertDilaog(msg: String) {
        let alert = UIAlertController(title: "Alert", message:msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Close", style: .default, handler: { _ in}))
        self.present(alert, animated: true, completion: {})
    }
}

