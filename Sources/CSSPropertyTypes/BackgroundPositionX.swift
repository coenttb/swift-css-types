import Foundation
import CSSTypeTypes

/// Represents the CSS `background-position-x` property, which sets the initial horizontal position for background images.
///
/// This property sets the horizontal position for each background image, relative to the position layer
/// specified by `background-origin`. It can be used to control the x-position independently from the y-position.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■                         │  │             ■             │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      left (0%)            │  │      center (50%)         │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                         ■ │  │                        ■  │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      right (100%)         │  │      right 20px           │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Position at the left edge (default)
/// .backgroundPositionX(.left)
///
/// // Position at the horizontal center
/// .backgroundPositionX(.center)
///
/// // Position at the right edge
/// .backgroundPositionX(.right)
///
/// // Position at a specific percentage
/// .backgroundPositionX(.percentage(25))
///
/// // Position at a specific pixel value
/// .backgroundPositionX(.px(20))
///
/// // Position with an edge offset
/// .backgroundPositionX(.offset(.right, .px(30)))
///
/// // Multiple positions for multiple backgrounds
/// .backgroundPositionX([.left, .right])
/// ```
///
/// - Note: This property is overridden by any subsequent `background` or `background-position` declarations.
///
/// - SeeAlso: [MDN Web Docs on background-position-x](https://developer.mozilla.org/en-US/docs/Web/CSS/background-position-x)
public enum BackgroundPositionX: Property, LengthPercentageConvertible {
    public static let property: String = "background-position-x"
    
    
    /// A horizontal position with a keyword value
    case keyword(Keyword)
    
    /// A horizontal position with a length or percentage
    case lengthPercentage(LengthPercentage)
    
    /// A horizontal position with an edge offset
    case offset(Keyword, LengthPercentage)
    
    /// Multiple horizontal positions for multiple backgrounds
    case multiple([BackgroundPositionX])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
}

extension BackgroundPositionX {
    /// Position keywords for horizontal alignment
    public enum Keyword: String, Sendable, Hashable {
        /// Left edge
        case left
        
        /// Horizontal center
        case center
        
        /// Right edge
        case right
    }
}

/// Provides string conversion for CSS output
extension BackgroundPositionX: CustomStringConvertible {
    /// Converts the background-position-x value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-position-x: left;
    /// background-position-x: center;
    /// background-position-x: 25%;
    /// background-position-x: right 20px;
    /// background-position-x: left, center;
    /// ```
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .offset(let keyword, let value):
            return "\(keyword.rawValue) \(value)"
        case .multiple(let positions):
            return positions.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension BackgroundPositionX {
    /// The default value for background-position-x (`0%`)
    public static let `default` = BackgroundPositionX.zero
    
    /// Left position (0%)
    public static let left = BackgroundPositionX.keyword(.left)
    
    /// Center position (50%)
    public static let center = BackgroundPositionX.keyword(.center)
    
    /// Right position (100%)
    public static let right = BackgroundPositionX.keyword(.right)
    
    /// Creates a position at a specific percentage
    ///
    /// - Parameter value: The percentage value (0-100)
    /// - Returns: A horizontal position at the specified percentage
    public static func percentage(_ value: Percentage) -> BackgroundPositionX {
        .lengthPercentage(.percentage(value))
    }
    
    /// Creates a position at a specific pixel value
    ///
    /// - Parameter value: The pixel value
    /// - Returns: A horizontal position at the specified pixel value
    public static func px(_ value: Double) -> BackgroundPositionX {
        .lengthPercentage(.px(value))
    }
    
   
    /// Creates a position with multiple values
    ///
    /// - Parameter positions: The horizontal position values
    /// - Returns: A horizontal position with multiple values
    public static func values(_ positions: BackgroundPositionX...) -> BackgroundPositionX {
//        THIS DOESN'T COMPILE: values(positions), BECAUSE: Cannot pass array of type 'BackgroundPositionX...' as variadic arguments of type 'BackgroundPositionX'
        fatalError()
    }
}
