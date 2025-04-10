import Foundation
import CSSTypeTypes

/// Represents the CSS `border-image-repeat` property, which defines how the border image is repeated
/// or stretched to fill the border area.
///
/// This property specifies how the edge regions of a border image are repeated, scaled, or spaced
/// to fit the dimensions of the border. It controls how the image sections are handled when they
/// don't match the exact size needed.
///
/// Visual Reference:
/// ```
/// stretch:                       repeat:
/// ┌─────────────────────┐        ┌─────────────────────┐
/// │                     │        │                     │
/// │                     │        │                     │
/// │                     │        │                     │
/// │                     │        │                     │
/// └─────────────────────┘        └─────────────────────┘
///  Edge images are stretched      Edge images are tiled
///                                 (possibly clipped)
///
/// round:                         space:
/// ┌─────────────────────┐        ┌─────────────────────┐
/// │                     │        │                     │
/// │                     │        │                     │
/// │                     │        │                     │
/// │                     │        │                     │
/// └─────────────────────┘        └─────────────────────┘
///  Edge images are tiled and      Edge images are tiled with
///  scaled to fit exactly          space between each tile
/// ```
///
/// Example:
/// ```swift
/// // Stretch the border image
/// .borderImageRepeat(.stretch)
///
/// // Tile the border image
/// .borderImageRepeat(.repeat)
///
/// // Tile and scale the border image to fit exactly
/// .borderImageRepeat(.round)
///
/// // Tile with space between each tile
/// .borderImageRepeat(.space)
///
/// // Different values for horizontal and vertical
/// .borderImageRepeat(.round, .stretch)
/// ```
///
/// - Note: When the middle region of the border image is displayed (using `fill` in
///         the border-image-slice property), this property also determines how that
///         region is handled.
///
/// - SeeAlso: [MDN Web Docs on border-image-repeat](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image-repeat)
public enum BorderImageRepeat: Property {
    
    public static let property: String = "border-image-repeat"
    
    /// Same repeat style for all sides
    case all(RepeatStyle)
    
    /// Different repeat styles for horizontal (top & bottom) and vertical (left & right) sides
    case horizontal_vertical(RepeatStyle, RepeatStyle)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Repeat style options for border images
    public enum RepeatStyle: String, Sendable, Equatable {
        /// Stretch the border image to fill the area
        case stretch
        
        /// Tile the border image (may be clipped if not exact fit)
        case `repeat`
        
        /// Tile the border image and scale it to fit exactly
        case round
        
        /// Tile the border image with space between tiles
        case space
    }
    
    /// Creates a border-image-repeat with the same style for all sides
    ///
    /// - Parameter style: The repeat style for all sides
    public init(_ style: RepeatStyle) {
        self = .all(style)
    }
    
    /// Creates a border-image-repeat with different styles for horizontal and vertical sides
    ///
    /// - Parameters:
    ///   - horizontal: The repeat style for horizontal sides (top & bottom)
    ///   - vertical: The repeat style for vertical sides (left & right)
    public init(_ horizontal: RepeatStyle, _ vertical: RepeatStyle) {
        self = .horizontal_vertical(horizontal, vertical)
    }
    
    /// Default repeat style (stretch)
    public static let `default` = BorderImageRepeat(.stretch)
    
    /// Stretch the border image to fill the area
    public static let stretch = BorderImageRepeat(.stretch)
    
    /// Tile the border image (may be clipped if not exact fit)
    public static let `repeat` = BorderImageRepeat(.repeat)
    
    /// Tile the border image and scale it to fit exactly
    public static let round = BorderImageRepeat(.round)
    
    /// Tile the border image with space between tiles
    public static let space = BorderImageRepeat(.space)
}

/// Provides string conversion for CSS output
extension BorderImageRepeat: CustomStringConvertible {
    /// Converts the border-image-repeat to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-image-repeat: stretch;
    /// border-image-repeat: repeat;
    /// border-image-repeat: round;
    /// border-image-repeat: space;
    /// border-image-repeat: round stretch;
    /// ```
    public var description: String {
        switch self {
        case .all(let style):
            return style.rawValue
        case .horizontal_vertical(let horizontal, let vertical):
            return "\(horizontal.rawValue) \(vertical.rawValue)"
        case .global(let global):
            return global.description
        }
    }
}
