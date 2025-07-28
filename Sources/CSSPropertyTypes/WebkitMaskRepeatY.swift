//
//  WebkitMaskRepeatY.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard CSS `-webkit-mask-repeat-y` property specifies whether and how 
/// a mask image is repeated (tiled) vertically.
///
/// This property controls the vertical repetition of a mask image independently from
/// the horizontal repetition. It can be used to create various masking effects where
/// the vertical repetition behavior is important.
///
/// Visual Reference:
/// ```
/// ┌──────────┐  ┌──────────┐
/// │    ■     │  │    ■     │
/// │    ■     │  │          │
/// │    ■     │  │          │
/// │    ■     │  │          │
/// │  repeat  │  │no-repeat │
/// └──────────┘  └──────────┘
///
/// ┌──────────┐  ┌──────────┐
/// │    ■     │  │    ■     │
/// │          │  │          │
/// │    ■     │  │    ■     │
/// │          │  │          │
/// │  space   │  │  round   │
/// └──────────┘  └──────────┘
/// ```
///
/// Example:
/// ```swift
/// // Repeat vertically (default)
/// .webkitMaskRepeatY(.repeat)
///
/// // Don't repeat vertically
/// .webkitMaskRepeatY(.noRepeat)
///
/// // Space images evenly without clipping
/// .webkitMaskRepeatY(.space)
///
/// // Stretch and repeat to fill the area
/// .webkitMaskRepeatY(.round)
///
/// // Multiple values for multiple masks
/// .webkitMaskRepeatY(.multiple([.repeat, .noRepeat]))
/// ```
///
/// - Note: This is a non-standard property. Consider using the standard `mask-repeat` property
///         for production sites when possible.
///
/// - SeeAlso: [MDN Web Docs on -webkit-mask-repeat-y](https://developer.mozilla.org/en-US/docs/Web/CSS/-webkit-mask-repeat-y)
public enum WebkitMaskRepeatY: Property {
    public static let property: String = "-webkit-mask-repeat-y"

    /// Repeat the mask image vertically (default)
    case `repeat`

    /// Don't repeat the mask image vertically
    case noRepeat

    /// Space mask images evenly in the vertical direction
    case space

    /// Stretch and repeat mask images to fill the space in the vertical direction
    case round

    /// Multiple repeat values for multiple masks
    case multiple([WebkitMaskRepeatY])

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a mask repeat-y with multiple values
    ///
    /// - Parameter repeats: The repeat values for multiple masks
    /// - Returns: A mask repeat-y with multiple values
    public init(_ repeats: [WebkitMaskRepeatY]) {
        if repeats.count == 1 {
            self = repeats[0]
        } else {
            self = .multiple(repeats)
        }
    }
}

/// String conversion for WebkitMaskRepeatY
extension WebkitMaskRepeatY: CustomStringConvertible {
    /// Converts the -webkit-mask-repeat-y value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// -webkit-mask-repeat-y: repeat;
    /// -webkit-mask-repeat-y: no-repeat;
    /// -webkit-mask-repeat-y: space;
    /// -webkit-mask-repeat-y: round;
    /// -webkit-mask-repeat-y: repeat, no-repeat;
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

/// Convenience methods for WebkitMaskRepeatY
extension WebkitMaskRepeatY {
    /// Default value (repeat)
    public static let `default` = WebkitMaskRepeatY.repeat

    /// Creates a mask repeat-y with multiple values
    ///
    /// - Parameter repeats: The repeat values
    /// - Returns: A mask repeat-y with multiple values
    public static func values(_ repeats: [WebkitMaskRepeatY]) -> WebkitMaskRepeatY {
        WebkitMaskRepeatY(repeats)
    }

    /// Creates a mask repeat-y with multiple values
    ///
    /// - Parameter repeats: The repeat values
    /// - Returns: A mask repeat-y with multiple values
    public static func values(_ repeats: WebkitMaskRepeatY...) -> WebkitMaskRepeatY {
        values(repeats)
    }
}
