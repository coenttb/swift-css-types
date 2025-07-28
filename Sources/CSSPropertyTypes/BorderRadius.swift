import CSSTypeTypes
import Foundation

/// Represents the CSS `border-radius` shorthand property, which rounds the corners of an element's border.
///
/// This property is a shorthand for setting the four border-radius properties 
/// (border-top-left-radius, border-top-right-radius, border-bottom-right-radius, 
/// and border-bottom-left-radius) simultaneously.
///
/// Visual Reference:
/// ```
/// Uniform radius:                    Different radii:
/// ┌────────────╮────────────┐       ┌────────────╮────────────┐
/// │                         │       │                         │
/// │                         │       │                         │
/// │                         │       │                         │
/// │                         │       │                         │
/// └────────────╮────────────┘       └─────────╮───────────────┘
///  border-radius: 10px              border-radius: 10px 20px 30px 40px
/// ```
///
/// Example:
/// ```swift
/// // Set uniform radius for all corners
/// .borderRadius(.px(10))
/// // or
/// .borderRadius(.values(.uniform(.px(10))))
///
/// // Set different radii for top-left/bottom-right and top-right/bottom-left
/// .borderRadius(.px(10, 20))
/// // or
/// .borderRadius(.values(.twoValues(.px(10), .px(20))))
///
/// // Set different radii for top-left, top-right/bottom-left, and bottom-right
/// .borderRadius(.px(10, 20, 30))
/// // or
/// .borderRadius(.values(.threeValues(.px(10), .px(20), .px(30))))
///
/// // Set different radii for all four corners
/// .borderRadius(.px(10, 20, 30, 40))
/// // or
/// .borderRadius(.values(.fourValues(.px(10), .px(20), .px(30), .px(40))))
///
/// // Set elliptical corners
/// .borderRadius(.elliptical(.px(10), .px(15)))
/// // or
/// .borderRadius(.values(.elliptical(
///     [.px(10), .px(20), .px(30), .px(40)],
///     [.px(15), .px(25), .px(35), .px(45)]
/// )))
///
/// // Use a global value
/// .borderRadius(.inherit)
/// // or
/// .borderRadius(.global(.inherit))
/// ```
///
/// - Note: When using percentages, the horizontal radius is a percentage of the element's width,
///         and the vertical radius is a percentage of the element's height.
///
/// - SeeAlso: [MDN Web Docs on border-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)
public enum BorderRadius: Property {
    public static let property: String = "border-radius"

    /// Border radius values
    case values(Values)

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

extension BorderRadius {
    /// Represents the corner radii values for a border-radius
    public struct Values: Sendable, Hashable, CustomStringConvertible {
        /// Horizontal radii for the four corners (top-left, top-right, bottom-right, bottom-left)
        public let horizontal: [LengthPercentage]

        /// Optional vertical radii for the four corners, for elliptical corners
        public let vertical: [LengthPercentage]?

        /// Creates a Values instance with horizontal radii and optional vertical radii
        ///
        /// - Parameters:
        ///   - horizontal: The horizontal radii (1-4 values that will be expanded according to CSS rules)
        ///   - vertical: The optional vertical radii (1-4 values that will be expanded according to CSS rules)
        public init(horizontal: [LengthPercentage], vertical: [LengthPercentage]? = nil) {
            self.horizontal = Values.expandRadii(horizontal)
            self.vertical = vertical.map(Values.expandRadii)
        }

        /// Creates a Values instance with the same radius for all corners
        ///
        /// - Parameter radius: The radius to use for all corners
        public init(_ radius: LengthPercentage) {
            self.init(horizontal: [radius])
        }

        /// Creates a Values instance with two values
        /// First for top-left & bottom-right, second for top-right & bottom-left
        ///
        /// - Parameters:
        ///   - first: Radius for top-left and bottom-right corners
        ///   - second: Radius for top-right and bottom-left corners
        public init(_ first: LengthPercentage, _ second: LengthPercentage) {
            self.init(horizontal: [first, second])
        }

        /// Creates a Values instance with three values
        /// First for top-left, second for top-right & bottom-left, third for bottom-right
        ///
        /// - Parameters:
        ///   - first: Radius for top-left corner
        ///   - second: Radius for top-right and bottom-left corners
        ///   - third: Radius for bottom-right corner
        public init(_ first: LengthPercentage, _ second: LengthPercentage, _ third: LengthPercentage) {
            self.init(horizontal: [first, second, third])
        }

        /// Creates a Values instance with four values
        /// For top-left, top-right, bottom-right, and bottom-left corners respectively
        ///
        /// - Parameters:
        ///   - topLeft: Radius for top-left corner
        ///   - topRight: Radius for top-right corner
        ///   - bottomRight: Radius for bottom-right corner
        ///   - bottomLeft: Radius for bottom-left corner
        public init(_ topLeft: LengthPercentage, _ topRight: LengthPercentage, _ bottomRight: LengthPercentage, _ bottomLeft: LengthPercentage) {
            self.init(horizontal: [topLeft, topRight, bottomRight, bottomLeft])
        }

        /// Creates a Values instance with elliptical corners (uniform horizontal and vertical radii)
        ///
        /// - Parameters:
        ///   - horizontal: The horizontal radius for all corners
        ///   - vertical: The vertical radius for all corners
        public init(horizontal: LengthPercentage, vertical: LengthPercentage) {
            self.init(horizontal: [horizontal], vertical: [vertical])
        }

        /// Expands an array of radii according to CSS rules
        ///
        /// CSS has specific rules for how shorthand values are expanded:
        /// - 1 value: Same value for all corners
        /// - 2 values: First for top-left/bottom-right, second for top-right/bottom-left
        /// - 3 values: First for top-left, second for top-right/bottom-left, third for bottom-right
        /// - 4 values: One for each corner in clockwise order
        ///
        /// - Parameter radii: Array of radii [1-4 values]
        /// - Returns: Array with exactly 4 values
        private static func expandRadii(_ radii: [LengthPercentage]) -> [LengthPercentage] {
            switch radii.count {
            case 0:
                return [.px(0), .px(0), .px(0), .px(0)]
            case 1:
                return [radii[0], radii[0], radii[0], radii[0]]
            case 2:
                return [radii[0], radii[1], radii[0], radii[1]]
            case 3:
                return [radii[0], radii[1], radii[2], radii[1]]
            case 4:
                return [radii[0], radii[1], radii[2], radii[3]]
            default:
                // Truncate to 4 values if more are provided
                return Array(radii.prefix(4))
            }
        }

        /// String representation of the radius values according to CSS syntax
        public var description: String {
            guard let vertical = vertical, !vertical.isEmpty else {
                // Only horizontal values
                return formatCSSValues(horizontal)
            }

            // Both horizontal and vertical values (elliptical corners)
            return "\(formatCSSValues(horizontal)) / \(formatCSSValues(vertical))"
        }

        /// Formats array values for CSS output, applying CSS shorthand optimizations
        private func formatCSSValues(_ values: [LengthPercentage]) -> String {
            guard !values.isEmpty else { return "" }

            // Apply CSS shorthand optimization for values
            // - If all 4 values are the same, output 1 value
            // - If values follow the pattern [a, b, a, b], output 2 values
            // - If values follow the pattern [a, b, c, b], output 3 values
            // - Otherwise, output all 4 values

            if values.count == 4 {
                let topLeft = values[0]
                let topRight = values[1]
                let bottomRight = values[2]
                let bottomLeft = values[3]

                if topLeft == topRight && topRight == bottomRight && bottomRight == bottomLeft {
                    // All values are the same - use 1-value syntax
                    return topLeft.description
                } else if topLeft == bottomRight && topRight == bottomLeft {
                    // Values follow [a, b, a, b] pattern - use 2-value syntax
                    return "\(topLeft.description) \(topRight.description)"
                } else if topRight == bottomLeft {
                    // Values follow [a, b, c, b] pattern - use 3-value syntax
                    return "\(topLeft.description) \(topRight.description) \(bottomRight.description)"
                }
            }

            // Default to all values
            return values.map { $0.description }.joined(separator: " ")
        }
    }
}

/// Convenience initializers for BorderRadius
extension BorderRadius {
    /// Creates a border-radius with uniform radius for all corners
    ///
    /// - Parameter radius: The radius for all corners
    public init(radius: LengthPercentage) {
        self = .values(Values(radius))
    }

    /// Creates a border-radius with specified horizontal radii and optional vertical radii
    ///
    /// - Parameters:
    ///   - horizontal: The horizontal radii for the corners
    ///   - vertical: The vertical radii for the corners (optional)
    public init(_ horizontal: [LengthPercentage], _ vertical: [LengthPercentage]? = nil) {
        if let vertical = vertical, !vertical.isEmpty {
            self = .values(Values(horizontal: horizontal, vertical: vertical))
        } else {
            switch horizontal.count {
            case 0:
                self = .values(Values(.px(0)))
            case 1:
                self = .values(Values(horizontal[0]))
            case 2:
                self = .values(Values(horizontal[0], horizontal[1]))
            case 3:
                self = .values(Values(horizontal[0], horizontal[1], horizontal[2]))
            case 4:
                self = .values(Values(horizontal[0], horizontal[1], horizontal[2], horizontal[3]))
            default:
                // Truncate to 4 values if there are more
                self = .values(Values(horizontal[0], horizontal[1], horizontal[2], horizontal[3]))
            }
        }
    }

}

/// Support for LengthPercentageConvertible
extension BorderRadius: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> BorderRadius {
        .values(.init(value))
    }
}

/// Provides string conversion for CSS output
extension BorderRadius: CustomStringConvertible {
    /// Converts the border-radius to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-radius: 10px;
    /// border-radius: 10px 20px;
    /// border-radius: 10px 20px 30px;
    /// border-radius: 10px 20px 30px 40px;
    /// border-radius: 10px 20px 30px 40px / 15px 25px 35px 45px;
    /// border-radius: inherit;
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

/// Convenience methods for creating BorderRadius values
extension BorderRadius {

    /// Creates a border-radius with elliptical corners using the same values for all corners
    ///
    /// - Parameters:
    ///   - horizontal: The horizontal radius
    ///   - vertical: The vertical radius
    /// - Returns: A border-radius with the specified elliptical corners
    public static func elliptical(_ horizontal: LengthPercentage, _ vertical: LengthPercentage) -> BorderRadius {
        .values(Values(horizontal: horizontal, vertical: vertical))
    }

    /// Helper methods for creating Values with specific patterns
    public static func uniform(_ radius: LengthPercentage) -> BorderRadius {
        .values(Values(radius))
    }
}
