//
//  AttributePickerVC.swift
//  P Settings
//
//  Created by Hijazi on 25/11/16.
//  Copyright © 2016 iReka Soft. All rights reserved.
//

import UIKit

class AttributePickerVC: UITableViewController {
  
  var labelString: String!
  var options: Array<String>!
  var images: Array<String>!
  var key: String!
  var checkedIndexPath: IndexPath?
  
  var number: Int!
  var isAlreadySelected: Bool!
  
  var lastIndexPath: IndexPath!
  
  var currentObject: String!
  
  // TODO : add footer string
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //currentObject = [DEFAULTS objectForKey:self.key];
    currentObject = UserDefaults.standard.object(forKey: key) as! String!
    
    print("haha \(currentObject)")
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return options.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = options[indexPath.row]
    
    guard currentObject != nil else {
      cell.accessoryType = .none
      return cell
    }
    
    if options[indexPath.row] == currentObject {
      cell.accessoryType = .checkmark
      checkedIndexPath = indexPath
    }
    
    
    return cell
  }
  
  // MARK: - UITableViewDelegate
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)

    UserDefaults.standard.set(options[indexPath.row], forKey: key)
    
    var cell: UITableViewCell?
    
    if let checkedIndexPath = checkedIndexPath as IndexPath? {
      cell = tableView.cellForRow(at: checkedIndexPath)
      cell?.accessoryType = .none
    }
    
    
    cell = tableView.cellForRow(at: indexPath)
    cell?.accessoryType = .checkmark
    
    navigationController!.popViewController(animated: true)
    
    
  }
  
}
