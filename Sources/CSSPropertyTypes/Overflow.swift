import Foundation
import CSSTypeTypes

/// The `overflow` CSS property sets what to do when content overflows an element's box.
///
/// This property is specified as either a single keyword, which sets both the horizontal and vertical
/// overflow behavior, or as two keywords, where the first defines horizontal overflow and the
/// second defines vertical overflow.
///
/// Example:
/// ```swift
/// .overflow(.visible)            // overflow: visible
/// .overflow(.auto)               // overflow: auto
/// .overflow(.scroll)             // overflow: scroll
/// .overflow(.hidden)             // overflow: hidden
/// .overflow(.clip)               // overflow: clip
/// 
/// // Different horizontal and vertical overflow behaviors
/// .overflow(.visible, .hidden)   // overflow: visible hidden
/// .overflow(.auto, .scroll)      // overflow: auto scroll
/// ```
///
/// - Note: Overflow settings apply to all scrollable ancestors of an element. If any ancestor has `overflow: hidden`,
///         scrolling won't work for elements inside it regardless of their overflow settings.
///
/// - SeeAlso: [MDN Web Docs on overflow](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow)
public enum Overflow: Property {
    public static let property: String = "overflow"
    
    /// Single overflow value for both horizontal and vertical
    case single(Value)
    
    /// Different values for horizontal and vertical overflow
    case horizontal_vertical(Value, Value)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Overflow value options
    public enum Value: String, Sendable, Equatable {
        /// Content is not clipped and may overflow the padding box
        case visible
        
        /// Content is clipped if necessary to fit the padding box
        case hidden
        
        /// Similar to auto, but more optimized for block placement
        case clip
        
        /// Content is clipped if necessary, with scrollbars always visible
        case scroll
        
        /// Content is clipped if necessary, with scrollbars appearing only when needed
        case auto
    }
    
    /// Creates an overflow with the same value for horizontal and vertical
    /// 
    /// - Parameter value: The overflow value for both directions
    public init(_ value: Value) {
        self = .single(value)
    }
    
    /// Creates an overflow with different values for horizontal and vertical
    ///
    /// - Parameters:
    ///   - x: The horizontal overflow value
    ///   - y: The vertical overflow value
    public init(_ x: Value, _ y: Value) {
        self = .horizontal_vertical(x, y)
    }
    
    /// Content is not clipped and may overflow the padding box (both directions)
    public static let visible = Overflow(.visible)
    
    /// Content is clipped if necessary to fit the padding box (both directions)
    public static let hidden = Overflow(.hidden)
    
    /// Content is clipped if necessary, with scrollbars always visible (both directions)
    public static let scroll = Overflow(.scroll)
    
    /// Content is clipped if necessary, with scrollbars appearing only when needed (both directions)
    public static let auto = Overflow(.auto)
    
    /// Similar to auto, but more optimized for block placement (both directions)
    public static let clip = Overflow(.clip)
    
    /// CSS string representation
    public var description: String {
        switch self {
        case .single(let value):
            return value.rawValue
        case .horizontal_vertical(let x, let y):
            return "\(x.rawValue) \(y.rawValue)"
        case .global(let global):
            return global.description
        }
    }
}
