//
//  HomeVC.swift
//  practicalTestDemo
//
//  Created by uday on 8/18/17.
//  Copyright © 2017 uday. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblDetailHeader: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet var detailView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    let array1 = [11,12,13,14,15,16,17,18,19]
    let array2 = [21,22,23,24,25,26,27,28,29]
    let array3 = [31,32,33,34,35,36,37,38,39]
    
    var selectedSegmentArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedSegmentArray = array1
        setupUI()
     
    }
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.setNavigationBarHidden(false, animated: true)
       
    }
 
    func setupUI() {
        self.title = "Home"
        tblView.layer.cornerRadius = 3
        detailView.alpha = 0
        detailView.layer.cornerRadius = 3
        self.navigationController?.navigationBar.tintColor = .darkGray
    }
    
   
    
    @IBAction func segmentChanged(_ sender: Any) {
        selectedSegmentArray.removeAll()
        if segmentControl.selectedSegmentIndex == 0 {
            selectedSegmentArray = array1
        }else if segmentControl.selectedSegmentIndex == 1{
            selectedSegmentArray = array2
        }else{
            selectedSegmentArray = array3
        }
        tblView.reloadData()
    }
    
    
    func showDetail(index: Int) {
        view.addSubview(detailView)
        lblDetailHeader.text = segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex)
        lblDetail.text = "\(selectedSegmentArray[index])"
        detailView.center = view.center
        UIView.animate(withDuration: 0.3) { 
            self.detailView.alpha = 1
            self.blurView.alpha = 1
        }
    }
    @IBAction func dismissDetailView(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.detailView.alpha = 0
            self.blurView.alpha = 0
        }
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSegmentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "\(selectedSegmentArray[indexPath.row])"
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showDetail(index: indexPath.row)
    }
    
}
