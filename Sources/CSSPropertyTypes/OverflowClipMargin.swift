import CSSTypeTypes
import Foundation

/// The `overflow-clip-margin` CSS property determines how far outside its bounds an element with
/// `overflow: clip` may be painted before being clipped. The bound defined by this property is called
/// the overflow clip edge of the box.
///
/// This property allows content to overflow slightly outside the element's box when using `overflow: clip`,
/// which can be useful for effects that need to extend slightly beyond the box boundaries.
///
/// Example:
/// ```swift
/// .overflowClipMargin(.px(10))                      // overflow-clip-margin: 10px
/// .overflowClipMargin(.em(1.5))                     // overflow-clip-margin: 1.5em
/// .overflowClipMargin(.visualBox(.contentBox))      // overflow-clip-margin: content-box
/// .overflowClipMargin(.visualBox(.paddingBox))      // overflow-clip-margin: padding-box
/// .overflowClipMargin(.visualBox(.borderBox))       // overflow-clip-margin: border-box
///
/// // Visual box with a margin
/// .overflowClipMargin(.boxWithLength(.contentBox, .px(5)))  // overflow-clip-margin: content-box 5px
/// ```
///
/// - Note: If the element does not have `overflow: clip` then this property will be ignored.
///
/// - SeeAlso: [MDN Web Docs on overflow-clip-margin](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-clip-margin)
public enum OverflowClipMargin: Property {
    public static let property: String = "overflow-clip-margin"

    /// A length value for the clip margin
    case length(Length)

    /// A visual box reference point
    case visualBox(VisualBox)

    /// A visual box with a specific margin length
    case boxWithLength(VisualBox, Length)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    /// Visual box reference points
    public enum VisualBox: String, Sendable, Hashable {
        /// The content box edge
        case contentBox = "content-box"

        /// The padding box edge
        case paddingBox = "padding-box"

        /// The border box edge
        case borderBox = "border-box"
    }

    /// CSS string representation
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .visualBox(let box):
            return box.rawValue
        case .boxWithLength(let box, let length):
            return "\(box.rawValue) \(length.description)"
        case .global(let global):
            return global.description
        }
    }
}

/// Extension for convenient initialization with different length units
extension OverflowClipMargin: LengthConvertible {
    /// Create a clip margin with pixel units
    public static func px(_ value: Double) -> OverflowClipMargin {
        .length(.px(value))
    }

    /// Create a clip margin with em units
    public static func em(_ value: Double) -> OverflowClipMargin {
        .length(.em(value))
    }

    /// Create a clip margin with rem units
    public static func rem(_ value: Double) -> OverflowClipMargin {
        .length(.rem(value))
    }
}

/// Extension for numeric literal initialization
extension OverflowClipMargin: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Initialize from an integer literal as pixels
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    /// Initialize from a float literal as pixels
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
