import Foundation
import CSSTypeTypes

/// Represents the CSS `background-repeat` property, which sets how background images are repeated.
///
/// This property controls whether and how background images repeat along the horizontal and vertical axes.
/// Images can be set to repeat fully, not repeat at all, or use special repeat modes like space or round.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■   ■   ■   ■   ■   ■   ■ │  │ ■                         │
/// │                           │  │                           │
/// │                           │  │                           │
/// │      repeat-x             │  │      no-repeat            │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │ ■   ■   ■   ■   ■   ■   ■ │  │ ■       ■       ■       ■ │
/// │ ■   ■   ■   ■   ■   ■   ■ │  │                           │
/// │ ■   ■   ■   ■   ■   ■   ■ │  │                           │
/// │      repeat               │  │      space                │
/// │ ■   ■   ■   ■   ■   ■   ■ │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Repeat in both directions (default)
/// .backgroundRepeat(.repeat)
///
/// // Don't repeat the background image
/// .backgroundRepeat(.noRepeat)
///
/// // Repeat only horizontally
/// .backgroundRepeat(.repeatX)
///
/// // Repeat only vertically
/// .backgroundRepeat(.repeatY)
///
/// // Space images evenly without clipping
/// .backgroundRepeat(.space)
///
/// // Stretch and repeat to fill the area
/// .backgroundRepeat(.round)
///
/// // Different repeat behaviors for X and Y
/// .backgroundRepeat(.repeatX, .space)
///
/// // Multiple repeat values for multiple backgrounds
/// .backgroundRepeat([.repeat, .noRepeat])
/// ```
///
/// - Note: The default is to repeat in both directions. When two values are specified,
///         the first applies to the horizontal direction and the second to the vertical.
///
/// - SeeAlso: [MDN Web Docs on background-repeat](https://developer.mozilla.org/en-US/docs/Web/CSS/background-repeat)
public enum BackgroundRepeat: Property {
    public static let property: String = "background-repeat"
    
    /// A single repetition style (shorthand for both directions)
    case single(RepeatStyle)
    
    /// Different repetition styles for horizontal and vertical directions
    case twoValue(RepeatStyle, RepeatStyle)
    
    /// Multiple repetition values for multiple backgrounds
    case multiple([BackgroundRepeat])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Repetition style values
    public enum RepeatStyle: String, Sendable, Hashable {
        /// Repeat the image in both directions (default)
        case `repeat` = "repeat"
        
        /// Don't repeat the image
        case noRepeat = "no-repeat"
        
        /// Repeat only horizontally (shorthand for repeat no-repeat)
        case repeatX = "repeat-x"
        
        /// Repeat only vertically (shorthand for no-repeat repeat)
        case repeatY = "repeat-y"
        
        /// Space images evenly without clipping
        case space = "space"
        
        /// Stretch and repeat to fill the area
        case round = "round"
    }
    
    /// Creates a background repeat with a single style for both directions
    ///
    /// - Parameter style: The repeat style
    public init(_ style: RepeatStyle) {
        self = .single(style)
    }
    
    /// Creates a background repeat with different styles for horizontal and vertical
    ///
    /// - Parameters:
    ///   - horizontal: The horizontal repeat style
    ///   - vertical: The vertical repeat style
    public init(_ horizontal: RepeatStyle, _ vertical: RepeatStyle) {
        self = .twoValue(horizontal, vertical)
    }
    
    /// Creates a background repeat with multiple values for multiple backgrounds
    ///
    /// - Parameter repeats: The repeat values for each background
    public init(_ repeats: [BackgroundRepeat]) {
        if repeats.count == 1 {
            self = repeats[0]
        } else {
            self = .multiple(repeats)
        }
    }
}

/// Provides string conversion for CSS output
extension BackgroundRepeat: CustomStringConvertible {
    /// Converts the background-repeat value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-repeat: repeat;
    /// background-repeat: no-repeat;
    /// background-repeat: repeat-x;
    /// background-repeat: repeat-y;
    /// background-repeat: space;
    /// background-repeat: round;
    /// background-repeat: repeat space;
    /// background-repeat: repeat, no-repeat;
    /// ```
    public var description: String {
        switch self {
        case .single(let style):
            return style.rawValue
            
        case .twoValue(let horizontal, let vertical):
            // Special cases for the shorthand values
            if horizontal == .repeat && vertical == .noRepeat {
                return RepeatStyle.repeatX.rawValue
            } else if horizontal == .noRepeat && vertical == .repeat {
                return RepeatStyle.repeatY.rawValue
            } else {
                return "\(horizontal.rawValue) \(vertical.rawValue)"
            }
            
        case .multiple(let repeats):
            return repeats.map { $0.description }.joined(separator: ", ")
            
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension BackgroundRepeat {
    /// The default value for background-repeat (`repeat`)
    public static let `default` = BackgroundRepeat(.repeat)
    
    /// Repeat in both directions
    public static let `repeat` = BackgroundRepeat(.repeat)
    
    /// Don't repeat the image
    public static let noRepeat = BackgroundRepeat(.noRepeat)
    
    /// Repeat only horizontally
    public static let repeatX = BackgroundRepeat(.repeatX)
    
    /// Repeat only vertically
    public static let repeatY = BackgroundRepeat(.repeatY)
    
    /// Space images evenly without clipping
    public static let space = BackgroundRepeat(.space)
    
    /// Stretch and repeat to fill the area
    public static let round = BackgroundRepeat(.round)
    
    /// Creates a background repeat with multiple values
    ///
    /// - Parameter repeats: The repeat values for each background
    /// - Returns: A background repeat with multiple values
    public static func values(_ repeats: [BackgroundRepeat]) -> BackgroundRepeat {
        BackgroundRepeat(repeats)
    }
    
    /// Creates a background repeat with multiple values
    ///
    /// - Parameter repeats: The repeat values for each background
    /// - Returns: A background repeat with multiple values
    public static func values(_ repeats: BackgroundRepeat...) -> BackgroundRepeat {
        values(repeats)
    }
}
