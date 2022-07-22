//
//  ViewController.swift
//  Russia's Losses
//
//  Created by Mac on 19.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataPersonnel = DataLoader().personnelData
    var dataEquipment = DataLoader().equipmentData
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Russia's Losses ꑭ🇺🇦ꑭ"
        navigationItem.backButtonTitle = "Back"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .semibold)
        ]
        self.navigationItem.backBarButtonItem?.tintColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .semibold)
        ]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPersonnel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "Day: \(String(dataPersonnel[indexPath.row].day))"
        let dateText = dataPersonnel[indexPath.row].date.replacingOccurrences(of: "-", with: ".")
        cell.detailTextLabel?.text = dateText
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        cell.accessoryType =  UITableViewCell.AccessoryType.detailDisclosureButton
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.secondaryLabel.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            destination.dayPersonnel = dataPersonnel[(tableView.indexPathForSelectedRow?.row)!]
            destination.dayEquipment = dataEquipment[(tableView.indexPathForSelectedRow?.row)!]
            
            if tableView.indexPathForSelectedRow?.row != dataPersonnel.count-1 {
                destination.previousDayPersonnel = dataPersonnel[(tableView.indexPathForSelectedRow!.row+1)]
                destination.previousDayEquipment = dataEquipment[(tableView.indexPathForSelectedRow!.row+1)]
            }
        }
    }

}

