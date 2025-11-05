//
// MaskPosition.swift
//
// Copyright (c) 2023 Coen Stam
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-position` property, which sets the initial position of mask images.
///
/// This property sets the initial position for each mask image relative to the positioning layer
/// specified by `mask-origin`. Multiple position values can be provided for multiple mask images.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■                         │  │             ■             │
/// │                           │  │                           │
/// │       left top            │  │       center              │
/// │       (0% 0%)             │  │       (50% 50%)           │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                         ■ │  │                           │
/// │                           │  │                           │
/// │       right top           │  │       bottom 10px         │
/// │       (100% 0%)           │  │       right 20px          │
/// │                           │  │           ■               │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Position in the center
/// .maskPosition(.center)
///
/// // Position at the top
/// .maskPosition(.top)
///
/// // Position at the top right corner
/// .maskPosition(.topRight)
///
/// // Position at specific percentages
/// .maskPosition(.percentage(25, 75))
///
/// // Position at specific pixel values
/// .maskPosition(.px(10, 20))
///
/// // Position with edge offsets
/// .maskPosition(.offsets(.bottom, .px(10), .right, .px(20)))
///
/// // Multiple positions for multiple masks
/// .maskPosition([.topLeft, .bottomRight])
/// ```
///
/// - Note: If one mask image is specified but multiple positions, only the first position is used.
///         If multiple images are specified but fewer positions, the positions will be repeated as needed.
///
/// - SeeAlso: [MDN Web Docs on mask-position](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-position)
public enum MaskPosition: Property {
    public static let property: String = "mask-position"

    /// A single position value
    case single(CSSTypeTypes.Position)

    /// Multiple position values for multiple masks
    case multiple([CSSTypeTypes.Position])

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a mask position with a single position
    ///
    /// - Parameter position: The position value
    public init(_ position: CSSTypeTypes.Position) {
        self = .single(position)
    }

    /// Creates a mask position with multiple positions
    ///
    /// - Parameter positions: The position values
    public init(_ positions: [CSSTypeTypes.Position]) {
        if positions.count == 1 {
            self = .single(positions[0])
        } else {
            self = .multiple(positions)
        }
    }
}

/// Provides string conversion for CSS output
extension MaskPosition: CustomStringConvertible {
    /// Converts the mask-position value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-position: center;
    /// mask-position: top right;
    /// mask-position: 25% 75%;
    /// mask-position: bottom 10px right 20px;
    /// mask-position: center, top left;
    /// ```
    public var description: String {
        switch self {
        case .single(let position):
            return position.description
        case .multiple(let positions):
            return positions.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension MaskPosition {
    /// The default value for mask-position (`0% 0%`)
    public static let `default` = MaskPosition(.values(.percentage(0), .percentage(0)))

    /// Position in the center
    public static let center = MaskPosition(.center)

    /// Position at the top
    public static let top = MaskPosition(.top)

    /// Position at the right
    public static let right = MaskPosition(.right)

    /// Position at the bottom
    public static let bottom = MaskPosition(.bottom)

    /// Position at the left
    public static let left = MaskPosition(.left)

    /// Position at the top left (default)
    public static let topLeft = MaskPosition(.topLeft)

    /// Position at the top right
    public static let topRight = MaskPosition(.topRight)

    /// Position at the bottom left
    public static let bottomLeft = MaskPosition(.bottomLeft)

    /// Position at the bottom right
    public static let bottomRight = MaskPosition(.bottomRight)

    /// Creates a mask position with percentage values
    ///
    /// - Parameters:
    ///   - x: Horizontal position percentage (0-100)
    ///   - y: Vertical position percentage (0-100)
    /// - Returns: A mask position with percentage values
    public static func percentage(_ x: Percentage, _ y: Percentage) -> MaskPosition {
        .single(.values(.percentage(x), .percentage(y)))
    }
    //
    //    /// Creates a mask position with pixel values
    //    ///
    //    /// - Parameters:
    //    ///   - x: Horizontal position in pixels
    //    ///   - y: Vertical position in pixels
    //    /// - Returns: A mask position with pixel values
    //    public static func px(_ x: Double, _ y: Double) -> MaskPosition {
    //        .single(.values(.px(x, y)))
    //    }

    /// Creates a mask position with edge offsets
    ///
    /// - Parameters:
    ///   - edge1: First edge (top, right, bottom, left)
    ///   - offset1: Offset from the first edge
    ///   - edge2: Second edge (top, right, bottom, left)
    ///   - offset2: Offset from the second edge
    /// - Returns: A mask position with edge offsets
    public static func offsets(
        _ edge1: CSSTypeTypes.Position.Keyword,
        _ offset1: LengthPercentage,
        _ edge2: CSSTypeTypes.Position.Keyword,
        _ offset2: LengthPercentage
    ) -> MaskPosition {
        MaskPosition(.offsets(edge1, offset1, edge2, offset2))
    }

    /// Creates a mask position with multiple values
    ///
    /// - Parameter positions: The position values
    /// - Returns: A mask position with multiple values
    public static func values(_ positions: [CSSTypeTypes.Position]) -> MaskPosition {
        MaskPosition(positions)
    }

    /// Creates a mask position with multiple values
    ///
    /// - Parameter positions: The position values
    /// - Returns: A mask position with multiple values
    public static func values(_ positions: CSSTypeTypes.Position...) -> MaskPosition {
        values(positions)
    }
}
