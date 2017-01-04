//
//  VolumeViewController.swift
//  Unit Converter
//
//  Created by Aaron Nash on 2016-12-16.
//  Copyright © 2017 Aaron Nash. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // We are putting this here so that we can use throught the whole class
    var unitsVolume: NSDictionary = [:]
    // We are now going to define an NSAarray here
    var keysVolume: NSArray!
    // MARK: Outlets
    
    @IBOutlet weak var inputVolume: UITextField!
    @IBOutlet weak var resultVolume: UILabel!
    @IBOutlet weak var unitFromVolume: UIPickerView!
    @IBOutlet weak var unitToVolume: UIPickerView!
    @IBOutlet weak var fakeButtonVolume: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up the delegete of the inputVolume to this class
        inputVolume.delegate = self
        if (inputVolume.text?.isEmpty)! {
            fakeButtonVolume.isUserInteractionEnabled = false
        }
        // We now want to put all of the contents from unitsListVolume.plist into the picker view
        // I: Get a refrence to the app bundle
        let appBundle = Bundle.main
        // II: Get a refrence to the path that contains the unit
        let filePath = appBundle.path(forResource: "unitsListVolume", ofType: "plist")!
        // We now are loading the content of the file into the dictioanary
        unitsVolume = NSDictionary(contentsOfFile: filePath)!
        // Now we need to Initalize the keys with the names of the units
        keysVolume = unitsVolume.allKeys as NSArray
    }
    // MARK: Functions
    // MARK: Sort Function
    // This is the function that is used to sort the keys
    func sortKeys(first: AnyObject, second: AnyObject) -> Bool {
        let firstKey = first as! String
        let secondKey = second as! String
        let comparison = firstKey.caseInsensitiveCompare(secondKey) == ComparisonResult.orderedAscending
        // We want it to compare based on their position on the list
        return comparison
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Delegets and Data sources
    // We shall now be stating the actuall properties of the picker view and how we want it to act
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // We only want it to construct 1 component
        return 1
    }
    // We are now telling the picker view how many rows we want it to show us.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // We want it to return the count of the unitsVolume
        return unitsVolume.count
    }
    // We are now telling the picker view what we want each row to say, so that the user will know which one to choose from.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // We want the titles for the row to be the key in the unitsListVolume.plist file
        let keys = unitsVolume.allKeys as NSArray
        
        let title = keys.object(at: row) as! String
        
        return title
    }
    // MARK: Convert Function
    @IBAction func convertButtonVolume(_ sender: Any) {
        //I: Retrieve the numerical value from the input text feild
        let amountAsStringLegth = inputVolume.text!
        let numberFormatterVolume = NumberFormatter()
        let amountAsNumberVolume = numberFormatterVolume.number(from: amountAsStringLegth)
        let amountAsFloatVolume = amountAsNumberVolume?.floatValue
        //II: Retrieve the unit type that was selected
        let indexOfSelectedUnitFromVolume = unitFromVolume.selectedRow(inComponent: 0)
        let unitFromVolumeVar = keysVolume.object(at: indexOfSelectedUnitFromVolume) as! String
        //III: Retrieve the unit type that was selected to retrurn to
        let indexOfSelectedUnitToVolume = unitToVolume.selectedRow(inComponent: 0)
        let unitToVolumeVar = keysVolume.object(at: indexOfSelectedUnitToVolume) as! String
        //IV: Apply the two step conversion
        // Step I
        let conversionFactorToVolume = unitsVolume.value(forKey: unitFromVolumeVar) as! Float
        let resultAsVolume = amountAsFloatVolume! * conversionFactorToVolume
        // Step II
        let conversionFactorFromVolume = unitsVolume.value(forKey: unitToVolumeVar) as! Float
        let result = resultAsVolume / conversionFactorFromVolume
        //V: Format the rsult as a a string
        let resultAsStringVolume = String.localizedStringWithFormat("%.3f", result)
        //VI: Assign the result string to the resultVolume label
        resultVolume.text = resultAsStringVolume
        // The end of the function
        
    }
    
    // MARK: Keyboard close function
    //This is a function to close the keyboard
    func closeKeyBoard(){
        self.view.endEditing(true)
    }
    // This function overides the previus function
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closeKeyBoard()
    }
    // MARK: Function for disabling button through the fake button
    func textFieldDidBeginEditing(_ textField: UITextField) {
        fakeButtonVolume.isUserInteractionEnabled = true
    }
}
