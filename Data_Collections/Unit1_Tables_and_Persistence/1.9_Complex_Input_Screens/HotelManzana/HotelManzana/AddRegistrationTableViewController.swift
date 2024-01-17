//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by 곽다은 on 1/15/24.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    @IBOutlet var doneBarButton: UIBarButtonItem!
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    @IBOutlet var numberOfAdultsLabel: UILabel!
    @IBOutlet var numberOfAdultsStepper: UIStepper!
    @IBOutlet var numberOfChildrenLabel: UILabel!
    @IBOutlet var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet var wifiSwitch: UISwitch!
    
    @IBOutlet var roomTypeLabel: UILabel!
    var roomType: RoomType?
    
    @IBOutlet var numberOfNightsLabel: UILabel!
    @IBOutlet var checkInCheckOutDateLabel: UILabel!
    @IBOutlet var roomTypeCostLabel: UILabel!
    @IBOutlet var roomTypeDescriptionLabel: UILabel!
    @IBOutlet var wifiCostLabel: UILabel!
    @IBOutlet var wifiUseLabel: UILabel!
    @IBOutlet var totalCostLabel: UILabel!
    
    var registration: Registration?
    
    init?(coder: NSCoder, registration: Registration?) {
        self.registration = registration
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let registration = registration {
            firstNameTextField.text = registration.firstName
            lastNameTextField.text = registration.lastName
            emailTextField.text = registration.emailAddress
            checkInDatePicker.date = registration.checkInDate
            checkOutDatePicker.date = registration.checkOutDate
            numberOfAdultsStepper.value = Double(registration.numberOfAdults)
            numberOfChildrenStepper.value = Double(registration.numberOfChildren)
            wifiSwitch.isOn = registration.wifi
            roomType = registration.roomType
            
            title = "Edit Guest Registration"
        } else {
            title = "Add Guest Registration"
        }
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        updateDoneBarButtonState()
        updateTotalCostLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "doneUnwind" else { return }
        guard let roomType = roomType else { return }
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        registration = Registration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, wifi: hasWifi, roomType: roomType)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func TextFieldEditing(_ sender: Any) {
        updateDoneBarButtonState()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
        updateTotalCostLabel()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
        updateDoneBarButtonState()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        updatewifiCostLabel()
        updateTotalCostLabel()
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeController = SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeController?.delegate = self
        selectRoomTypeController?.roomType = roomType
        
        return selectRoomTypeController
    }
    
    func updateDoneBarButtonState() {
        let firstNameText = firstNameTextField.text ?? ""
        let lastNameText = lastNameTextField.text ?? ""
        let emailAddressText = emailTextField.text ?? ""
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let roomType = self.roomType
        
        doneBarButton.isEnabled = !firstNameText.isEmpty && !lastNameText.isEmpty && !emailAddressText.isEmpty && numberOfAdults != 0 && roomType != nil
    }
    
    func updateDateViews() {
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        updateNumberOfNightsLabel()
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
        
        updateRoomTypeCostLabel()
        updateTotalCostLabel()
    }
    
    func updateNumberOfNightsLabel() {
        numberOfNightsLabel.text = String(Calendar.current.dateComponents([.day], from: checkInDatePicker.date, to: checkOutDatePicker.date).day ?? 0)
        checkInCheckOutDateLabel.text = (checkInDatePicker.date..<checkOutDatePicker.date).formatted(date: .numeric, time: .omitted)
    }
    
    func updateRoomTypeCostLabel() {
        if let roomType = roomType {
            let nights = Calendar.current.dateComponents([.day], from: checkInDatePicker.date, to: checkOutDatePicker.date).day ?? 1
            roomTypeCostLabel.text = "$ \(roomType.price * nights)"
            roomTypeDescriptionLabel.text = roomType.name + " @ $\(roomType.price)/night"
        } else {
            roomTypeCostLabel.text = "Not Set"
            roomTypeDescriptionLabel.text = "none"
        }
    }
    
    func updatewifiCostLabel() {
        if wifiSwitch.isOn {
            let nights = Calendar.current.dateComponents([.day], from: checkInDatePicker.date, to: checkOutDatePicker.date).day ?? 1
            wifiCostLabel.text = "$ \(10 * nights)"
            wifiUseLabel.text = "Yes"
        } else {
            wifiCostLabel.text = "$ 0"
            wifiUseLabel.text = "No"
        }
    }
    
    func updateTotalCostLabel() {
        let roomCost = roomType?.price ?? 0
        let wifiCost = wifiSwitch.isOn ? 10 : 0
        let nights = Calendar.current.dateComponents([.day], from: checkInDatePicker.date, to: checkOutDatePicker.date).day ?? 1
        totalCostLabel.text = "$ \((roomCost + wifiCost) * nights)"
    }
    
    // MARK: - selectRoomTypeTableViewController delegate method
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
        updateDoneBarButtonState()
    }
    
    // MARK: Table View Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkInDateLabelCellIndexPath && isCheckOutDatePickerVisible == false {
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDateLabelCellIndexPath && isCheckInDatePickerVisible == false {
            isCheckOutDatePickerVisible.toggle()
        } else if indexPath == checkInDateLabelCellIndexPath || indexPath == checkOutDateLabelCellIndexPath {
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        } else {
            return
        }
        
        // height for each row is recalculated
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
