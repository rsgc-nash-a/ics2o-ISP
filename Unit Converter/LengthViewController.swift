//
//  LengthViewController.swift
//  Unit Converter
//
//  Created by Aaron Nash on 2016-12-16.
//  Copyright ©2017 Aaron Nash. All rights reserved.
//

import UIKit

class LengthViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    // We are putting this here so that we can use throught the whole class
    var unitsLength: NSDictionary = [:]
    // We are now going to define an NSAarray here
    var keysLength: NSArray!
    // MARK: Outlets
    
    @IBOutlet weak var inputLength: UITextField!
    @IBOutlet weak var resultLength: UILabel!
    @IBOutlet weak var unitFromLength: UIPickerView!
    @IBOutlet weak var unitToLength: UIPickerView!
    @IBOutlet weak var fakeButtonLength: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up the delegete of the inputLength to this class
        inputLength.delegate = self
        if (inputLength.text?.isEmpty)! {
            fakeButtonLength.isUserInteractionEnabled = false
        }
        // We now want to put all of the contents from unitsListLength.plist
        // I: Get a refrence to the app bundle
        let appBundle = Bundle.main
        // II: Get a refrence to the path that contains the unit
        let filePath = appBundle.path(forResource: "unitsListLength", ofType: "plist")!
        // We now are loading the content of the file into the dictioanary
        unitsLength = NSDictionary(contentsOfFile: filePath)!
        // Now we need to Initalize the keys with the names of the units
        keysLength = unitsLength.allKeys as NSArray
        // Sort the alf keys in ascending order
        //keysLength = keysLength.sort(sortKeys)
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
        // We want it to return the count of the unitsLength
        return unitsLength.count
    }
    // We are now telling the picker view what we want each row to say, so that the user will know which one to choose from.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    // We want the titles for the row to be the key in the unitsListLength.plist file
        let keys = unitsLength.allKeys as NSArray
        
        let title = keys.object(at: row) as! String
        
        return title
    }
    // MARK: Convert Function
    @IBAction func convertButtonLength(_ sender: Any) {
        //I: Retrieve the numerical value from the input text feild
        let amountAsStringLegth = inputLength.text!
        let numberFormatterLength = NumberFormatter()
        let amountAsNumberLength = numberFormatterLength.number(from: amountAsStringLegth)
        let amountAsFloatLength = amountAsNumberLength?.floatValue
        //II: Retrieve the unit type that was selected
        let indexOfSelectedUnitFromLength = unitFromLength.selectedRow(inComponent: 0)
        let unitFromLengthVar = keysLength.object(at: indexOfSelectedUnitFromLength) as! String
        //III: Retrieve the unit type that was selected to retrurn to
        let indexOfSelectedUnitToLength = unitToLength.selectedRow(inComponent: 0)
        let unitToLengthVar = keysLength.object(at: indexOfSelectedUnitToLength) as! String
        //IV: Apply the two step conversion
        // We are first testing it out on inches
        // Step I
        let conversionFactorToInch = unitsLength.value(forKey: unitFromLengthVar) as! Float
        let resultAsInches = amountAsFloatLength! * conversionFactorToInch
        // Step II
        let conversionFactorFromInch = unitsLength.value(forKey: unitToLengthVar) as! Float
        let result = resultAsInches / conversionFactorFromInch
        // We are now making the actual function for the rest of the units
        //V: Format the result as a string
        let resultAsStringLength = String.localizedStringWithFormat("%.3f", result)
        //VI: Assign the result string to the resultLength label
        resultLength.text = resultAsStringLength
        // After testing, I now know that this whole conversion function works with ALL units in the .plist for conversion! 😀😀
        // I do not need to write a whole conversion factor for every unit! Horray!
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
        fakeButtonLength.isUserInteractionEnabled = true
    }
    

   }
 
