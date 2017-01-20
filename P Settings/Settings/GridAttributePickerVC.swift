//
//  GridAttributePickerVC.swift
//  P Settings
//
//  Created by Hijazi on 26/11/16.
//  Copyright © 2016 iReka Soft. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GridAttributePickerVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var labelString: String!
  var options: Array<String>!
  var images: Array<String>!
  var key: String!
  var checkedIndexPath: IndexPath?
  
  var number: Int!
  var isAlreadySelected: Bool!
  
  var lastIndexPath: IndexPath!
  
  var currentObject: String!
  var cellSize: CGSize!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateViews()
    
    currentObject = UserDefaults.standard.object(forKey: key) as! String!
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  // MARK: UICollectionViewDataSource
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return options.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GridCell
    
    cell.textLabel.text = options[indexPath.row]
    
    cell.iv_selected.isHidden = true
    
    if  let currentObject = currentObject as? String {
      if options[indexPath.row] == currentObject {
        cell.iv_selected.isHidden = false
        checkedIndexPath = indexPath
      }
      
    }
    

    
    
    
    return cell
  }
  
  // MARK:- UIViewController Override
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    
    super.viewWillTransition(to: size, with: coordinator)
    
    coordinator.animate(alongsideTransition: { context in
      // do while animation
      self.updateViews()
      
    }, completion:{
      context in
      // do after animation completed
      
      print("horizontalSizeClass:\(self.traitCollection.horizontalSizeClass.rawValue)")
      print("verticalSizeClass:\(self.traitCollection.verticalSizeClass.rawValue)")
      print("view.size:\(self.view.frame.size)")
      print("statusBarOrientation: \(UIApplication.shared.statusBarOrientation.rawValue)")
      
    })
    
  }
  
  func updateViews(){
    let viewSize = self.view.frame.size
    
    if (UIApplication.shared.statusBarOrientation.isPortrait){
      // potrait
      let cellLength = (viewSize.width/3.0)-1
      self.cellSize = CGSize(width: cellLength, height: cellLength)
    }else {
      // landscape
      let cellLength = (viewSize.width/5.0)-1
      self.cellSize = CGSize(width: cellLength, height: cellLength)
    }
    
    self.collectionView?.collectionViewLayout.invalidateLayout()
  }
  
  // MARK:- UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    print("get called")
    return cellSize
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
  
  // MARK: UICollectionViewDelegate
  
  
  // Uncomment this method to specify if the specified item should be highlighted during tracking
  override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    
    
    return true
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    UserDefaults.standard.set(options[indexPath.row], forKey: key)
    
    var cell : GridCell?

    if let checkedIndexPath = checkedIndexPath as IndexPath?{
      
      cell = collectionView.cellForItem(at: checkedIndexPath) as! GridCell?
      cell?.iv_selected.isHidden = true
      
    }
    
    cell = collectionView.cellForItem(at: indexPath) as! GridCell?
    cell?.iv_selected.isHidden = false
    
    navigationController!.popViewController(animated: true)
    

  }
  
  
  /*
   // Uncomment this method to specify if the specified item should be selected
   override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
   return true
   }
   */
  
  /*
   // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
   override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
   return false
   }
   
   override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
   
   }
   */
  
}

class GridCell: UICollectionViewCell {
  
  
  @IBOutlet weak var textLabel: UILabel!
  @IBOutlet weak var iv_selected: UIImageView!
  
}
