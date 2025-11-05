//
//  ColumnRuleColor.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `column-rule-color` property sets the color of the line drawn between columns
/// in a multi-column layout.
///
/// - SeeAlso: [MDN Web Docs on column-rule-color](https://developer.mozilla.org/en-US/docs/Web/CSS/column-rule-color)
public enum ColumnRuleColor: Property, ColorConvertible, GlobalConvertible {
    public static let property: String = "column-rule-color"
    /// Specific color value for the column rule
    case color(CSSTypeTypes.Color)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a column rule color
    ///
    /// - Parameter color: The color for the column rule
    /// - Returns: A column rule color
    public static func rule(_ color: CSSTypeTypes.Color) -> ColumnRuleColor {
        return .color(color)
    }

    /// String representation of the column-rule-color
    public var description: String {
        switch self {
        case .color(let color):
            return color.description
        case .global(let global):
            return global.description
        }
    }
}
