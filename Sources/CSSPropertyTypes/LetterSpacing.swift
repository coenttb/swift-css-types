//
//  LetterSpacing.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The letter-spacing CSS property sets the horizontal spacing behavior between text characters.
///
/// This value is added to the natural spacing between characters while rendering the text.
/// Positive values of letter-spacing cause characters to spread farther apart, while negative
/// values bring characters closer together.
///
/// Example:
/// ```swift
/// .letterSpacing(.normal)          // letter-spacing: normal
/// .letterSpacing(.px(3))           // letter-spacing: 3px
/// .letterSpacing(.em(0.3))         // letter-spacing: 0.3em
/// .letterSpacing(.initial)         // letter-spacing: initial
/// ```
///
/// - Note: For some written languages like Arabic, letter spacing should not be applied
///         as it can break the visual flow of connected letters.
///
/// - SeeAlso: [MDN Web Docs on letter-spacing](https://developer.mozilla.org/en-US/docs/Web/CSS/letter-spacing)
public enum LetterSpacing: Property, LengthPercentageConvertible {
    public static let property: String = "letter-spacing"
    /// The normal letter spacing for the current font
    case normal
    
    /// A specific length value for letter spacing
    case lengthPercentage(LengthPercentage)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Converts the letter-spacing value to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience expressions for letter-spacing values
extension LetterSpacing: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a letter-spacing from an integer literal (in pixels)
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }
    
    /// Creates a letter-spacing from a floating-point literal (in pixels)
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}

/// Common letter-spacing values
extension LetterSpacing {
    /// Zero letter-spacing
    public static let zero: LetterSpacing = .px(0)
    
    /// A tight letter-spacing (-0.05em)
    public static let tight: LetterSpacing = .em(-0.05)
    
    /// A wide letter-spacing (0.1em)
    public static let wide: LetterSpacing = .em(0.1)
    
    /// A very wide letter-spacing (0.25em)
    public static let veryWide: LetterSpacing = .em(0.25)
}
