import CSSTypeTypes
import Foundation

/// Represents the CSS `border-spacing` property, which sets the distance between borders of adjacent table cells.
///
/// This property applies only to tables with `border-collapse: separate` and defines the spacing 
/// between cell borders. It can set different values for horizontal and vertical spacing.
///
/// Visual Reference:
/// ```
/// border-spacing: 0                border-spacing: 10px
/// ┌───┬───┬───┐                    ┌─────┐ ┌─────┐ ┌─────┐
/// │ 1 │ 2 │ 3 │                    │  1  │ │  2  │ │  3  │
/// ├───┼───┼───┤                    └─────┘ └─────┘ └─────┘
/// │ 4 │ 5 │ 6 │                     
/// ├───┼───┼───┤                    ┌─────┐ ┌─────┐ ┌─────┐
/// │ 7 │ 8 │ 9 │                    │  4  │ │  5  │ │  6  │
/// └───┴───┴───┘                    └─────┘ └─────┘ └─────┘
///                                   
///  No spacing                      ┌─────┐ ┌─────┐ ┌─────┐
///                                  │  7  │ │  8  │ │  9  │
///                                  └─────┘ └─────┘ └─────┘
///                                   
///                                   Cells with spacing
/// ```
///
/// Example:
/// ```swift
/// // Set equal spacing for horizontal and vertical borders
/// .borderSpacing(.px(5))
///
/// // Set different spacing for horizontal and vertical borders
/// .borderSpacing(.px(10), .px(5))
///
/// // Set spacing with different units
/// .borderSpacing(.em(1), .rem(0.5))
/// ```
///
/// - Note: This property also affects the spacing between the table border and the cells 
///         in the first/last row or column.
///
/// - SeeAlso: [MDN Web Docs on border-spacing](https://developer.mozilla.org/en-US/docs/Web/CSS/border-spacing)
public enum BorderSpacing: Property {

    public static let property: String = "border-spacing"

    /// Same spacing for both horizontal and vertical
    case all(Length)

    /// Different spacing for horizontal and vertical
    case horizontal_vertical(Length, Length)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a border-spacing with the same value for horizontal and vertical spacing
    ///
    /// - Parameter length: The spacing value
    public init(_ length: Length) {
        self = .all(length)
    }

    /// Creates a border-spacing with different values for horizontal and vertical spacing
    ///
    /// - Parameters:
    ///   - horizontal: The horizontal spacing value
    ///   - vertical: The vertical spacing value
    public init(_ horizontal: Length, _ vertical: Length) {
        self = .horizontal_vertical(horizontal, vertical)
    }
}
extension BorderSpacing: LengthConvertible {
    public static func length(_ length: CSSTypeTypes.Length) -> BorderSpacing {
        .all(.length(length))
    }
}

/// Provides string conversion for CSS output
extension BorderSpacing {
    /// Converts the border-spacing to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-spacing: 5px;
    /// border-spacing: 10px 5px;
    /// border-spacing: 1em 0.5rem;
    /// ```
    public var description: String {
        switch self {
        case .all(let length):
            return length.description
        case .horizontal_vertical(let horizontal, let vertical):
            return "\(horizontal.description) \(vertical.description)"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience methods for creating BorderSpacing values
extension BorderSpacing {
    /// The default border-spacing value (0)
    public static let `default` = BorderSpacing(.px(0))

}
