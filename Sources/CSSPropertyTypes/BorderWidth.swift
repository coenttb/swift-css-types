import CSSTypeTypes
import Foundation

/// Represents the CSS `border-width` shorthand property, which sets the width of an element's borders.
///
/// This property is a shorthand that sets the width for all four sides of an element's border.
/// You can specify from one to four widths to apply to different sides.
///
/// Visual Reference:
/// ```
/// One width for all sides:         Different widths for each side:
/// ┌───────────────────────┐        ┌────────────────────────┐
/// │                       │        │                        │
/// │                       │        │                        │
/// │                       │        │                        │
/// │                       │        │                        │
/// └───────────────────────┘        └────────────────────────┘
///  border-width: 2px               border-width: 1px 5px 3px 2px
///                                                ↑   ↑   ↑   ↑
///                                               top right bottom left
/// ```
///
/// Example:
/// ```swift
/// // Same width for all four borders
/// .borderWidth(.values(.px(2)))
///
/// // Different widths for top/bottom and left/right
/// .borderWidth(.values(vertical: .px(1), horizontal: .px(5)))
///
/// // Different widths for top, sides, and bottom
/// .borderWidth(.values(top: .thin, horizontal: .medium, bottom: .thick))
///
/// // Different width for each side
/// .borderWidth(.values(.px(1), .px(5), .px(3), .px(2)))
/// ```
///
/// - Note: This is a shorthand for setting the individual border width properties:
///         `border-top-width`, `border-right-width`, `border-bottom-width`, and `border-left-width`.
///
/// - SeeAlso: [MDN Web Docs on border-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-width)
public enum BorderWidth: Property {
    public static let property: String = "border-width"

    /// One of the various patterns of border width values
    /// The width values can be specified in multiple patterns:
    /// - Single width for all sides
    /// - Vertical and horizontal widths
    /// - Top, horizontal, and bottom widths
    /// - Top, right, bottom, and left widths
    case values(Values)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

}
extension BorderWidth {
    /// Represents different patterns of specifying border widths
    public struct Values: Sendable, Hashable, CustomStringConvertible {
        /// The width for the top border
        public let top: Width

        /// The width for the right border
        public let right: Width

        /// The width for the bottom border
        public let bottom: Width

        /// The width for the left border
        public let left: Width

        /// Pattern used to create this width values set
        private enum Pattern {
            case all
            case verticalHorizontal
            case topHorizontalBottom
            case fourSides
        }

        private let pattern: Pattern

        /// Creates a width values set with the same value for all sides
        ///
        /// - Parameter width: The width for all sides
        public init(_ width: Width) {
            self.top = width
            self.right = width
            self.bottom = width
            self.left = width
            self.pattern = .all
        }

        /// Creates width values with vertical and horizontal components
        ///
        /// - Parameters:
        ///   - vertical: The width for top and bottom borders
        ///   - horizontal: The width for left and right borders
        public init(vertical: Width, horizontal: Width) {
            self.top = vertical
            self.right = horizontal
            self.bottom = vertical
            self.left = horizontal
            self.pattern = .verticalHorizontal
        }

        /// Creates width values with top, horizontal, and bottom components
        ///
        /// - Parameters:
        ///   - top: The width for the top border
        ///   - horizontal: The width for left and right borders
        ///   - bottom: The width for the bottom border
        public init(top: Width, horizontal: Width, bottom: Width) {
            self.top = top
            self.right = horizontal
            self.bottom = bottom
            self.left = horizontal
            self.pattern = .topHorizontalBottom
        }

        /// Creates width values with specific widths for each side
        ///
        /// - Parameters:
        ///   - top: The width for the top border
        ///   - right: The width for the right border
        ///   - bottom: The width for the bottom border
        ///   - left: The width for the left border
        public init(_ top: Width, _ right: Width, _ bottom: Width, _ left: Width) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
            self.pattern = .fourSides
        }

        /// String representation of the width values
        public var description: String {
            switch pattern {
            case .all:
                return top.description
            case .verticalHorizontal:
                return "\(top.description) \(right.description)"
            case .topHorizontalBottom:
                return "\(top.description) \(right.description) \(bottom.description)"
            case .fourSides:
                return
                    "\(top.description) \(right.description) \(bottom.description) \(left.description)"
            }
        }
    }
}
extension BorderWidth {
    /// The possible width values for a border
    public enum Width: Sendable, Hashable, CustomStringConvertible, LengthConvertible {
        /// Thin line (usually 1px)
        case thin

        /// Medium line (usually 3px)
        case medium

        /// Thick line (usually 5px)
        case thick

        /// A specific length value
        case length(Length)

        /// String representation of the width
        public var description: String {
            switch self {
            case .thin:
                return "thin"
            case .medium:
                return "medium"
            case .thick:
                return "thick"
            case .length(let length):
                return length.description
            }
        }
    }
}

/// Convenience initializers for BorderWidth
extension BorderWidth {
    /// Creates a border width with the same value for all sides
    ///
    /// - Parameter width: The width for all sides
    public init(_ width: Width) {
        self = .values(.init(width))
    }

    /// Creates a border width with two values (vertical and horizontal)
    ///
    /// - Parameters:
    ///   - vertical: The width for top and bottom borders
    ///   - horizontal: The width for left and right borders
    public init(vertical: Width, horizontal: Width) {
        self = .values(.init(vertical, vertical, vertical, vertical))
    }

    /// Creates a border width with three values (top, horizontal, bottom)
    ///
    /// - Parameters:
    ///   - top: The width for the top border
    ///   - horizontal: The width for left and right borders
    ///   - bottom: The width for the bottom border
    public init(top: Width, horizontal: Width, bottom: Width) {
        self = .values(.init(top: top, horizontal: horizontal, bottom: bottom))
    }

    /// Creates a border width with four values (one for each side)
    ///
    /// - Parameters:
    ///   - top: The width for the top border
    ///   - right: The width for the right border
    ///   - bottom: The width for the bottom border
    ///   - left: The width for the left border
    public init(_ top: Width, _ right: Width, _ bottom: Width, _ left: Width) {
        self = .values(.init(top, right, bottom, left))
    }
}

/// Support for LengthConvertible
extension BorderWidth: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> BorderWidth {
        .values(.init(.init(length)))
    }
}

/// Provides string conversion for CSS output
extension BorderWidth: CustomStringConvertible {
    /// Converts the border-width to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-width: 2px;
    /// border-width: 1px 5px;
    /// border-width: thin medium thick;
    /// border-width: 1px 5px 3px 2px;
    /// border-width: inherit;
    /// ```
    public var description: String {
        switch self {
        case .values(let values):
            return values.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for creating BorderWidth values
extension BorderWidth {
    /// The default border width (medium)
    public static let `default` = BorderWidth(.medium)

    /// Creates a thin border width on all sides
    public static let thin = BorderWidth(.thin)

    /// Creates a medium border width on all sides
    public static let medium = BorderWidth(.medium)

    /// Creates a thick border width on all sides
    public static let thick = BorderWidth(.thick)
}

extension BorderBottomWidth: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> BorderBottomWidth {
        .width(.values(.init(.length(length))))
    }
}
