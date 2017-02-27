//
//  DatePickerField.swift
//  Inquire
//
//  Created by Maddie Zug on 7/29/16.
//
//

import Foundation
import UIKit

/// A TextField with a UIDatePicker for an inputView. Doesn't show a cursor, doesn't allow
/// the user to select, edit, or replace text in any other way than with the datePicker
public class DatePickerField : TextField {
    public var datePicker:UIDatePicker = UIDatePicker()
    
    public required init(validators: [ValidationRule], setup: ((TextField) -> Void)?) {
        super.init(validators: validators, setup: setup)
        
        self.inputView = datePicker
        clearButtonMode = .never
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Picker cursor functions
    
    public override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    
    public override func selectionRects(for range: UITextRange) -> [Any] {
        return []
    }
    
    public override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(selectAll(_:)) || action == #selector(paste(_:)) {
            return false
        } else {
            return true
        }
    }
}
