//
//  CurrencyViewController.swift
//  Unit Converter
//
//  Created by Aaron Nash on 2016-12-24.
//  Copyright © 2017 Aaron Nash. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // We are putting this here so that we can use throught the whole class
    var unitsCurrency: NSDictionary = [:]
    // We are now going to define an NSAarray here
    var keysCurrency: NSArray!
    // MARK: Outlets
    
    @IBOutlet weak var inputCurrency: UITextField!
    @IBOutlet weak var resultCurrency: UILabel!
    @IBOutlet weak var unitFromCurrency: UIPickerView!
    @IBOutlet weak var unitToCurrency: UIPickerView!
    @IBOutlet weak var fakeButtonCurrency: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up the delegete of the inputCurrency to this class
        inputCurrency.delegate = self
        if (inputCurrency.text?.isEmpty)! {
            fakeButtonCurrency.isUserInteractionEnabled = false
        }
        // We now want to put all of the contents from unitsListCurrency.plist
        // I: Get a refrence to the app bundle
        let appBundle = Bundle.main
        // II: Get a refrence to the path that contains the unit
        let filePath = appBundle.path(forResource: "unitsListCurrency", ofType: "plist")!
        // We now are loading the content of the file into the dictioanary
        unitsCurrency = NSDictionary(contentsOfFile: filePath)!
        // Now we need to Initalize the keys with the names of the units
        keysCurrency = unitsCurrency.allKeys as NSArray
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
        // We want it to return the count of the unitsCurrency
        return unitsCurrency.count
    }
    // We are now telling the picker view what we want each row to say, so that the user will know which one to choose from.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // We want the titles for the row to be the key in the unitsListCurrency.plist file
        let keys = unitsCurrency.allKeys as NSArray
        
        let title = keys.object(at: row) as! String
        
        return title
    }
    // MARK: Convert Function
    @IBAction func convertButtonCurrency(_ sender: Any) {
        //I: Retrieve the numerical value from the input text feild
        let amountAsStringLegth = inputCurrency.text!
        let numberFormatterCurrency = NumberFormatter()
        let amountAsNumberCurrency = numberFormatterCurrency.number(from: amountAsStringLegth)
        let amountAsFloatCurrency = amountAsNumberCurrency?.floatValue
        //II: Retrieve the unit type that was selected
        let indexOfSelectedUnitFromCurrency = unitFromCurrency.selectedRow(inComponent: 0)
        let unitFromCurrencyVar = keysCurrency.object(at: indexOfSelectedUnitFromCurrency) as! String
        //III: Retrieve the unit type that was selected to retrurn to a string
        let indexOfSelectedUnitToCurrency = unitToCurrency.selectedRow(inComponent: 0)
        let unitToCurrencyVar = keysCurrency.object(at: indexOfSelectedUnitToCurrency) as! String
        //IV: Apply the two step conversion
        // Step I
        let conversionFactorToCurrency = unitsCurrency.value(forKey: unitFromCurrencyVar) as! Float
        let resultAsCurrency = amountAsFloatCurrency! * conversionFactorToCurrency
        // Step II
        let conversionFactorFromCurrency = unitsCurrency.value(forKey: unitToCurrencyVar) as! Float
        let result = resultAsCurrency / conversionFactorFromCurrency
        //V: Format the rsult as a a string
        let resultAsStringCurrency = String.localizedStringWithFormat("%.2f", result)
        //VI: Assign the result string to the resultCurrency label
        resultCurrency.text = resultAsStringCurrency
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
        fakeButtonCurrency.isUserInteractionEnabled = true
    }
 }
