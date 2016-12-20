//
//  LengthViewController.swift
//  Unit Converter
//
//  Created by Aaron Nash on 2016-12-16.
//  Copyright © 2016 Aaron Nash. All rights reserved.
//

import UIKit

class LengthViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // We are putting this here so that we can use throught the whole class
    var unitsLength: NSDictionary = [:]
    // We are now going to define an NSAarray here
    var keysLength: NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
   }
