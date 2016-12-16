//
//  AreaViewController.swift
//  Unit Converter
//
//  Created by Aaron Nash on 2016-12-16.
//  Copyright © 2016 Aaron Nash. All rights reserved.
//

import UIKit

class AreaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var areaPicker: UIPickerView!
    
    @IBOutlet weak var areaOutput: UILabel!

    //This is the data source for the UI Picker View
    let areaPickerData = ["uno", "dos", "tres"]
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Delegets and Data
    // MARK: - Data sources
    // this tells the UI Picker view how many spinning parts to show
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //we only need one so return, 
        return 1
    }
    // Tell the UI Picker View how many rows to show
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // we are now getting it to return the number of options that we had in areaPickerData
        return areaPickerData.count
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
