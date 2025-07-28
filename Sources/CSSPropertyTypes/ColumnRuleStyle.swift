//
//  ColumnRuleStyle.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `column-rule-style` property sets the style of the line drawn between columns
/// in a multi-column layout.
///
/// This property uses the same values as `border-style`.
///
/// - SeeAlso: [MDN Web Docs on column-rule-style](https://developer.mozilla.org/en-US/docs/Web/CSS/column-rule-style)
public enum ColumnRuleStyle: Property, LineStyleConvertible {
    public static let property: String = "column-rule-style"
    /// A specific line style for the column rule
    case lineStyle(LineStyle)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a column rule style
    ///
    /// - Parameter style: The line style for the column rule
    /// - Returns: A column rule style
    public static func rule(_ style: LineStyle) -> ColumnRuleStyle {
        return .lineStyle(style)
    }

    /// String representation of the column-rule-style
    public var description: String {
        switch self {
        case .lineStyle(let lineStyle):
            return lineStyle.description
        case .global(let global):
            return global.description
        }
    }
}
