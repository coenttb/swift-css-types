//
//  WebkitMaskRepeatX.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard CSS `-webkit-mask-repeat-x` property specifies whether and how 
/// a mask image is repeated (tiled) horizontally.
///
/// This property controls the horizontal repetition of a mask image independently from
/// the vertical repetition. It can be used to create various masking effects where
/// the horizontal repetition behavior is important.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■   ■   ■   ■   ■   ■   ■ │  │ ■                         │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      repeat               │  │      no-repeat            │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■       ■       ■       ■ │  │ ■     ■     ■     ■     ■ │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      space                │  │      round                │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Repeat horizontally (default)
/// .webkitMaskRepeatX(.repeat)
///
/// // Don't repeat horizontally
/// .webkitMaskRepeatX(.noRepeat)
///
/// // Space images evenly without clipping
/// .webkitMaskRepeatX(.space)
///
/// // Stretch and repeat to fill the area
/// .webkitMaskRepeatX(.round)
///
/// // Multiple values for multiple masks
/// .webkitMaskRepeatX(.multiple([.repeat, .noRepeat]))
/// ```
///
/// - Note: This is a non-standard property. Consider using the standard `mask-repeat` property
///         for production sites when possible.
///
/// - SeeAlso: [MDN Web Docs on -webkit-mask-repeat-x](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-mask-repeat-x)
public enum WebkitMaskRepeatX: Property {
    public static let property: String = "-webkit-mask-repeat-x"

    /// Repeat the mask image horizontally (default)
    case `repeat`

    /// Don't repeat the mask image horizontally
    case noRepeat

    /// Space mask images evenly in the horizontal direction
    case space

    /// Stretch and repeat mask images to fill the space in the horizontal direction
    case round

    /// Multiple repeat values for multiple masks
    case multiple([WebkitMaskRepeatX])

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a mask repeat-x with multiple values
    ///
    /// - Parameter repeats: The repeat values for multiple masks
    /// - Returns: A mask repeat-x with multiple values
    public init(_ repeats: [WebkitMaskRepeatX]) {
        if repeats.count == 1 {
            self = repeats[0]
        } else {
            self = .multiple(repeats)
        }
    }
}

/// String conversion for WebkitMaskRepeatX
extension WebkitMaskRepeatX: CustomStringConvertible {
    /// Converts the -webkit-mask-repeat-x value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// -webkit-mask-repeat-x: repeat;
    /// -webkit-mask-repeat-x: no-repeat;
    /// -webkit-mask-repeat-x: space;
    /// -webkit-mask-repeat-x: round;
    /// -webkit-mask-repeat-x: repeat, no-repeat;
    /// ```
    public var description: String {
        switch self {
        case .repeat:
            return "repeat"
        case .noRepeat:
            return "no-repeat"
        case .space:
            return "space"
        case .round:
            return "round"
        case .multiple(let repeats):
            return repeats.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for WebkitMaskRepeatX
extension WebkitMaskRepeatX {
    /// Default value (repeat)
    public static let `default` = WebkitMaskRepeatX.repeat

    /// Creates a mask repeat-x with multiple values
    ///
    /// - Parameter repeats: The repeat values
    /// - Returns: A mask repeat-x with multiple values
    public static func values(_ repeats: [WebkitMaskRepeatX]) -> WebkitMaskRepeatX {
        WebkitMaskRepeatX(repeats)
    }

    /// Creates a mask repeat-x with multiple values
    ///
    /// - Parameter repeats: The repeat values
    /// - Returns: A mask repeat-x with multiple values
    public static func values(_ repeats: WebkitMaskRepeatX...) -> WebkitMaskRepeatX {
        values(repeats)
    }
}
