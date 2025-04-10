import Foundation
import CSSTypeTypes

/// The CSS `flex-grow` property defines how much a flex item will grow relative to the rest of the flex items in the container.
///
/// The flex-grow factor determines how much of the available space a flex item will take up.
///
/// Example:
/// ```swift
/// .flexGrow(1)                  // flex-grow: 1
/// .flexGrow(2.5)                // flex-grow: 2.5
/// .flexGrow(.global(.inherit))  // flex-grow: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on flex-grow](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-grow)
public enum FlexGrow: Property, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public static let property: String = "flex-grow"
    
    /// A number specifying how much the flex item will grow
    case number(Number)
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    // MARK: - Initializers for literal expressions
    
    /// Create a flex-grow value from an integer literal
    public init(integerLiteral value: Int) {
        self = .number(.init(value))
    }
    
    /// Create a flex-grow value from a floating point literal
    public init(floatLiteral value: Double) {
        self = .number(.init(value))
    }
    
    public var description: String {
        switch self {
        case .number(let number):
            return number.description
        case .global(let value):
            return value.description
        }
    }
}
