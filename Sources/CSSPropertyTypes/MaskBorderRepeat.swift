import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-border-repeat` property, which defines how the mask border image is repeated
/// or stretched to fill the border area.
///
/// This property specifies how the edge regions of a mask border image are repeated, scaled, or spaced
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
/// // Stretch the mask border image
/// .maskBorderRepeat(.stretch)
///
/// // Tile the mask border image
/// .maskBorderRepeat(.repeat)
///
/// // Tile and scale the mask border image to fit exactly
/// .maskBorderRepeat(.round)
///
/// // Tile with space between each tile
/// .maskBorderRepeat(.space)
///
/// // Different values for horizontal and vertical
/// .maskBorderRepeat(.round, .stretch)
/// ```
///
/// - Note: When the middle region of the mask border image is displayed (using `fill` in
///         the mask-border-slice property), this property also determines how that
///         region is handled.
///
/// - SeeAlso: [MDN Web Docs on mask-border-repeat](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-repeat)
public enum MaskBorderRepeat: Property {
    public static let property: String = "mask-border-repeat"

    /// Same repeat style for all sides
    case all(RepeatStyle)

    /// Different repeat styles for horizontal (top & bottom) and vertical (left & right) sides
    case horizontal_vertical(RepeatStyle, RepeatStyle)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Repeat style options for mask borders
    public enum RepeatStyle: String, Sendable, Hashable {
        /// Stretch the mask border image to fill the area
        case stretch

        /// Tile the mask border image (may be clipped if not exact fit)
        case `repeat`

        /// Tile the mask border image and scale it to fit exactly
        case round

        /// Tile the mask border image with space between tiles
        case space
    }

    /// Creates a mask-border-repeat with the same style for all sides
    ///
    /// - Parameter style: The repeat style for all sides
    public init(_ style: RepeatStyle) {
        self = .all(style)
    }

    /// Creates a mask-border-repeat with different styles for horizontal and vertical sides
    ///
    /// - Parameters:
    ///   - horizontal: The repeat style for horizontal sides (top & bottom)
    ///   - vertical: The repeat style for vertical sides (left & right)
    public init(_ horizontal: RepeatStyle, _ vertical: RepeatStyle) {
        self = .horizontal_vertical(horizontal, vertical)
    }

    /// Default repeat style (stretch)
    public static let `default` = MaskBorderRepeat(.stretch)

    /// Stretch the mask border image to fill the area
    public static let stretch = MaskBorderRepeat(.stretch)

    /// Tile the mask border image (may be clipped if not exact fit)
    public static let `repeat` = MaskBorderRepeat(.repeat)

    /// Tile the mask border image and scale it to fit exactly
    public static let round = MaskBorderRepeat(.round)

    /// Tile the mask border image with space between tiles
    public static let space = MaskBorderRepeat(.space)
}

/// Provides string conversion for CSS output
extension MaskBorderRepeat: CustomStringConvertible {
    /// Converts the mask-border-repeat to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-border-repeat: stretch;
    /// mask-border-repeat: repeat;
    /// mask-border-repeat: round;
    /// mask-border-repeat: space;
    /// mask-border-repeat: round stretch;
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
