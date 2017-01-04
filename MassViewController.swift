//
//  MassViewController.swift
//  Unit Converter
//
//  Created by Aaron Nash on 2016-12-27.
//  Copyright © 2016 Aaron Nash. All rights reserved.
//

import UIKit

class MassViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // We are putting this here so that we can use throught the whole class
    var unitsMass: NSDictionary = [:]
    // We are now going to define an NSAarray here
    var keysMass: NSArray!
    // MARK: Outlets
    
    @IBOutlet weak var inputMass: UITextField!
    @IBOutlet weak var resultMass: UILabel!
    @IBOutlet weak var unitFromMass: UIPickerView!
    @IBOutlet weak var unitToMass: UIPickerView!
    @IBOutlet weak var fakeButtonMass: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up the delegete of the inputMass to this class
        inputMass.delegate = self
        if (inputMass.text?.isEmpty)! {
            fakeButtonMass.isUserInteractionEnabled = false
        }
        // We now want to put all of the contents from unitsListMass.plist
        // I: Get a refrence to the app bundle
        let appBundle = Bundle.main
        // II: Get a refrence to the path that contains the unit
        let filePath = appBundle.path(forResource: "unitsListMass", ofType: "plist")!
        // We now are loading the content of the file into the dictioanary
        unitsMass = NSDictionary(contentsOfFile: filePath)!
        // Now we need to Initalize the keys with the names of the units
        keysMass = unitsMass.allKeys as NSArray
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
        // We want it to return the count of the unitsMass
        return unitsMass.count
    }
    // We are now telling the picker view what we want each row to say, so that the user will know which one to choose from.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // We want the titles for the row to be the key in the unitsListMass.plist file
        let keys = unitsMass.allKeys as NSArray
        
        let title = keys.object(at: row) as! String
        
        return title
    }
    // MARK: Convert Function
    
    @IBAction func convertButtonMass(_ sender: Any) {
        //I: Retrieve the numerical value from the input text feild
        let amountAsStringLegth = inputMass.text!
        let numberFormatterMass = NumberFormatter()
        let amountAsNumberMass = numberFormatterMass.number(from: amountAsStringLegth)
        let amountAsFloatMass = amountAsNumberMass?.floatValue
        //II: Retrieve the unit type that was selected
        let indexOfSelectedUnitFromMass = unitFromMass.selectedRow(inComponent: 0)
        let unitFromMassVar = keysMass.object(at: indexOfSelectedUnitFromMass) as! String
        //III: Retrieve the unit type that was selected to retrurn to
        let indexOfSelectedUnitToMass = unitToMass.selectedRow(inComponent: 0)
        let unitToMassVar = keysMass.object(at: indexOfSelectedUnitToMass) as! String
        //IV: Apply the two step conversion
        // Step I
        let conversionFactorToMass = unitsMass.value(forKey: unitFromMassVar) as! Float
        let resultAsMass = amountAsFloatMass! * conversionFactorToMass
        // Step II
        let conversionFactorFromMass = unitsMass.value(forKey: unitToMassVar) as! Float
        let result = resultAsMass / conversionFactorFromMass
        //V: Format the rsult as a a string
        let resultAsStringMass = String.localizedStringWithFormat("%.3f", result)
        //VI: Assign the result string to the resultMass label
        resultMass.text = resultAsStringMass
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
        fakeButtonMass.isUserInteractionEnabled = true
    }
}
