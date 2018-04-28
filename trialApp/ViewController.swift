//
//  ViewController.swift
//  trialApp
//
//  Created by Adam Martin on 2/17/18.
//  Copyright © 2018 Adam Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //scroller output
    @IBOutlet weak var scrollingObject: UIPickerView!
    
    //Label outputs
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var labelViewOpponent: UILabel!
    @IBOutlet weak var textAdditions: UITextField!
    
    var pickerData: [[String]] = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerData = [
            ["Mudkip","Treeko","Torchic","Shroomish","Poochyena"],
            ["Mudkip","Treeko","Torchic","Shroomish","Poochyena"]
        ]
        
        //connect data
        self.scrollingObject.dataSource = self
        self.scrollingObject.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[0].count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[component][row]
    }
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        
        if (component == 0) {
        self.labelView.text = pickerData[0][row]
        }
            
        else {
        self.labelViewOpponent.text = pickerData[1][row]
        }
    }
    
    //This action is to add items to the list
    @IBAction func addToList(_ sender: UIButton) {
        
        if (self.textAdditions.text?.count == 0) {
            //Empty box, do nothing
            view.endEditing(true)
        }
        else {
            //grab the item to add from the textbox
            let itemToAdd = self.textAdditions.text
            //append to the end of the array
            pickerData[0].append(itemToAdd!)
            pickerData[1].append(itemToAdd!)
            
            //reload the components
            [self.scrollingObject.reloadAllComponents()]
            
            //end editing
            view.endEditing(true)
        }
        
    }
    
    
    
    @IBAction func endEditing(_ sender: UITapGestureRecognizer) {
        //end typing on regular tap
        view.endEditing(true)
    }
    

    
    
}

