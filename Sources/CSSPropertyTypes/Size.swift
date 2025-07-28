//
//  Size.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/08/2024.
//

import CSSTypeTypes
import Foundation

/// Represents size-related CSS properties, primarily for `width`, `height`, and `object-fit` values.
///
/// The `Size` enum provides a way to specify dimensions for elements, either with specific measurements,
/// keyword values, or auto sizing. It can be used for a single dimension (width or height) or both
/// dimensions together, making it useful for various CSS properties that deal with element sizing.
///
/// ```
///    Size examples:
///    
///    auto:                     Specific dimensions:
///    +----------------+        +----------------+
///    |                |        |                |
///    | Content        |        | Fixed size     |
///    | determines     |        | regardless     |
///    | the size       |        | of content     |
///    |                |        |                |
///    +----------------+        +----------------+
///    (expands to fit)          (e.g., 300px × 200px)
///    
///    Different keyword values:
///    
///    max-content:              min-content:
///    +---------------------+    +-------+
///    | As wide as needed   |    | Wraps |
///    | without wrapping    |    | tightly|
///    +---------------------+    +-------+
///    
///    contain:                  cover:
///    +----------------+        +----------------+
///    |  +---------+   |        |+----------------+
///    |  | Scaled  |   |        || Scaled to cover |
///    |  | to fit  |   |        || entire area     |
///    |  +---------+   |        |+----------------+|
///    +----------------+        +----------------+
///    (may have letterboxing)   (may crop edges)
/// ```
///
/// Example usage:
/// ```swift
/// // Single dimension
/// let widthSize = Size.width(.px(300))
/// // CSS: width: 300px;
///
/// // Both dimensions
/// let specificSize = Size.size(width: .px(300), height: .px(200))
/// // CSS: width: 300px; height: 200px;
///
/// // Using auto sizing
/// let autoSize = Size.auto
/// // CSS: width: auto; or height: auto;
///
/// // Using keywords
/// let maxContentSize = Size.maxContent
/// // CSS: width: max-content; or height: max-content;
///
/// // Using numeric literals
/// let pixelSize: Size = 300
/// // CSS: width: 300px; or height: 300px;
/// ```
///
/// - SeeAlso: [MDN Web Docs: width](https://developer.mozilla.org/en-US/docs/Web/CSS/width)
/// - SeeAlso: [MDN Web Docs: height](https://developer.mozilla.org/en-US/docs/Web/CSS/height)
/// - SeeAlso: [MDN Web Docs: object-fit](https://developer.mozilla.org/en-US/docs/Web/CSS/object-fit)
public enum Size: Property {
    public static let property: String = "size"

    /// A single dimension value, which can be used for either width or height.
    case single(Length)

    /// Both width and height values specified together.
    case double(width: Length, height: Length)

    /// A keyword value for special sizing behaviors.
    case keyword(Keyword)

    /// Automatic sizing based on content and context.
    case auto

    case global(Global)

    /// Keywords for special sizing behaviors.
    public enum Keyword: String, Sendable {
        /// The intrinsic preferred size (the largest size the content can have without overflow).
        case maxContent = "max-content"

        /// The intrinsic minimum size (the smallest size possible without overflow).
        case minContent = "min-content"

        /// Uses available space up to a maximum of max-content.
        case fitContent = "fit-content"

        /// Scales content to fit within the element's box while preserving aspect ratio.
        /// May result in letterboxing (empty space) to avoid overflow.
        case containingBlock = "contain"

        /// Scales content to cover the entire element's box while preserving aspect ratio.
        /// May result in some content being cropped to avoid any empty space.
        case cover
    }
}

extension Size: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> Size {
        .single(length)
    }
}

/// Allows Size to be created from integer literals.
extension Size: ExpressibleByIntegerLiteral {
    /// Creates a Size from an integer literal, interpreting it as pixels.
    ///
    /// This allows you to write `let size: Size = 300` instead of
    /// `let size = Size.single(.px(300))`.
    ///
    /// - Parameter value: The integer value in pixels.
    public init(integerLiteral value: Int) {
        self = .single(.px(Double(value)))
    }
}

/// Allows Size to be created from floating-point literals.
extension Size: ExpressibleByFloatLiteral {
    /// Creates a Size from a floating-point literal, interpreting it as pixels.
    ///
    /// This allows you to write `let size: Size = 300.5` instead of
    /// `let size = Size.single(.px(300.5))`.
    ///
    /// - Parameter value: The floating-point value in pixels.
    public init(floatLiteral value: Double) {
        self = .single(.px(value))
    }
}

/// Factory methods for creating Size instances.
extension Size {
    /// Creates a Size representing width.
    ///
    /// - Parameter width: The width value.
    /// - Returns: A Size instance for width.
    public static func width(_ width: Length) -> Self {
        .single(width)
    }

    /// Creates a Size representing height.
    ///
    /// - Parameter height: The height value.
    /// - Returns: A Size instance for height.
    public static func height(_ height: Length) -> Self {
        .single(height)
    }

    /// Creates a Size representing both width and height.
    ///
    /// - Parameters:
    ///   - width: The width value.
    ///   - height: The height value.
    /// - Returns: A Size instance for both width and height.
    public static func size(width: Length, height: Length) -> Self {
        .double(width: width, height: height)
    }
}

/// CustomStringConvertible conformance for CSS string representation.
extension Size: CustomStringConvertible {
    /// Returns the CSS representation of the size value.
    ///
    /// - For `.single`, returns the length value (e.g., "300px")
    /// - For `.double`, returns width and height separated by a space (e.g., "300px 200px")
    /// - For `.keyword`, returns the keyword value (e.g., "max-content", "contain")
    /// - For `.auto`, returns "auto"
    ///
    /// - Returns: A string containing the CSS value for the size property.
    public var description: String {
        switch self {
        case .single(let length):
            return length.description
        case .double(let width, let height):
            return "\(width) \(height)"
        case .keyword(let keyword):
            return keyword.rawValue
        case .auto:
            return "auto"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience static properties for commonly used size values.
extension Size {
    /// Size based on the content's preferred size (without wrapping).
    /// Equivalent to `.keyword(.maxContent)`.
    public static let maxContent: Self = .keyword(.maxContent)

    /// Size based on the content's minimum size (with tight wrapping).
    /// Equivalent to `.keyword(.minContent)`.
    public static let minContent: Self = .keyword(.minContent)

    /// Size that uses available space up to the max-content size.
    /// Equivalent to `.keyword(.fitContent)`.
    public static let fitContent: Self = .keyword(.fitContent)

    /// Scales content to fit within the element while preserving aspect ratio.
    /// Equivalent to `.keyword(.containingBlock)`.
    public static let contain: Self = .keyword(.containingBlock)

    /// Scales content to cover the entire element while preserving aspect ratio.
    /// Equivalent to `.keyword(.cover)`.
    public static let cover: Self = .keyword(.cover)
}
