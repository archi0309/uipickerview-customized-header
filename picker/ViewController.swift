//
//  ViewController.swift
//  picker
//
//  Created by Kochi Lin on 1/11/17.
//  Copyright © 2017 Kochi Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate {
  
  var years =  Array(0...10)
  var months = Array(1...12)
  var days = Array(1...12)
  var labelTexts = ["Months", "Minutes","", "day"]
  
  @IBOutlet weak var myPicker: UIPickerView!
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 4
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    var numberOfRow:Int = -1 
    if(component == 0 ){
      numberOfRow = years.count
    }
    if(component == 1 ){
      numberOfRow = months.count
    }
    if(component == 2 ){
      numberOfRow =  1
    }
    if(component == 3 ){
      numberOfRow = months.count
    }
    return numberOfRow
  }
  
  
  func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    var widthForComponent:CGFloat = -1
    if(component == 0 ){
      widthForComponent = 30
    }
    if(component == 1 ){
      widthForComponent = 50
    }
    if(component == 3 ){
      widthForComponent = 30
    }
    
    return  widthForComponent
  }
  
  
  func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
    
    let pickerlbl = UILabel()
    
    
    if( component == 0) {
      pickerlbl.text = String(years[row])
      pickerlbl.backgroundColor = UIColor.yellowColor()
    }
    if( component == 1) {
      pickerlbl.text = String(months[row])
    }
    if( component == 2) {
      pickerlbl.text =  ""
    }
    if( component == 3) {
      pickerlbl.text = String(days[row])
    }
    
    return pickerlbl
    
  }
  
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    for index in 0..<labelTexts.count {
      var myRowIdx  = myPicker.selectedRowInComponent(index)
      let  lbl  = myPicker.viewForRow(0  ,forComponent: index) as! UILabel!
      var newlblframe = lbl.convertRect(lbl.bounds , toView: myPicker)
      
      var newlbl = UILabel.init(frame: CGRectMake(newlblframe.origin.x, 0, newlblframe.width, newlblframe.height))
      newlbl.text  = labelTexts[index]
      myPicker.addSubview(newlbl)
    }
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    myPicker.delegate = self
    myPicker.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
    
  }
}