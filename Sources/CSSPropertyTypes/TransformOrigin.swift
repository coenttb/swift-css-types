import Foundation
import CSSTypeTypes

/// The CSS `transform-origin` property sets the origin for an element's transformations.
///
/// The transform origin is the point around which a transformation is applied. For example, 
/// the transform origin of the rotate() function is the center of rotation.
///
/// Example:
/// ```swift
/// .transformOrigin(.center)                    // transform-origin: center
/// .transformOrigin(.topLeft)                   // transform-origin: top left
/// .transformOrigin(.px(50), .px(50))           // transform-origin: 50px 50px
/// .transformOrigin(.bottom, .right, .px(60))   // transform-origin: bottom right 60px
/// ```
///
/// - Note: By default, the origin of a transform is center (50% 50%).
/// - Note: For SVG elements, the default is typically 0 0 (except for root SVG elements).
///
/// - SeeAlso: [MDN Web Docs on transform-origin](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-origin)
public enum TransformOrigin: Property {
    public static let property: String = "transform-origin"
    
    /// A horizontal position keyword
    public enum HorizontalKeyword: Sendable, Hashable, CustomStringConvertible {
        /// The left edge (0%)
        case left
        
        /// The horizontal center (50%)
        case center
        
        /// The right edge (100%)
        case right
        
        public var description: String {
            switch self {
            case .left: return "left"
            case .center: return "center"
            case .right: return "right"
            }
        }
    }
    
    /// A vertical position keyword
    public enum VerticalKeyword: Sendable, Hashable, CustomStringConvertible {
        /// The top edge (0%)
        case top
        
        /// The vertical center (50%)
        case center
        
        /// The bottom edge (100%)
        case bottom
        
        public var description: String {
            switch self {
            case .top: return "top"
            case .center: return "center"
            case .bottom: return "bottom"
            }
        }
    }
    
    /// Single value (horizontal position with vertical center) - can be a keyword or length
    case singleValue(Value)
    
    /// Two values (horizontal and vertical positions)
    case twoValues(Value, Value)
    
    /// Three values (horizontal, vertical, and z-depth)
    case threeValues(Value, Value, Length)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// A single position value (keyword or length)
    public enum Value: Sendable, Hashable {
        /// A horizontal keyword (left, center, right)
        case horizontalKeyword(HorizontalKeyword)
        
        /// A vertical keyword (top, center, bottom)
        case verticalKeyword(VerticalKeyword)
        
        /// A length value (px, em, etc)
        case length(Length)
        
        /// A percentage value
        case percentage(Percentage)
    }
}

/// Factory methods
extension TransformOrigin {
    /// Creates a transform origin with a single value
    ///
    /// - Parameter value: The position value (either horizontal or vertical)
    /// - Returns: A transform origin with a single value
    public static func value(_ value: Value) -> TransformOrigin {
        .singleValue(value)
    }
    
    /// Creates a transform origin with two values
    ///
    /// - Parameters:
    ///   - x: The horizontal position
    ///   - y: The vertical position
    /// - Returns: A transform origin with two values
    public static func values(_ x: Value, _ y: Value) -> TransformOrigin {
        .twoValues(x, y)
    }
    
    /// Creates a transform origin with three values (for 3D transforms)
    ///
    /// - Parameters:
    ///   - x: The horizontal position
    ///   - y: The vertical position
    ///   - z: The z-axis depth
    /// - Returns: A transform origin with three values including z-depth
    public static func values3D(_ x: Value, _ y: Value, _ z: Length) -> TransformOrigin {
        .threeValues(x, y, z)
    }
    
    /// A convenient shorthand for horizontal keywords
    ///
    /// - Parameter keyword: A horizontal keyword (left, center, right)
    /// - Returns: A transform origin value
    public static func horizontal(_ keyword: HorizontalKeyword) -> Value {
        .horizontalKeyword(keyword)
    }
    
    /// A convenient shorthand for vertical keywords
    ///
    /// - Parameter keyword: A vertical keyword (top, center, bottom)
    /// - Returns: A transform origin value
    public static func vertical(_ keyword: VerticalKeyword) -> Value {
        .verticalKeyword(keyword)
    }
    
    /// A convenient shorthand for pixel values
    ///
    /// - Parameter pixels: The number of pixels
    /// - Returns: A transform origin value
    public static func px(_ pixels: Double) -> Value {
        .length(.px(pixels))
    }
    
    /// A convenient shorthand for percentage values
    ///
    /// - Parameter percent: The percentage value
    /// - Returns: A transform origin value
    public static func percentage(_ percentage: Percentage) -> Value {
        .percentage(percentage)
    }
    
    /// A convenient shorthand for em values
    ///
    /// - Parameter ems: The number of ems
    /// - Returns: A transform origin value
    public static func em(_ ems: Double) -> Value {
        .length(.em(ems))
    }
    
    /// A convenient shorthand for rem values
    ///
    /// - Parameter rems: The number of rems
    /// - Returns: A transform origin value
    public static func rem(_ rems: Double) -> Value {
        .length(.rem(rems))
    }
}

/// Common transform origin positions
extension TransformOrigin {
    /// Center position (default) - equivalent to 50% 50%
    public static let center: TransformOrigin = .singleValue(.horizontalKeyword(.center))
    
    /// Top-left corner (0% 0%)
    public static let topLeft: TransformOrigin = .twoValues(.horizontalKeyword(.left), .verticalKeyword(.top))
    
    /// Top-center position (50% 0%)
    public static let topCenter: TransformOrigin = .twoValues(.horizontalKeyword(.center), .verticalKeyword(.top))
    
    /// Top-right corner (100% 0%)
    public static let topRight: TransformOrigin = .twoValues(.horizontalKeyword(.right), .verticalKeyword(.top))
    
    /// Middle-left position (0% 50%)
    public static let middleLeft: TransformOrigin = .twoValues(.horizontalKeyword(.left), .verticalKeyword(.center))
    
    /// Middle-right position (100% 50%)
    public static let middleRight: TransformOrigin = .twoValues(.horizontalKeyword(.right), .verticalKeyword(.center))
    
    /// Bottom-left corner (0% 100%)
    public static let bottomLeft: TransformOrigin = .twoValues(.horizontalKeyword(.left), .verticalKeyword(.bottom))
    
    /// Bottom-center position (50% 100%)
    public static let bottomCenter: TransformOrigin = .twoValues(.horizontalKeyword(.center), .verticalKeyword(.bottom))
    
    /// Bottom-right corner (100% 100%)
    public static let bottomRight: TransformOrigin = .twoValues(.horizontalKeyword(.right), .verticalKeyword(.bottom))
}

/// CSS Output conversion for Value
extension TransformOrigin.Value: CustomStringConvertible {
    /// Converts the transform-origin value to its CSS string representation
    public var description: String {
        switch self {
        case .horizontalKeyword(let keyword):
            return keyword.description
        case .verticalKeyword(let keyword):
            return keyword.description
        case .length(let length):
            return length.description
        case .percentage(let percentage):
            return percentage.description
        }
    }
}

/// CSS Output conversion
extension TransformOrigin: CustomStringConvertible {
    /// Converts the transform-origin value to its CSS string representation
    public var description: String {
        switch self {
        case .singleValue(let value):
            return value.description
        case .twoValues(let x, let y):
            return "\(x) \(y)"
        case .threeValues(let x, let y, let z):
            return "\(x) \(y) \(z)"
        case .global(let global):
            return global.description
        }
    }
}
