//
//  StoreCollectionViewController.swift
//  GdWrksTest
//
//  Created by Udit Ajmera on 12/17/16.
//  Copyright © 2016 Udit Ajmera. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class StoreCollectionViewController: UICollectionViewController {

    fileprivate let sectionInsets = UIEdgeInsets(top: 20, left: 2.5, bottom: 0, right: 2.5)

    let arrayStores = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let lobjStore1 = StoreData.init(withUserId: 1,
                                        lstrUserName: "Carnatic Cafe",
                                        lstrAddr: "Ground Floor, Community Center, The India Mall, New Friends Colony East, New Delhi, Delhi 110065",
                                        lstrPicURL: "https://st3.dineout-cdn.co.in/images/uploads/restaurant/sharpen/8/t/j/p8462-1452078446568cf56edd3da.jpg?w=700")
        
        self.arrayStores.add(lobjStore1)
        
        let lobjStore2 = StoreData.init(withUserId: 2,
                                        lstrUserName: "McDonald",
                                        lstrAddr: " 539, Ashwini Complex, Chinmaya Mission Hospital Road, Binnamangala, Indiranagar, Bengaluru, Karnataka 560038",
                                        lstrPicURL: "http://4.bp.blogspot.com/-7nzQZuagSRM/UsKATridv9I/AAAAAAABAT8/YxdPaOmtRPs/s1600/Tu+Mac+D+To+Ghat+Hor+Kite+Bhi+Jawe+Na.jpg")
        
        self.arrayStores.add(lobjStore2)
        
        let lobjStore3 = StoreData.init(withUserId: 3,
                                        lstrUserName: "Dominos",
                                        lstrAddr: "539, Ashwini Complex, Chinmaya Mission Hospital Road, Binnamangala, Indiranagar, Bengaluru, Karnataka 560038",
                                        lstrPicURL: "http://www.dominos.co.in/blog/wp-content/uploads/2011/07/IMG00257-20110706-1228.jpg")
        
        self.arrayStores.add(lobjStore3)

        let lobjStore4 = StoreData.init(withUserId: 4,
                                        lstrUserName: "dunkin donuts store",
                                        lstrAddr: "D. No. 1081, Ground Floor, Vistar Arcade, 14th Main Rd, Sector 3, HSR Layout, Bengaluru, Karnataka 560102",
                                        lstrPicURL: "https://2.bp.blogspot.com/-NjD50suquCk/VcYpVdeGPsI/AAAAAAAAHnk/0ld8CMuscOk/s1600/dunkin-donuts.gif")
        
        self.arrayStores.add(lobjStore4)
        
        let lobjStore5 = StoreData.init(withUserId: 5,
                                        lstrUserName: "Hotel ibis Bengaluru Techpark",
                                        lstrAddr: "Opp RMZ Ecospace Business Park, Sarjapur Outer Ring Road, Bengaluru, 560103",
                                        lstrPicURL: "http://www.ahstatic.com/photos/6454_ho_00_p_346x260.jpg")
        
        self.arrayStores.add(lobjStore5)

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(StoreCollectionViewCell.self,
  //                                    forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:StoreCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! StoreCollectionViewCell
    
        let lobjStoreData:StoreData = self.arrayStores.object(at: indexPath.row) as! StoreData
        
        cell.objName.text = lobjStoreData.strName
        cell.objAddress.text = lobjStoreData.strAddr
        cell.downloadImage(url: URL.init(string: lobjStoreData.strPicURL)!)
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

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

extension StoreCollectionViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        //        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        //        let availableWidth = view.frame.width - (paddingSpace)
        //        let widthPerItem = availableWidth / itemsPerRow
        
        print(collectionView.frame.size.width)
        let lfWidthOfCell  = (collectionView.frame.size.width - 8)/2
        
        return CGSize(width: lfWidthOfCell, height: self.view.frame.size.height/3)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
}

