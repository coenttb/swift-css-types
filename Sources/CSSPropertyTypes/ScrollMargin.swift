//
//  ScrollMargin.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The `scroll-margin` shorthand property sets all of the scroll margins of an element at once,
/// assigning values much like the margin property does for margins of an element.
///
/// Scroll margin values represent outsets defining the scroll snap area that is used for
/// snapping this box to the snapport.
///
/// Example:
/// ```css
/// scroll-margin: 20px;           /* All edges */
/// scroll-margin: 1em 2em 3em 4em; /* Top, right, bottom, left */
/// ```
public enum ScrollMargin: Property, LengthConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, CustomStringConvertible {
    public static let property: String = "scroll-margin"
    
    /// A single length value for all four sides
    case all(Length)
    
    /// Two length values for vertical and horizontal sides (top/bottom, left/right)
    case vertical_horizontal(Length, Length)
    
    /// Three length values for top, horizontal sides (left/right), and bottom
    case top_horizontal_bottom(Length, Length, Length)
    
    /// Four length values for top, right, bottom, and left sides
    case top_right_bottom_left(Length, Length, Length, Length)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .all(let value):
            return value.description
        case .vertical_horizontal(let vertical, let horizontal):
            return "\(vertical.description) \(horizontal.description)"
        case .top_horizontal_bottom(let top, let horizontal, let bottom):
            return "\(top.description) \(horizontal.description) \(bottom.description)"
        case .top_right_bottom_left(let top, let right, let bottom, let left):
            return "\(top.description) \(right.description) \(bottom.description) \(left.description)"
        case .global(let global):
            return global.description
        }
    }
    
    /// Creates a ScrollMargin from a length value (applies to all sides)
    public static func length(_ length: Length) -> Self {
        .all(length)
    }
    
    /// Creates a ScrollMargin using an integer literal (interpreted as pixels for all sides)
    public init(integerLiteral value: Int) {
        self = .all(.px(Double(value)))
    }
    
    /// Creates a ScrollMargin using a floating-point literal (interpreted as pixels for all sides)
    public init(floatLiteral value: Double) {
        self = .all(.px(value))
    }
}
