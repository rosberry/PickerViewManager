//
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit

/// Convenient extension of `UIView`.
/// ```
///  let view = UIView()
///  let componentItem = ComponentItem<ViewAdaptor>(rowItems: [view])
/// ```
extension UIView: RowViewItemProtocol {

    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return self
    }
}
