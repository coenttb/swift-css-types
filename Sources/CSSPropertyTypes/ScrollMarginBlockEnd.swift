//
//  ScrollMarginBlockEnd.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The `scroll-margin-block-end` property defines the margin of the scroll snap area at the end
/// of the block dimension that is used for snapping this box to the snapport.
///
/// This is the logical equivalent of scroll-margin-bottom in horizontal writing modes.
///
/// Example:
/// ```css
/// scroll-margin-block-end: 10px;
/// scroll-margin-block-end: 1em;
/// ```
public enum ScrollMarginBlockEnd: Property, LengthConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral, CustomStringConvertible {
    public static let property: String = "scroll-margin-block-end"
    
    /// A length value for the block-end scroll margin
    case length(Length)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .global(let global):
            return global.description
        }
    }

    /// Creates a ScrollMarginBlockEnd using an integer literal (interpreted as pixels)
    public init(integerLiteral value: Int) {
        self = .length(.px(Double(value)))
    }
    
    /// Creates a ScrollMarginBlockEnd using a floating-point literal (interpreted as pixels)
    public init(floatLiteral value: Double) {
        self = .length(.px(value))
    }
}
