import CSSTypeTypes
import Foundation

/// The CSS `min-inline-size` property defines the minimum size of an element in the inline direction.
/// When writing mode is horizontal, this refers to the element's minimum width. When writing mode
/// is vertical, this refers to the element's minimum height.
///
/// Example:
/// ```swift
/// .minInlineSize(.px(150))            // min-inline-size: 150px
/// .minInlineSize(.em(20))             // min-inline-size: 20em
/// .minInlineSize(.percentage(75))     // min-inline-size: 75%
/// .minInlineSize(.auto)               // min-inline-size: auto
/// .minInlineSize(.maxContent)         // min-inline-size: max-content
/// ```
///
/// - Note: This is a logical property that adapts to the writing mode of the document.
///
/// - SeeAlso: [MDN Web Docs on min-inline-size](https://developer.mozilla.org/en-US/docs/Web/CSS/min-inline-size)
public enum MinInlineSize: Property {
    public static let property: String = "min-inline-size"

    /// A specific size value (length, percentage, or calculated value)
    case size(Size)

    /// A global CSS value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension MinInlineSize: CustomStringConvertible {
    /// Converts the min-inline-size value to its CSS string representation
    public var description: String {
        switch self {
        case .size(let size):
            return size.description
        case .global(let global):
            return global.description
        }
    }
}

extension MinInlineSize: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> MinInlineSize {
        .size(.single(length))
    }
}

extension MinInlineSize {
    /// Automatic sizing (often resolves to 0)
    public static let auto: MinInlineSize = .size(.auto)

    /// Size based on the content's preferred size
    public static let maxContent: MinInlineSize = .size(.maxContent)

    /// Size based on the content's minimum size
    public static let minContent: MinInlineSize = .size(.minContent)

    /// Size that uses available space up to the max-content size
    public static let fitContent: MinInlineSize = .size(.fitContent)

    /// Size to fit within the element while preserving aspect ratio
    public static let contain: MinInlineSize = .size(.contain)

    /// Size to cover the entire element while preserving aspect ratio
    public static let cover: MinInlineSize = .size(.cover)
}

/// Allow for numeric literals to be used directly
extension MinInlineSize: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a min-inline-size with a pixel value from an integer literal
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    /// Creates a min-inline-size with a pixel value from a floating-point literal
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
