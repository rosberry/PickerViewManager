//
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit

fileprivate struct AssociatedKeys {
    static var didSelectHandler = "rsb_didSelectHandler"
}

public typealias SelectionHandler = ((_ rowIndex: RowIndex, _ componentIndex: ComponentIndex) -> Void)

/// Base row item protocol for implementing string/view representable row items.
///
/// - note: You shouldn't directly use this protocol. Use `RowStringItemProtocol` and `RowViewItemProtocol` instead.
public protocol RowItemProtocol {

    /// The handler for detecting row selection.
    var didSelectHandler: SelectionHandler? { get set }
 
    /// Called by the picker view when the user selects a row in a component.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
}

public extension RowItemProtocol {
    
    var didSelectHandler: SelectionHandler? {
        get {
            return ClosureWrapper<SelectionHandler>.handler(for: self, key: &AssociatedKeys.didSelectHandler)
        }
        set {
            ClosureWrapper<SelectionHandler>.setHandler(newValue, for: self, key: &AssociatedKeys.didSelectHandler)
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        didSelectHandler?(row, component)
    }
}
