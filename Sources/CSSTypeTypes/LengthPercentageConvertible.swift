//
//  LengthConvertible.swift
//  swift-css
//
//  Created on 03/23/2025.
//

import Foundation

/// Protocol for types that can be created from CSS Length values
///
/// LengthConvertible provides a common interface for types that accept CSS length values.
/// This enables consistent handling of length values across different CSS properties,
/// allowing for ergonomic API design and code reuse.
///
/// Types that conform to this protocol can be initialized with any CSS Length value
/// and gain access to a standard set of factory methods for creating instances with
/// common CSS units.
///
/// Example:
/// ```swift
/// // GridTrack conforms to LengthConvertible
/// GridTrack.px(100)      // 100px
/// GridTrack.fr(1)        // 1fr
/// GridTrack.percentage(50)  // 50%
///
/// // Direct conversion from Length values
/// let length: Length = .px(200)
/// let track = GridTrack(length)
/// ```
///
/// This protocol is particularly useful for CSS properties that accept length values
/// but require specific types for additional functionality or validation.
package protocol LengthPercentageConvertible: LengthConvertible & PercentageConvertible {
    static func lengthPercentage(_ value: LengthPercentage) -> Self
}

extension LengthPercentageConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> Self {
        .lengthPercentage(.length(length))
    }
    
    public static func percentage(_ percentage: CSSTypeTypes.Percentage) -> Self {
        .lengthPercentage(.percentage(percentage))
    }
}

extension LengthPercentageConvertible {
    public static var zero: Self { .length(.zero) }
}
