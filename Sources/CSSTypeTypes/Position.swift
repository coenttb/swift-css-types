import Foundation

/// Represents a CSS position value for two-dimensional placement.
///
/// The `Position` type denotes a two-dimensional coordinate used to set a location
/// relative to an element box. It is used in properties like `background-position`,
/// `object-position`, `transform-origin`, etc.
///
/// Example:
/// ```swift
/// .backgroundPosition(.center)                          // center
/// .backgroundPosition(.top, .right)                     // top right
/// .backgroundPosition(.center, .px(20))                 // center 20px
/// .backgroundPosition(.top, .percentage(25), .left, .px(5)) // top 25% left 5px
/// ```
///
/// - Note: The final position does not need to be inside the element's box.
///
/// - SeeAlso: [MDN Web Docs on position](https://developer.mozilla.org/en-US/docs/Web/CSS/position_value)
public enum Position: Sendable, Hashable {
    /// A single keyword (center, top, right, bottom, left)
    case keyword(Keyword)
    
    /// A single value (horizontal position, vertical defaults to center)
    case value(LengthPercentage)
    
    /// Two keywords (one for each axis)
    case keywords(Keyword, Keyword)
    
    /// A keyword and a value
    case keywordValue(Keyword, LengthPercentage)
    
    /// A value and a keyword
    case valueKeyword(LengthPercentage, Keyword)
    
    /// Two values (horizontal, vertical)
    case values(LengthPercentage, LengthPercentage)
    
    /// Four values (keyword, offset, keyword, offset)
    /// This creates positions like "top 10px right 20px"
    case offsets(Keyword, LengthPercentage, Keyword, LengthPercentage)
    
    /// Position keywords for horizontal and vertical alignment
    public enum Keyword: String, Sendable, Hashable {
        /// Center alignment
        case center
        
        /// Top edge
        case top
        
        /// Right edge
        case right
        
        /// Bottom edge
        case bottom
        
        /// Left edge
        case left
    }
    
    /// Creates a centered position
    public static let center: Position = .keyword(.center)
    
    /// Creates a top-aligned position
    public static let top: Position = .keyword(.top)
    
    /// Creates a right-aligned position
    public static let right: Position = .keyword(.right)
    
    /// Creates a bottom-aligned position
    public static let bottom: Position = .keyword(.bottom)
    
    /// Creates a left-aligned position
    public static let left: Position = .keyword(.left)
    
    /// Creates a top-left position
    public static let topLeft: Position = .keywords(.top, .left)
    
    /// Creates a top-right position
    public static let topRight: Position = .keywords(.top, .right)
    
    /// Creates a bottom-left position
    public static let bottomLeft: Position = .keywords(.bottom, .left)
    
    /// Creates a bottom-right position
    public static let bottomRight: Position = .keywords(.bottom, .right)
    
    /// Creates a position with percentage values
    ///
    /// - Parameters:
    ///   - x: Horizontal position percentage (0-100)
    ///   - y: Vertical position percentage (0-100)
    /// - Returns: A Position with percentage values
    public static func percentage(_ x: Percentage, _ y: Percentage) -> Position {
        return .values(.percentage(x), .percentage(y))
    }
    
    /// Creates a position with pixel values
    ///
    /// - Parameters:
    ///   - x: Horizontal position in pixels
    ///   - y: Vertical position in pixels
    /// - Returns: A Position with pixel values
    public static func px(_ x: Double, _ y: Double) -> Position {
        return .values(.px(x), .px(y))
    }
}

/// Provides string conversion for CSS output
extension Position: CustomStringConvertible {
    /// Converts the position to its CSS string representation
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
            
        case .value(let value):
            return value.description
            
        case .keywords(let keyword1, let keyword2):
            return "\(keyword1.rawValue) \(keyword2.rawValue)"
            
        case .keywordValue(let keyword, let value):
            return "\(keyword.rawValue) \(value)"
            
        case .valueKeyword(let value, let keyword):
            return "\(value) \(keyword.rawValue)"
            
        case .values(let value1, let value2):
            return "\(value1) \(value2)"
            
        case .offsets(let keyword1, let offset1, let keyword2, let offset2):
            return "\(keyword1.rawValue) \(offset1) \(keyword2.rawValue) \(offset2)"
        }
    }
}
