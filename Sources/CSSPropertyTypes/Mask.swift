import Foundation
import CSSTypeTypes

/// Represents the CSS `mask` shorthand property, which hides an element (partially or fully) by masking
/// or clipping the image at specific points.
///
/// This property allows you to specify which parts of an element should be visible by using an image
/// as a mask. The mask hides portions of the element where the mask is transparent or semi-transparent.
///
/// Example:
/// ```swift
/// // No mask
/// .mask(.none)
///
/// // Use an SVG as a mask
/// .mask(.url("mask.svg#element"))
///
/// // Use a gradient as a mask
/// .mask(.linearGradient("to right, rgba(0,0,0,1), rgba(0,0,0,0)"))
///
/// // Complex mask with position, size, and repeat
/// .mask(.configuration(
///    .url("mask.svg"),
///    position: .center,
///    size: .cover,
///    repeat: .noRepeat,
///    clip: .borderBox,
///    origin: .borderBox,
///    composite: .add,
///    mode: .alpha
/// ))
///
/// // Multiple layer mask
/// .mask(.layers([
///    .configuration(.url("mask1.svg"), position: .top),
///    .configuration(.url("mask2.svg"), position: .bottom)
/// ]))
/// ```
///
/// - Note: The mask property is a shorthand that also resets `mask-border` to its initial value.
///         Therefore, it's recommended to use the mask shorthand rather than individual properties
///         to ensure a clean state.
///
/// - SeeAlso: [MDN Web Docs on mask](https://developer.mozilla.org/en-US/docs/Web/CSS/mask)
public enum Mask: Property {
    public static let property: String = "mask"
    
    /// No mask
    case none
    
    /// A single mask layer configuration
    case configuration(Configuration)
    
    /// Multiple mask layers
    case layers([Configuration])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Configuration for a mask layer
    public struct Configuration: Sendable, Equatable, CustomStringConvertible {
        /// The mask reference (image or source)
        public let reference: MaskReference
        
        /// The position of the mask
        public let position: Position?
        
        /// The size of the mask
        public let size: Size?
        
        /// The repeat style of the mask
        public let `repeat`: RepeatStyle?
        
        /// The clipping box of the mask
        public let clip: GeometryBox?
        
        /// The origin box of the mask
        public let origin: GeometryBox?
        
        /// The composite operation of the mask
        public let composite: Composite?
        
        /// The masking mode
        public let mode: MaskingMode?
        
        /// Creates a mask configuration
        ///
        /// - Parameters:
        ///   - reference: The mask reference
        ///   - position: The position of the mask (optional)
        ///   - size: The size of the mask (optional)
        ///   - repeat: The repeat style of the mask (optional)
        ///   - clip: The clipping box of the mask (optional)
        ///   - origin: The origin box of the mask (optional)
        ///   - composite: The composite operation of the mask (optional)
        ///   - mode: The masking mode (optional)
        public init(
            _ reference: MaskReference,
            position: Position? = nil,
            size: Size? = nil,
            repeat: RepeatStyle? = nil,
            clip: GeometryBox? = nil,
            origin: GeometryBox? = nil,
            composite: Composite? = nil,
            mode: MaskingMode? = nil
        ) {
            self.reference = reference
            self.position = position
            self.size = size
            self.repeat = `repeat`
            self.clip = clip
            self.origin = origin
            self.composite = composite
            self.mode = mode
        }
        
        /// CSS string representation
        public var description: String {
            var parts: [String] = []
            
            // Mask reference
            parts.append(reference.description)
            
            // Masking mode
            if let mode = mode {
                parts.append(modeDescription(mode))
            }
            
            // Position and size
            if let position = position {
                let positionPart = positionDescription(position)
                
                if let size = size {
                    parts.append("\(positionPart) / \(sizeDescription(size))")
                } else {
                    parts.append(positionPart)
                }
            } else if let size = size {
                parts.append("0% 0% / \(sizeDescription(size))")
            }
            
            // Repeat
            if let `repeat` = `repeat` {
                parts.append(repeatDescription(`repeat`))
            }
            
            // Geometry boxes (clip and origin)
            if let origin = origin {
                if let clip = clip {
                    // If both are provided and different
                    if clip != origin {
                        parts.append(geometryBoxDescription(origin))
                        parts.append(clipDescription(clip))
                    } else {
                        // If both are the same, just use one value
                        parts.append(geometryBoxDescription(origin))
                    }
                } else {
                    parts.append(geometryBoxDescription(origin))
                }
            } else if let clip = clip {
                parts.append(clipDescription(clip))
            }
            
            // Composite
            if let composite = composite {
                parts.append(compositeDescription(composite))
            }
            
            return parts.joined(separator: " ")
        }
        
        private func positionDescription(_ position: Position) -> String {
            switch position {
            case .keywords(let horizontal, let vertical):
                return "\(horizontal.rawValue) \(vertical.rawValue)"
            case .custom(let x, let y):
                return "\(x) \(y)"
            case .center:
                return "center"
            case .top:
                return "top"
            case .bottom:
                return "bottom"
            case .left:
                return "left"
            case .right:
                return "right"
            }
        }
        
        private func sizeDescription(_ size: Size) -> String {
            switch size {
            case .dimensions(let width, let height):
                return "\(width) \(height)"
            case .cover:
                return "cover"
            case .contain:
                return "contain"
            case .auto:
                return "auto"
            }
        }
        
        private func repeatDescription(_ repeat: RepeatStyle) -> String {
            switch `repeat` {
            case .repeatX:
                return "repeat-x"
            case .repeatY:
                return "repeat-y"
            case .repeat:
                return "repeat"
            case .space:
                return "space"
            case .round:
                return "round"
            case .noRepeat:
                return "no-repeat"
            case .horizontal_vertical(let horizontal, let vertical):
                return "\(horizontal.rawValue) \(vertical.rawValue)"
            }
        }
        
        private func geometryBoxDescription(_ box: GeometryBox) -> String {
            switch box {
            case .contentBox:
                return "content-box"
            case .paddingBox:
                return "padding-box"
            case .borderBox:
                return "border-box"
            case .marginBox:
                return "margin-box"
            case .fillBox:
                return "fill-box"
            case .strokeBox:
                return "stroke-box"
            case .viewBox:
                return "view-box"
            case .noClip:
                return "no-clip"
            }
        }
        
        private func clipDescription(_ clip: GeometryBox) -> String {
            if clip == .noClip {
                return "no-clip"
            } else {
                return geometryBoxDescription(clip)
            }
        }
        
        private func compositeDescription(_ composite: Composite) -> String {
            switch composite {
            case .add:
                return "add"
            case .subtract:
                return "subtract"
            case .intersect:
                return "intersect"
            case .exclude:
                return "exclude"
            }
        }
        
        private func modeDescription(_ mode: MaskingMode) -> String {
            switch mode {
            case .alpha:
                return "alpha"
            case .luminance:
                return "luminance"
            case .matchSource:
                return "match-source"
            }
        }
    }
    
    /// Represents a mask reference
    public enum MaskReference: Sendable, Equatable, CustomStringConvertible {
        /// No mask
        case none
        
        /// URL to an image or SVG element
        case url(Url)
        
        /// Linear gradient
        case linearGradient(CSSString)
        
        /// Radial gradient
        case radialGradient(CSSString)
        
        /// Conic gradient
        case conicGradient(CSSString)
        
        /// Repeating linear gradient
        case repeatingLinearGradient(CSSString)
        
        /// Repeating radial gradient
        case repeatingRadialGradient(CSSString)
        
        /// Repeating conic gradient
        case repeatingConicGradient(CSSString)
        
        /// CSS string representation
        public var description: String {
            switch self {
            case .none:
                return "none"
            case .url(let url):
                // If url already contains url(), use it as is
                if url.value.hasPrefix("url(") {
                    return url.description
                }
                // If url contains quotes, use it as is inside url()
                if url.value.contains("\"") || url.value.contains("'") {
                    return "url(\(url))"
                }
                // Otherwise, add quotes
                return "url(\"\(url)\")"
            case .linearGradient(let value):
                return "linear-gradient(\(value))"
            case .radialGradient(let value):
                return "radial-gradient(\(value))"
            case .conicGradient(let value):
                return "conic-gradient(\(value))"
            case .repeatingLinearGradient(let value):
                return "repeating-linear-gradient(\(value))"
            case .repeatingRadialGradient(let value):
                return "repeating-radial-gradient(\(value))"
            case .repeatingConicGradient(let value):
                return "repeating-conic-gradient(\(value))"
            }
        }
    }
    
    /// Position of a mask
    public enum Position: Sendable, Equatable {
        /// Keywords for horizontal and vertical position
        case keywords(Horizontal, Vertical)
        
        /// Custom position with specific values
        case custom(LengthPercentage, LengthPercentage)
        
        /// Center position (shorthand for center center)
        case center
        
        /// Top position (shorthand for center top)
        case top
        
        /// Bottom position (shorthand for center bottom)
        case bottom
        
        /// Left position (shorthand for left center)
        case left
        
        /// Right position (shorthand for right center)
        case right
        
        /// Horizontal position keywords
        public enum Horizontal: String, Sendable {
            case left
            case center
            case right
        }
        
        /// Vertical position keywords
        public enum Vertical: String, Sendable {
            case top
            case center
            case bottom
        }
    }
    
    /// Size of a mask
    public enum Size: Sendable, Equatable {
        /// Explicit width and height dimensions
        case dimensions(LengthPercentage, LengthPercentage)
        
        /// Scale mask to cover the entire element, possibly cropping the mask
        case cover
        
        /// Scale mask to fit within the element, possibly leaving uncovered areas
        case contain
        
        /// Use the mask's intrinsic size
        case auto
    }
    
    /// Repeat style for a mask
    public enum RepeatStyle: Sendable, Equatable {
        /// Repeat horizontally only (shorthand for repeat no-repeat)
        case repeatX
        
        /// Repeat vertically only (shorthand for no-repeat repeat)
        case repeatY
        
        /// Repeat in both directions
        case `repeat`
        
        /// Repeat with space between each tile
        case space
        
        /// Repeat and scale to fit an exact number of tiles
        case round
        
        /// No repetition
        case noRepeat
        
        /// Different values for horizontal and vertical
        case horizontal_vertical(Value, Value)
        
        /// Repeat value
        public enum Value: String, Sendable {
            case `repeat`
            case space
            case round
            case noRepeat = "no-repeat"
        }
    }
    
    /// Geometry box for mask origin and clip
    public enum GeometryBox: Sendable, Equatable {
        /// The content box
        case contentBox
        
        /// The padding box
        case paddingBox
        
        /// The border box
        case borderBox
        
        /// The margin box
        case marginBox
        
        /// The fill box (SVG)
        case fillBox
        
        /// The stroke box (SVG)
        case strokeBox
        
        /// The view box (SVG)
        case viewBox
        
        /// Special value for no-clip (only valid for mask-clip)
        case noClip
    }
    
    /// Compositing operation for mask layers
    public enum Composite: String, Sendable, Equatable {
        /// Add the current mask layer to the previous layers
        case add
        
        /// Subtract the current mask layer from the previous layers
        case subtract
        
        /// Intersect the current mask layer with the previous layers
        case intersect
        
        /// Areas covered by both the current mask layer and previous layers are excluded
        case exclude
    }
    
    /// Masking mode
    public enum MaskingMode: Sendable, Equatable {
        /// Use alpha channel for masking
        case alpha
        
        /// Use luminance values for masking
        case luminance
        
        /// Use the mask source's native format
        case matchSource
    }
    
    /// Creates a mask with URL reference
    ///
    /// - Parameter url: The URL to the mask image
    /// - Returns: A mask using the URL
    public static func url(_ url: Url) -> Mask {
        return .configuration(Configuration(.url(url)))
    }
    
    /// Creates a mask with a linear gradient
    ///
    /// - Parameter gradient: The linear gradient definition
    /// - Returns: A mask using the linear gradient
    public static func linearGradient(_ gradient: CSSString) -> Mask {
        return .configuration(Configuration(.linearGradient(gradient)))
    }
    
    /// Creates a mask with a radial gradient
    ///
    /// - Parameter gradient: The radial gradient definition
    /// - Returns: A mask using the radial gradient
    public static func radialGradient(_ gradient: CSSString) -> Mask {
        return .configuration(Configuration(.radialGradient(gradient)))
    }
}

/// Provides string conversion for CSS output
extension Mask: CustomStringConvertible {
    /// Converts the mask to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask: none;
    /// mask: url(mask.svg#element);
    /// mask: url(mask.svg) luminance;
    /// mask: url(mask.svg) center / cover no-repeat border-box content-box add alpha;
    /// mask: url(mask1.svg) top, url(mask2.svg) bottom;
    /// ```
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .configuration(let config):
            return config.description
        case .layers(let configs):
            return configs.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}
