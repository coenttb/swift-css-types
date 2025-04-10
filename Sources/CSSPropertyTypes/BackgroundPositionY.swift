import Foundation
import CSSTypeTypes

/// Represents the CSS `background-position-y` property, which sets the initial vertical position for background images.
///
/// This property sets the vertical position for each background image, relative to the position layer
/// specified by `background-origin`. It can be used to control the y-position independently from the x-position.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■                         │  │                           │
/// │                           │  │             ■             │
/// │                           │  │                           │
/// │      top (0%)             │  │      center (50%)         │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      bottom (100%)        │  │      bottom 20px          │
/// │ ■                         │  │               ■           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Position at the top edge (default)
/// .backgroundPositionY(.top)
///
/// // Position at the vertical center
/// .backgroundPositionY(.center)
///
/// // Position at the bottom edge
/// .backgroundPositionY(.bottom)
///
/// // Position at a specific percentage
/// .backgroundPositionY(.percentage(25))
///
/// // Position at a specific pixel value
/// .backgroundPositionY(.px(20))
///
/// // Position with an edge offset
/// .backgroundPositionY(.offset(.bottom, .px(30)))
///
/// // Multiple positions for multiple backgrounds
/// .backgroundPositionY([.top, .bottom])
/// ```
///
/// - Note: This property is overridden by any subsequent `background` or `background-position` declarations.
///
/// - SeeAlso: [MDN Web Docs on background-position-y](https://developer.mozilla.org/en-US/docs/Web/CSS/background-position-y)
public enum BackgroundPositionY: Property {
    public static let property: String = "background-position-y"
    
    /// A vertical position with a keyword value
    case keyword(Keyword)
    
    /// A vertical position with a length or percentage
    case lengthPercentage(LengthPercentage)
    
    /// A vertical position with an edge offset
    case offset(Keyword, LengthPercentage)
    
    /// Multiple vertical positions for multiple backgrounds
    case multiple([BackgroundPositionY])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Position keywords for vertical alignment
    public enum Keyword: String, Sendable, Equatable {
        /// Top edge
        case top
        
        /// Vertical center
        case center
        
        /// Bottom edge
        case bottom
    }
}

/// Provides string conversion for CSS output
extension BackgroundPositionY: CustomStringConvertible {
    /// Converts the background-position-y value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-position-y: top;
    /// background-position-y: center;
    /// background-position-y: 25%;
    /// background-position-y: bottom 20px;
    /// background-position-y: top, bottom;
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
extension BackgroundPositionY {
    /// The default value for background-position-y (`0%`)
    public static let `default` = BackgroundPositionY.lengthPercentage(.percentage(0))
    
    /// Top position (0%)
    public static let top = BackgroundPositionY.keyword(.top)
    
    /// Center position (50%)
    public static let center = BackgroundPositionY.keyword(.center)
    
    /// Bottom position (100%)
    public static let bottom = BackgroundPositionY.keyword(.bottom)
    
    /// Creates a position at a specific percentage
    ///
    /// - Parameter value: The percentage value (0-100)
    /// - Returns: A vertical position at the specified percentage
    public static func percentage(_ value: Percentage) -> BackgroundPositionY {
        .lengthPercentage(.percentage(value))
    }
    
    /// Creates a position at a specific pixel value
    ///
    /// - Parameter value: The pixel value
    /// - Returns: A vertical position at the specified pixel value
    public static func px(_ value: Double) -> BackgroundPositionY {
        .lengthPercentage(.px(value))
    }
    
//    /// Creates a position with an edge offset
//    ///
//    /// - Parameters:
//    ///   - edge: The edge to offset from (top, bottom)
//    ///   - offset: The offset value
//    /// - Returns: A vertical position with the specified edge offset
//    public static func offset(_ edge: Keyword, _ offset: LengthPercentage) -> BackgroundPositionY {
//        .offset(edge, offset)
//    }
    
    /// Creates a position with multiple values
    ///
    /// - Parameter positions: The vertical position values
    /// - Returns: A vertical position with multiple values
    public static func values(_ positions: [BackgroundPositionY]) -> BackgroundPositionY {
        if positions.count == 1, case let position = positions[0] {
            return position
        }
        return .multiple(positions)
    }
    
    /// Creates a position with multiple values
    ///
    /// - Parameter positions: The vertical position values
    /// - Returns: A vertical position with multiple values
    public static func values(_ positions: BackgroundPositionY...) -> BackgroundPositionY {
        values(positions)
    }
}
