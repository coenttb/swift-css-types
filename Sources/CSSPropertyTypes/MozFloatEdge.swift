//
//  MozFloatEdge.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard CSS `-moz-float-edge` property specifies whether the height and width 
/// properties of the element include the margin, border, or padding thickness.
///
/// This property is similar to box-sizing but affects how floating elements are sized. It determines
/// whether measurements include just the content box or extend to include the margin box.
///
/// Example:
/// ```swift
/// // Only include content in measurements
/// .mozFloatEdge(.contentBox)
///
/// // Include content, padding, border, and margin in measurements
/// .mozFloatEdge(.marginBox)
/// ```
///
/// - Note: This is a non-standard Mozilla property and is deprecated. It was primarily supported in
///         Firefox. For modern layout needs, use standard CSS properties like `box-sizing` instead.
///
/// - SeeAlso: [Mozilla CSS Extensions Documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/Mozilla_Extensions)
public enum MozFloatEdge: Property {
    public static let property: String = "-moz-float-edge"

    /// The height and width properties include the content, but not the padding, border or margin
    case contentBox

    /// The height and width properties include the content, padding, border and margin
    case marginBox

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .contentBox:
            return "content-box"
        case .marginBox:
            return "margin-box"
        case .global(let global):
            return global.description
        }
    }
}
