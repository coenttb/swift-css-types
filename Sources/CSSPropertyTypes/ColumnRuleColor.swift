//
//  ColumnRuleColor.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

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


/// Convenience methods for common column rule colors
extension ColumnRuleColor {
    /// Creates a black column rule
    public static let black = ColumnRuleColor.color(.black)
    
    /// Creates a white column rule
    public static let white = ColumnRuleColor.color(.white)
    
    /// Creates a red column rule
    public static let red = ColumnRuleColor.color(.red)
    
    /// Creates a green column rule
    public static let green = ColumnRuleColor.color(.green)
    
    /// Creates a blue column rule
    public static let blue = ColumnRuleColor.color(.blue)
    
    /// Creates a transparent column rule
    public static let transparent = ColumnRuleColor.color(.transparent)
    
    /// Creates a column rule with the current text color
    public static let currentColor = ColumnRuleColor.color(.currentColor)
}
