//
//  ZIndex.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `z-index` property sets the z-order of a positioned element and its descendants or flex/grid items.
/// 
/// Overlapping elements with a larger z-index cover those with a smaller one.
/// 
/// For a positioned box (one with any position other than static), the z-index property specifies:
/// - The stack level of the box in the current stacking context
/// - Whether the box establishes a local stacking context
///
/// - SeeAlso: [MDN Web Docs on z-index](https://developer.mozilla.org/en-US/docs/Web/CSS/z-index)
public enum ZIndex: Property {
    public static let property: String = "z-index"

    /// The box does not establish a new local stacking context.
    /// The stack level of the generated box in the current stacking context is 0.
    case auto

    /// This integer is the stack level of the generated box in the current stacking context.
    /// The box also establishes a local stacking context.
    case integer(Int)

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .integer(let value):
            return "\(value)"
        case .global(let global):
            return global.description
        }
    }
}

extension ZIndex: ExpressibleByIntegerLiteral {
    /// Creates a z-index with an integer value
    ///
    /// This allows you to use integers directly where z-index values are expected.
    ///
    /// ```swift
    /// .zIndex(5)  // equivalent to .zIndex(.integer(5))
    /// ```
    public init(integerLiteral value: Int) {
        self = .integer(value)
    }
}
