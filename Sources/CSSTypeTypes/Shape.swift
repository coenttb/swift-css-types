import Foundation

/// Represents a legacy CSS shape value for use with the deprecated `clip` property.
///
/// The `Shape` data type defines the specific form of a region to which the deprecated
/// `clip` property applies. It is only supported through the `rect()` function.
///
/// Example:
/// ```swift
/// .clip(.rect(top: .px(10), right: .px(100), bottom: .px(100), left: .px(10)))  // clip: rect(10px, 100px, 100px, 10px)
/// ```
///
/// - Important: This type is deprecated. Use `clip-path` with `BasicShape` instead.
///
/// - SeeAlso: [MDN Web Docs on shape](https://developer.mozilla.org/en-US/docs/Web/CSS/shape)
@available(
    *,
    deprecated,
    message: "The clip property is deprecated. Use clip-path with BasicShape instead."
)
public enum Shape: Sendable, Hashable {
    /// Represents a rectangle clip region
    ///
    /// - Parameters:
    ///   - top: Offset from the top border edge of the element's box
    ///   - right: Offset from the left border edge of the element's box
    ///   - bottom: Offset from the top border edge of the element's box
    ///   - left: Offset from the left border edge of the element's box
    case rect(top: Length, right: Length, bottom: Length, left: Length)
}

/// Provides string conversion for CSS output
@available(
    *,
    deprecated,
    message: "The clip property is deprecated. Use clip-path with BasicShape instead."
)
extension Shape: CustomStringConvertible {
    /// Converts the shape to its CSS string representation
    public var description: String {
        switch self {
        case .rect(let top, let right, let bottom, let left):
            return "rect(\(top), \(right), \(bottom), \(left))"
        }
    }
}

/// Factory methods for creating shapes
@available(
    *,
    deprecated,
    message: "The clip property is deprecated. Use clip-path with BasicShape instead."
)
extension Shape {
    /// Creates a rectangular clip region using pixel values
    ///
    /// - Parameters:
    ///   - top: Top offset in pixels
    ///   - right: Right offset in pixels
    ///   - bottom: Bottom offset in pixels
    ///   - left: Left offset in pixels
    /// - Returns: A rectangle shape
    public static func rect(top: Double, right: Double, bottom: Double, left: Double) -> Shape {
        return .rect(top: .px(top), right: .px(right), bottom: .px(bottom), left: .px(left))
    }

    /// Creates a rectangular clip region with the same offset on all sides
    ///
    /// - Parameter all: Offset in pixels for all sides
    /// - Returns: A rectangle shape
    public static func rect(all: Double) -> Shape {
        return .rect(top: all, right: all, bottom: all, left: all)
    }

    /// Creates a rectangular clip region with auto values
    ///
    /// - Returns: A rectangle shape with auto values for all sides
    @available(
        *,
        deprecated,
        message:
            "Auto values are not well supported for rect(). Use clip-path with BasicShape instead."
    )
    public static let auto = Shape.rect(
        top: .auto,
        right: .auto,
        bottom: .auto,
        left: .auto
    )
}
