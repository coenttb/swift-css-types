//
//  RowGap.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `row-gap` property sets the size of the gap (gutter) between an element's rows.
///
/// This property applies to flex containers, grid containers, and multi-column layouts. 
/// It defines the space between rows in these layout contexts.
///
/// Example:
/// ```swift
/// .rowGap(.px(20))            // row-gap: 20px
/// .rowGap(.percentage(10))    // row-gap: 10%
/// .rowGap(.normal)            // row-gap: normal
/// ```
///
/// - Note: Early versions of the specification called this property `grid-row-gap`, 
///   and browsers will still accept that as an alias for backward compatibility.
///
/// - SeeAlso: [MDN Web Docs on row-gap](https://developer.mozilla.org/en-US/docs/Web/CSS/row-gap)
public enum RowGap: Property, LengthPercentageConvertible {
    public static let property: String = "row-gap"
    
    /// A length-percentage value for the gap
    case lengthPercentage(LengthPercentage)
    
    /// Default value, typically 0 (except for multi-column layouts)
    case normal
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .normal:
            return "normal"
        case .global(let global):
            return global.description
        }
    }
}
