//
//  AreaViewController.swift
//  Unit Converter
//
//  Created by Aaron Nash on 2016-12-16.
//  Copyright © 2017 Aaron Nash. All rights reserved.
//
import UIKit

class AreaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // We are putting this here so that we can use throught the whole class
    var unitsArea: NSDictionary = [:]
    // We are now going to define an NSAarray here
    var keysArea: NSArray!
    // MARK: Outlets
    
    @IBOutlet weak var inputArea: UITextField!
    @IBOutlet weak var resultArea: UILabel!
    @IBOutlet weak var unitFromArea: UIPickerView!
    @IBOutlet weak var unitToArea: UIPickerView!
    @IBOutlet weak var fakeButtonArea: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting the delegete of inputArea to this class
        inputArea.delegate = self
        if (inputArea.text?.isEmpty)! {
            fakeButtonArea.isUserInteractionEnabled = false
        }
        // We now want to put all of the contents from unitsListArea.plist
        // I: Get a refrence to the app bundle
        let appBundle = Bundle.main
        // II: Get a refrence to the path that contains the unit
        let filePath = appBundle.path(forResource: "unitsListArea", ofType: "plist")!
        // We now are loading the content of the file into the dictioanary
        unitsArea = NSDictionary(contentsOfFile: filePath)!
        // Now we need to Initalize the keys with the names of the units
        keysArea = unitsArea.allKeys as NSArray
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
        // We want it to return the count of the unitsArea
        return unitsArea.count
    }
    // We are now telling the picker view what we want each row to say, so that the user will know which one to choose from.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // We want the titles for the row to be the key in the unitsListArea.plist file
        let keys = unitsArea.allKeys as NSArray
        
        let title = keys.object(at: row) as! String
        
        return title
    }
    // MARK: Convert Function
    
    @IBAction func convertButtonArea(_ sender: Any) {
        
        //I: Retrieve the numerical value from the input text feild
        let amountAsStringArea = inputArea.text!
        let numberFormatterArea = NumberFormatter()
        let amountAsNumberArea = numberFormatterArea.number(from: amountAsStringArea)
        let amountAsFloatArea = amountAsNumberArea?.floatValue
        //II: Retrieve the unit type that was selected
        let indexOfSelectedUnitFromArea = unitFromArea.selectedRow(inComponent: 0)
        let unitFromAreaVar = keysArea.object(at: indexOfSelectedUnitFromArea) as! String
        //III: Retrieve the unit type that was selected to retrurn to
        let indexOfSelectedUnitToArea = unitToArea.selectedRow(inComponent: 0)
        let unitToAreaVar = keysArea.object(at: indexOfSelectedUnitToArea) as! String
        //IV: Apply the two step conversion
        // Step I
        let conversionFactorToArea = unitsArea.value(forKey: unitFromAreaVar) as! Float
        let resultAsArea = amountAsFloatArea! * conversionFactorToArea
        // Step II
        let conversionFactorFromArea = unitsArea.value(forKey: unitToAreaVar) as! Float
        let result = resultAsArea / conversionFactorFromArea
        //V: Format the rsult as a a string
        let resultAsStringArea = String.localizedStringWithFormat("%.3f", result)
        //VI: Assign the result string to the resultArea label
        resultArea.text = resultAsStringArea
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
        fakeButtonArea.isUserInteractionEnabled = true
    }
}
