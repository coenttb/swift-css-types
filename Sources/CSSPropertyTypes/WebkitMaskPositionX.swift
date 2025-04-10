//
//  WebkitMaskPositionX.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The non-standard CSS `-webkit-mask-position-x` property sets the initial horizontal position of a mask image.
///
/// This property allows specifying the horizontal position of a mask image independently
/// from the vertical position, which is controlled by `-webkit-mask-position-y`.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■                         │  │             ■             │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      left (0%)            │  │      center (50%)         │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                         ■ │  │                        ■  │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      right (100%)         │  │      100px               │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Position at the left edge (default)
/// .webkitMaskPositionX(.left)
///
/// // Position at the horizontal center
/// .webkitMaskPositionX(.center)
///
/// // Position at the right edge
/// .webkitMaskPositionX(.right)
///
/// // Position at a specific percentage
/// .webkitMaskPositionX(.value(.percentage(25)))
///
/// // Position at a specific pixel value
/// .webkitMaskPositionX(.value(.px(50)))
///
/// // Multiple positions for multiple masks
/// .webkitMaskPositionX(.multiple([.left, .right]))
/// ```
///
/// - Note: This is a non-standard property. Consider using the standard `mask-position` property
///         for production sites when possible.
///
/// - SeeAlso: [MDN Web Docs on -webkit-mask-position-x](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-mask-position-x)
public enum WebkitMaskPositionX: Property, LengthPercentageConvertible {
    public static let property: String = "-webkit-mask-position-x"
    
    /// Left edge position (0%)
    case left
    
    /// Horizontal center position (50%)
    case center
    
    /// Right edge position (100%)
    case right
    
    /// A position defined by a length or percentage value
    case lengthPercentage(LengthPercentage)
    
    /// Multiple horizontal positions for multiple masks
    case multiple([WebkitMaskPositionX])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a mask position-x with multiple values
    ///
    /// - Parameter positions: The position values
    /// - Returns: A mask position-x with multiple values
    public init(_ positions: [WebkitMaskPositionX]) {
        if positions.count == 1 {
            self = positions[0]
        } else {
            self = .multiple(positions)
        }
    }
}

/// String conversion for WebkitMaskPositionX
extension WebkitMaskPositionX: CustomStringConvertible {
    /// Converts the -webkit-mask-position-x value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// -webkit-mask-position-x: left;
    /// -webkit-mask-position-x: center;
    /// -webkit-mask-position-x: right;
    /// -webkit-mask-position-x: 25%;
    /// -webkit-mask-position-x: 100px;
    /// -webkit-mask-position-x: left, right;
    /// ```
    public var description: String {
        switch self {
        case .left:
            return "left"
        case .center:
            return "center"
        case .right:
            return "right"
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .multiple(let positions):
            return positions.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for WebkitMaskPositionX
extension WebkitMaskPositionX {
    /// Creates a position with multiple values
    ///
    /// - Parameter positions: The position values
    /// - Returns: A horizontal position with multiple values
    public static func values(_ positions: [WebkitMaskPositionX]) -> WebkitMaskPositionX {
        WebkitMaskPositionX(positions)
    }
    
    /// Creates a position with multiple values
    ///
    /// - Parameter positions: The position values
    /// - Returns: A horizontal position with multiple values
    public static func values(_ positions: WebkitMaskPositionX...) -> WebkitMaskPositionX {
        values(positions)
    }
}
