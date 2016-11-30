//
//  ViewController.swift
//  P Settings
//
//  Created by Hijazi on 18/11/16.
//  Copyright © 2016 iReka Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var lbl_setting_1: UILabel!
  @IBOutlet weak var lbl_setting_2: UILabel!
  @IBOutlet weak var lbl_setting_3: UILabel!
  
  override var preferredStatusBarStyle: UIStatusBarStyle{
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Subscribe to notification when UserDefault changes
    NotificationCenter.default.addObserver(self, selector: #selector(self.userDefaultsDidChanged), name: UserDefaults.didChangeNotification, object: nil)
    
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    settingsChanged()
  }
  
  func userDefaultsDidChanged(){
    
    settingsChanged()
    
  }
  
  func settingsChanged(){
    
    let isShowingImage = UserDefaults.standard.bool(forKey: Settings.kShowImage)
    
    lbl_setting_1.text = "show image \(isShowingImage)"
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

