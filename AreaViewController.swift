//
//  AreaViewController.swift
//  Unit Converter
//
//  Created by Aaron Nash on 2016-12-16.
//  Copyright © 2016 Aaron Nash. All rights reserved.
//

import UIKit

class AreaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // MARK: Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var areaPicker: UIPickerView!
    
    @IBOutlet weak var areaOutput: UILabel!

    //This is the data source for the UI Picker View
    let areaPickerData = ["one", "two"]

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Delegets and Data
    // MARK: - Data sources
    // This tells the UI Picker view how many spinning parts to show
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //we only need one so return, 
        return 1
    }
    // Tell the UI Picker View how many rows to show
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // we are now getting it to return the number of options that we had in areaPickerData
        return areaPickerData.count
        
    }
    // MARK: - Delegets
    
    // This tells the areaUIPicker View what to show in each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // we want it to return the the areaPickerRow's text
        return areaPickerData[row]
        
    }
    // This method below will fire whenever the user selects a row from the data source in the picker view
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        areaOutput.text = areaPickerData[row]
        
    }
}
