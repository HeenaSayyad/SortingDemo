//
//  ViewController.swift
//  SortingDemo
//
//  Created by ramjan sayyad on 10/09/18.
//  Copyright © 2018 ramjan sayyad. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var pArray = ["A to Z","Date","Z to A"]
    
    
    
    var alphabetsArray : Array<Any> = []
    var searching = false
    var searchAplhabets : Array<Any> = []
    
    
    var alphabetsArray1 = [
        "name" : "Heena",
        "date" : "12/03/1992"]
    
    var alphabetsArray2 = [
        "name" : "Arshad",
        "date" : "5/07/2015"]
    
    var alphabetsArray3 = [
        "name" : "Ramjan",
        "date" : "12/05/1988"]
    
    var alphabetsArray4 = [
        "name" : "Imran",
        "date" : "03/02/1987"]
    
    var alphabetsArray5 = [
        "name" : "Farheen",
        "date" : "14/08/1992"]
    
    var alphabetsArray6 = [
        "name" : "Tejashree",
        "date" : "19/08/1995"]
    
    var alphabetsArray7 = [
        "name" : "Madhuri",
        "date" : "09/12/2001"]
    
    var alphabetsArray8 = [
        "name" : "Bhagyshree",
        "date" : "27/05/2005"]
    
    var alphabetsArray9 = [
        "name" : "Shital",
        "date" : "20/08/1860"]
    
    var alphabetsArray10 = [
        "name" : "Rachna",
        "date" : "26/11/1983"]
    
    var alphabetsArray11 = [
        "name" : "Smriti",
        "date" : "30/05/2000"]
    
    var alphabetsArray12 = [
        "name" : "Tina",
        "date" : "15/09/1865"]
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (searching == true)
        {
     return(searchAplhabets.count)
        }
        else
        {
        return(alphabetsArray.count)
    }
    }
    
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        if (searching == true)
        {
            let temp_data = searchAplhabets[indexPath.row] as! [String:String]
            cell.textLabel?.text = temp_data["name"]
            cell.detailTextLabel?.text = temp_data["date"]
        }
        else
        {
            let temp_data = alphabetsArray[indexPath.row] as! [String:String]
            cell.textLabel?.text = temp_data["name"]
            cell.detailTextLabel?.text = temp_data["date"]
        }
    
        return cell
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        
        return 1
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       alphabetsArray = [alphabetsArray1,alphabetsArray2,alphabetsArray3,alphabetsArray4,alphabetsArray5,alphabetsArray6,alphabetsArray7,alphabetsArray8,alphabetsArray9,alphabetsArray10,alphabetsArray11,alphabetsArray12]
        
        pView.isHidden = true
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func doneBtn(_ sender: Any)
    {    
       //let selectedValue = pickerView.selectRow(0, inComponent: 0, animated: true)
        
        searchAplhabets = (alphabetsArray as NSArray).sortedArray(using: [NSSortDescriptor(key: "name", ascending: true)]) as! [[String:AnyObject]]
        
        searching = true
        tableView.reloadData()
    }
        
    
    
    @IBAction func cancelBtn(_ sender: Any)
    {
        
        searching = false
        
        alphabetsArray = [alphabetsArray1,alphabetsArray2,alphabetsArray3,alphabetsArray4,alphabetsArray5,alphabetsArray6,alphabetsArray7,alphabetsArray8,alphabetsArray9,alphabetsArray10,alphabetsArray11,alphabetsArray12]
        
        pView.isHidden = true
        tableView.reloadData()
    }
    
    @IBAction func sortingBtn(_ sender: Any)
    {
        if pView.isHidden == true
        {
            pView.isHidden = false
        }
        else
        {
            pView.isHidden = true
        }
    
    }
}

