//
//  SettingsTableViewController.swift
//  P Settings
//
//  Created by Hijazi on 18/11/16.
//  Copyright © 2016 iReka Soft. All rights reserved.
//

import UIKit

class SettingsTVC: UITableViewController {
  
  @IBOutlet weak var lbl_option1: UILabel!
  @IBOutlet weak var lbl_option2: UILabel!
  @IBOutlet weak var switch_1: UISwitch!
  @IBOutlet weak var segmented_1: UISegmentedControl!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Settings"
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    setupUI()
    
  }
  
  func done(){
    dismiss(animated: true, completion: nil)
  }
  
  func setupUI(){
    
    UserDefaults.standard.bool(forKey: Settings.kTitleFrontPage)
    
    let isShowImage = UserDefaults.standard.bool(forKey: Settings.kShowImage)
    
    switch_1.setOn(isShowImage, animated:false)
    
    lbl_option1.text = UserDefaults.standard.string(forKey: Settings.kSetting1)
    
    
  }
  
  // MARK: - UITableViewDelegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let cell = tableView.cellForRow(at: indexPath)
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    // Just return if the cell don't have the identifier yet
    guard let cellIdentifier = cell?.reuseIdentifier else {
      return
    }
    
    // Handle the cell based on its identifier
    switch cellIdentifier {
    case "showImage":
      print("showImage")
      break
      
    case "Option1":
      
      let attributePickerVC = storyboard?.instantiateViewController(withIdentifier: "AttributePickerVC") as! AttributePickerVC
      
      attributePickerVC.key = Settings.kSetting1
      attributePickerVC.title = "Setting 1"
      attributePickerVC.options = ["Type 1",
                                   "Type 2",
                                   "Type 3",
                                   "Type 4",
                                   "Type 5",
                                   ]
      
      navigationController?.pushViewController(attributePickerVC, animated: true)
      break
    case "Option2":
      
      let gridAttributePickerVC = storyboard?.instantiateViewController(withIdentifier: "GridAttributePickerVC") as! GridAttributePickerVC
      gridAttributePickerVC.key = Settings.kSetting2
      gridAttributePickerVC.title = "Setting 2"
      gridAttributePickerVC.options = ["Type 1",
                                       "Type 2",
                                       "Type 3",
                                       "Type 4",
                                       "Type 5",
                                      ]
      
      navigationController?.pushViewController(gridAttributePickerVC, animated: true)
      
    

      break
    default:
      break
    }
    
//    if (cellIdentifier == "showImage"){
      
//      print("showImage")
//      
//      var url = URL.init(string: UIApplicationOpenSettingsURLString)
//      
//      // Only open this when you have some settings
//      UIApplication.shared.open(url!, options:[:], completionHandler: { (success) in })
      


    
  }
  
  // MARK: Actions
  
  @IBAction func segmentedChanged(_ sender: Any) {
    
    
    
  }
  
  @IBAction func switchChanged(_ sender: UISwitch) {
    
    UserDefaults.standard.set(sender.isOn, forKey: Settings.kShowImage)
    UserDefaults.standard.synchronize()
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  
  //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  //
  //
  //    }
  

  
}
