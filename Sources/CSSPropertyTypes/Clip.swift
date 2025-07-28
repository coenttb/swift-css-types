import CSSTypeTypes
import Foundation

/// The CSS `clip` property defines a visible portion of an element.
/// The clip property applies only to absolutely positioned elements
/// (elements with position set to absolute or fixed).
///
/// Example:
/// ```swift
/// .clip(.auto)                               // clip: auto
/// .clip(.rect(top: 0, right: 10, bottom: 3, left: 2)) // clip: rect(0, 10px, 3px, 2px)
/// ```
///
/// - Warning: This property is deprecated. Use the `clip-path` property instead for new code.
///
/// - SeeAlso: [MDN Web Docs on clip](https://developer.mozilla.org/en-US/docs/Web/CSS/clip)
public enum Clip: Property {
    public static let property: String = "clip"
    /// The element does not clip (default).
    case auto

    /// A rectangular shape that clips the element.
    case rect(ClipRect)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// Represents a rectangular clipping shape
public struct ClipRect: Sendable, Hashable {
    /// Offset from the top edge (or auto)
    public var top: ClipValue

    /// Offset from the right edge (or auto)
    public var right: ClipValue

    /// Offset from the bottom edge (or auto)
    public var bottom: ClipValue

    /// Offset from the left edge (or auto)
    public var left: ClipValue

    /// Initializes a clip rectangle with specific values
    public init(top: ClipValue, right: ClipValue, bottom: ClipValue, left: ClipValue) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
    }

    /// Initializes a clip rectangle with numeric pixel values
    public init(top: Double, right: Double, bottom: Double, left: Double) {
        self.top = .length(.px(top))
        self.right = .length(.px(right))
        self.bottom = .length(.px(bottom))
        self.left = .length(.px(left))
    }
}

/// Represents a value for a clip rectangle side
public enum ClipValue: Sendable, Hashable, LengthConvertible {
    /// A length value
    case length(Length)

    /// An auto value, which clips to the inside border edge
    case auto
}

/// CSS Output conversion
extension ClipValue: CustomStringConvertible {
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .auto:
            return "auto"
        }
    }
}

/// CSS Output conversion
extension ClipRect: CustomStringConvertible {
    public var description: String {
        "rect(\(top), \(right), \(bottom), \(left))"
    }
}

/// CSS Output conversion
extension Clip: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .rect(let rect):
            return rect.description

        case .global(let global):
            return global.description
        }
    }
}

/// Factory methods
extension Clip {
    /// Creates a rectangular clip with the given values
    public static func rect(top: ClipValue, right: ClipValue, bottom: ClipValue, left: ClipValue) -> Clip {
        .rect(ClipRect(top: top, right: right, bottom: bottom, left: left))
    }

    /// Creates a rectangular clip with pixel values
    public static func rect(top: Double, right: Double, bottom: Double, left: Double) -> Clip {
        .rect(ClipRect(top: top, right: right, bottom: bottom, left: left))
    }
}
