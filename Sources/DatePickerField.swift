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
    
    public required init(validators: [ValidationRule], setup: (TextField -> Void)?) {
        super.init(validators: validators, setup: setup)
        
        self.inputView = datePicker
        clearButtonMode = .Never
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Picker cursor functions
    
    override public func caretRectForPosition(position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    
    override public func selectionRectsForRange(range: UITextRange) -> [AnyObject] {
        return []
    }
    
    override public func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == #selector(NSObject.copy(_:)) || action == #selector(NSObject.selectAll(_:)) || action == #selector(NSObject.paste(_:)) {
            return false
        } else {
            return true
        }
    }
}