//
//  RegistrationTableViewController.swift
//  HotelManzana
//
//  Created by 곽다은 on 1/16/24.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    var registrations: [Registration] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "doneUnwind",
              let sourceViewController = unwindSegue.source as? AddRegistrationTableViewController,
              let registration = sourceViewController.registration else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            registrations[selectedIndexPath.row] = registration
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
        } else {
            let newIndexPath = IndexPath(row: registrations.count, section: 0)
            registrations.append(registration)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        tableView.reloadData()
    }
    
        @IBSegueAction func addEditRegistration(_ coder: NSCoder, sender: Any?) -> AddRegistrationTableViewController? {
            if let cell = sender as? UITableViewCell,
               let indexPath = tableView.indexPath(for: cell) {
                let registrationToEdit = registrations[indexPath.row]
                return AddRegistrationTableViewController(coder: coder, registration: registrationToEdit)
            } else {
                return AddRegistrationTableViewController(coder: coder, registration: nil)
            }
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        let registration = registrations[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = registration.firstName + " " + registration.lastName
        content.secondaryText = (registration.checkInDate..<registration.checkOutDate).formatted(date: .numeric, time: .omitted) + ": " + registration.roomType.name
        cell.contentConfiguration = content
        
        return cell
    }

}
