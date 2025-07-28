import CSSTypeTypes
import Foundation

/// Represents the CSS `background-position` property, which sets the initial position of a background image.
///
/// This property sets the initial position for each background image relative to the positioning layer
/// specified by `background-origin`. Multiple position values can be provided for multiple background images.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■                         │  │             ■             │
/// │                           │  │                           │
/// │       left top            │  │       center              │
/// │       (0% 0%)             │  │       (50% 50%)           │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                         ■ │  │                           │
/// │                           │  │                           │
/// │       right top           │  │       bottom 10px         │
/// │       (100% 0%)           │  │       right 20px          │
/// │                           │  │           ■               │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Position in the center (default)
/// .backgroundPosition(.center)
///
/// // Position at the top
/// .backgroundPosition(.top)
///
/// // Position at the top right corner
/// .backgroundPosition(.topRight)
///
/// // Position at specific percentages
/// .backgroundPosition(.percentage(25, 75))
///
/// // Position at specific pixel values
/// .backgroundPosition(.px(10, 20))
///
/// // Position with edge offsets
/// .backgroundPosition(.offsets(.bottom, .px(10), .right, .px(20)))
///
/// // Multiple positions for multiple backgrounds
/// .backgroundPosition([.topLeft, .bottomRight])
/// ```
///
/// - Note: If one background image is specified but multiple positions, only the first position is used.
///         If multiple images are specified but fewer positions, the positions will be repeated as needed.
///
/// - SeeAlso: [MDN Web Docs on background-position](https://developer.mozilla.org/en-US/docs/Web/CSS/background-position)
public enum BackgroundPosition: Property {
    public static let property: String = "background-position"

    /// A single position value
    case single(CSSTypeTypes.Position)

    /// Multiple position values for multiple backgrounds
    case multiple([CSSTypeTypes.Position])

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a background position with a single position
    ///
    /// - Parameter position: The position value
    public init(_ position: CSSTypeTypes.Position) {
        self = .single(position)
    }

    /// Creates a background position with multiple positions
    ///
    /// - Parameter positions: The position values
    public init(_ positions: [CSSTypeTypes.Position]) {
        if positions.count == 1 {
            self = .single(positions[0])
        } else {
            self = .multiple(positions)
        }
    }
}

/// Provides string conversion for CSS output
extension BackgroundPosition: CustomStringConvertible {
    /// Converts the background-position value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-position: center;
    /// background-position: top right;
    /// background-position: 25% 75%;
    /// background-position: bottom 10px right 20px;
    /// background-position: center, top left;
    /// ```
    public var description: String {
        switch self {
        case .single(let position):
            return position.description
        case .multiple(let positions):
            return positions.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension BackgroundPosition {
    /// The default value for background-position (`0% 0%`)
    public static let `default` = BackgroundPosition(.values(.percentage(0), .percentage(0)))

    /// Position in the center
    public static let center = BackgroundPosition(.center)

    /// Position at the top
    public static let top = BackgroundPosition(.top)

    /// Position at the right
    public static let right = BackgroundPosition(.right)

    /// Position at the bottom
    public static let bottom = BackgroundPosition(.bottom)

    /// Position at the left
    public static let left = BackgroundPosition(.left)

    /// Position at the top left (default)
    public static let topLeft = BackgroundPosition(.topLeft)

    /// Position at the top right
    public static let topRight = BackgroundPosition(.topRight)

    /// Position at the bottom left
    public static let bottomLeft = BackgroundPosition(.bottomLeft)

    /// Position at the bottom right
    public static let bottomRight = BackgroundPosition(.bottomRight)

    /// Creates a background position with percentage values
    ///
    /// - Parameters:
    ///   - x: Horizontal position percentage (0-100)
    ///   - y: Vertical position percentage (0-100)
    /// - Returns: A background position with percentage values
    public static func percentage(_ x: Percentage, _ y: Percentage) -> BackgroundPosition {
        BackgroundPosition.single(.values(.percentage(x), .percentage(y)))
    }
//    
//    /// Creates a background position with pixel values
//    ///
//    /// - Parameters:
//    ///   - x: Horizontal position in pixels
//    ///   - y: Vertical position in pixels
//    /// - Returns: A background position with pixel values
//    public static func px(_ x: Double, _ y: Double) -> BackgroundPosition {
//        BackgroundPosition(.px(x, y))
//    }

    /// Creates a background position with edge offsets
    ///
    /// - Parameters:
    ///   - edge1: First edge (top, right, bottom, left)
    ///   - offset1: Offset from the first edge
    ///   - edge2: Second edge (top, right, bottom, left)
    ///   - offset2: Offset from the second edge
    /// - Returns: A background position with edge offsets
    public static func offsets(_ edge1: CSSTypeTypes.Position.Keyword, _ offset1: LengthPercentage, _ edge2: CSSTypeTypes.Position.Keyword, _ offset2: LengthPercentage) -> BackgroundPosition {
        BackgroundPosition(.offsets(edge1, offset1, edge2, offset2))
    }

    /// Creates a background position with multiple values
    ///
    /// - Parameter positions: The position values
    /// - Returns: A background position with multiple values
    public static func values(_ positions: [CSSTypeTypes.Position]) -> BackgroundPosition {
        BackgroundPosition(positions)
    }

    /// Creates a background position with multiple values
    ///
    /// - Parameter positions: The position values
    /// - Returns: A background position with multiple values
    public static func values(_ positions: CSSTypeTypes.Position...) -> BackgroundPosition {
        values(positions)
    }
}
