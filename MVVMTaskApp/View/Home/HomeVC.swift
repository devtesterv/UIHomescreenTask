//
//  HomeVC.swift
//  MVVMTaskApp
//
//  Created by CV on 6/4/21.
//

import UIKit

class HomeVC: UIViewController {
  

    @IBOutlet weak var showMoreBtn: DesignableButton!
    @IBOutlet weak var itemsViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var itemCollectionView: UICollectionView!
    @IBOutlet weak var offerAndCoupensCollectionView: UICollectionView!
    
    
    @IBOutlet weak var featureServicesTableview: UITableView!
    @IBOutlet weak var featureServicesTVConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.featureServicesTableview.addObserver(self, forKeyPath: "costentSize", options: .new, context: nil)
        self.featureServicesTableview.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.featureServicesTableview.removeObserver(self, forKeyPath:  "costentSize")
    }
    override  func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath ==  "costentSize" {
            if object is UITableView {
                if let newValue = change?[.newKey]{
                    let newSize = newValue as! CGSize
                    self.featureServicesTVConstraint.constant = newSize.width
                }
            }
        }
    }
    @IBAction func showMoreClicked(_ sender: Any) {
        itemToggle()
    }
    
    func load(){
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
        itemCollectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        offerAndCoupensCollectionView.delegate = self
        offerAndCoupensCollectionView.dataSource = self
        offerAndCoupensCollectionView.register(UINib(nibName: "OfferAndCoupensCell", bundle: nil), forCellWithReuseIdentifier: "OfferAndCoupensCell")
        
        
        self.itemsViewConstraint.constant = 250
        showMoreBtn.setTitle("Show more", for: UIControl.State.normal)
       
        
        featureServicesTableview.delegate = self
        featureServicesTableview.dataSource = self
        featureServicesTableview.register(UINib(nibName: "featureServicesCell", bundle: nil), forCellReuseIdentifier: "featureServicesCell")
       
        
        featureServicesTableview.layoutIfNeeded()
        featureServicesTVConstraint.constant = self.featureServicesTableview.contentSize.height

    }
    func itemToggle(){
        if itemsViewConstraint.constant != 500  {
            UIView.animate(withDuration: 10.0, animations: { () -> Void in
                self.itemsViewConstraint.constant = 500
            })
           
            itemCollectionView.reloadData()
            showMoreBtn.setTitle("Show less", for: UIControl.State.normal)
        }else if itemsViewConstraint.constant == 500{
            UIView.animate(withDuration: 10.0, animations: { () -> Void in
                self.itemsViewConstraint.constant = 250
            })
            itemCollectionView.reloadData()
            showMoreBtn.setTitle("Show more", for: UIControl.State.normal)
        }
    }

}
extension HomeVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        if collectionView == itemCollectionView {
            if  itemsViewConstraint.constant == 500{
                return 20
            }else {
                return 8
            }
        }else if collectionView == offerAndCoupensCollectionView{
            return 2
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == itemCollectionView {
            let cellA = itemCollectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
            return cellA
        }else if collectionView == offerAndCoupensCollectionView{
            let cellB = offerAndCoupensCollectionView.dequeueReusableCell(withReuseIdentifier: "OfferAndCoupensCell", for: indexPath) as! OfferAndCoupensCell
            return cellB
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == itemCollectionView{
            return CGSize(width: self.view.frame.width / 5 , height: 100)
        }else if collectionView == offerAndCoupensCollectionView{
            return CGSize(width: self.view.frame.width  / 1.5 , height: 150)
        }
        return CGSize(width: 0, height: 0)
    }
 
}


extension HomeVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = featureServicesTableview.dequeueReusableCell(withIdentifier: "featureServicesCell", for: indexPath)as! featureServicesCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
//https://stackoverflow.com/questions/41094672/increase-tableview-height-based-on-cells
