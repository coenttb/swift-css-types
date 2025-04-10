import Foundation
import CSSTypeTypes

/// Represents the CSS `border-image` shorthand property, which draws an image around an element instead of the regular border.
///
/// This property allows you to use an image as the border of an element instead of
/// the traditional border styles. It's a shorthand for setting the border image source,
/// slice, width, outset, and repeat properties.
///
/// Example:
/// ```swift
/// // Basic border image with a URL
/// .borderImage(.config(.url("border.png"), .slice(27)))
///
/// // Border image with width and repeat
/// .borderImage(.config(.url("border.png"), .slice(27), width: .px(20), repeat: .round))
///
/// // Complex border image with all properties
/// .borderImage(.config(
///     .url("border.png"),
///     .slice(27, 27, 27, 27, fill: true),
///     width: .px(20),
///     outset: .px(10),
///     repeat: .init(.round, .space)
/// ))
///
/// // Gradient as border image
/// .borderImage(.config(.linearGradient(["red", "blue"], "45deg"), .slice(20), repeat: .round))
///
/// // Use a global value
/// .borderImage(.global(.inherit))
/// ```
///
/// - Note: For the border image to be visible, the element should have a border width set.
///         Some browsers don't render the border image if `border-style` is `none` or
///         `border-width` is `0`.
///
/// - SeeAlso: [MDN Web Docs on border-image](https://developer.mozilla.org/en-US/docs/Web/CSS/border-image)
public enum BorderImage: Property {
    public static let property: String = "border-image"
    
    /// Configuration for a border image
    case config(Configuration)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Creates a border image with specified properties
    ///
    /// - Parameters:
    ///   - source: The source of the border image
    ///   - slice: The slice values for dividing the border image
    ///   - width: The width of the border image (optional)
    ///   - outset: The outset value of the border image (optional)
    ///   - repeat: The repeat behavior of the border image (optional)
    public init(
        _ source: Source,
        _ slice: Slice,
        _ width: Width? = nil,
        _ outset: Outset? = nil,
        _ repeat: Repeat? = nil
    ) {
        self = .config(Configuration(
            source: source,
            slice: slice,
            width: width,
            outset: outset,
            repeat: `repeat`
        ))
    }
    
    /// Creates a border image with simple parameters
    ///
    /// - Parameters:
    ///   - source: The source image (URL or gradient)
    ///   - slice: The slice value (single number for all sides)
    ///   - width: The width of the border image (optional)
    ///   - repeat: The repeat behavior of the border image (optional)
    public init(
        source: Source,
        slice: Slice,
        width: Width? = nil,
        repeat: Repeat? = nil
    ) {
        self = .config(Configuration(
            source: source,
            slice: slice,
            width: width,
            repeat: `repeat`
        ))
    }
    
    /// Configuration for a border image
    public struct Configuration: Sendable, Equatable, CustomStringConvertible {
        /// The source of the border image
        public let source: Source
        
        /// The slice values for dividing the border image
        public let slice: Slice
        
        /// The width of the border image
        public let width: Width?
        
        /// The outset value of the border image
        public let outset: Outset?
        
        /// The repeat behavior of the border image
        public let `repeat`: Repeat?
        
        /// Creates a border image configuration with specified properties
        ///
        /// - Parameters:
        ///   - source: The source of the border image
        ///   - slice: The slice values for dividing the border image
        ///   - width: The width of the border image (optional)
        ///   - outset: The outset value of the border image (optional)
        ///   - repeat: The repeat behavior of the border image (optional)
        public init(
            source: Source,
            slice: Slice,
            width: Width? = nil,
            outset: Outset? = nil,
            repeat: Repeat? = nil
        ) {
            self.source = source
            self.slice = slice
            self.width = width
            self.outset = outset
            self.repeat = `repeat`
        }
        
        /// CSS string representation
        public var description: String {
            var parts: [String] = []
            
            // Source
            parts.append(sourceDescription)
            
            // Slice (required)
            parts.append(sliceDescription)
            
            // Width and Outset (optional)
            if let width = width {
                let widthPart = " / \(widthDescription(width))"
                
                if let outset = outset {
                    parts.append(widthPart + " / \(outsetDescription(outset))")
                } else {
                    parts.append(widthPart)
                }
            } else if let outset = outset {
                parts.append(" / / \(outsetDescription(outset))")
            }
            
            // Repeat (optional)
            if let `repeat` = `repeat` {
                parts.append(repeatDescription(`repeat`))
            }
            
            return parts.joined(separator: " ")
        }
        
        private var sourceDescription: String {
            switch source {
            case .none:
                return "none"
            case .url(let url):
                return url.description
            case .linearGradient(let colors, let angle):
                let angleStr = angle.map { "\($0), " } ?? ""
                let colorsStr = colors.joined(separator: ", ")
                return "linear-gradient(\(angleStr)\(colorsStr))"
            case .radialGradient(let colors, let position):
                let positionStr = position.map { "\($0), " } ?? ""
                let colorsStr = colors.joined(separator: ", ")
                return "radial-gradient(\(positionStr)\(colorsStr))"
            case .repeatingLinearGradient(let colors, let angle):
                let angleStr = angle.map { "\($0), " } ?? ""
                let colorsStr = colors.joined(separator: ", ")
                return "repeating-linear-gradient(\(angleStr)\(colorsStr))"
            case .repeatingRadialGradient(let colors, let position):
                let positionStr = position.map { "\($0), " } ?? ""
                let colorsStr = colors.joined(separator: ", ")
                return "repeating-radial-gradient(\(positionStr)\(colorsStr))"
            }
        }
        
        private var sliceDescription: String {
            var sliceValues: [String] = [slice.top.description]
            
            if let right = slice.right {
                sliceValues.append(right.description)
                
                if let bottom = slice.bottom {
                    sliceValues.append(bottom.description)
                    
                    if let left = slice.left {
                        sliceValues.append(left.description)
                    }
                }
            }
            
            let sliceStr = sliceValues.joined(separator: " ")
            return slice.fill ? "\(sliceStr) fill" : sliceStr
        }
        
        private func widthDescription(_ width: Width) -> String {
            var widthValues: [String] = [width.top.description]
            
            if let right = width.right {
                widthValues.append(right.description)
                
                if let bottom = width.bottom {
                    widthValues.append(bottom.description)
                    
                    if let left = width.left {
                        widthValues.append(left.description)
                    }
                }
            }
            
            return widthValues.joined(separator: " ")
        }
        
        private func outsetDescription(_ outset: Outset) -> String {
            var outsetValues: [String] = [outset.top.description]
            
            if let right = outset.right {
                outsetValues.append(right.description)
                
                if let bottom = outset.bottom {
                    outsetValues.append(bottom.description)
                    
                    if let left = outset.left {
                        outsetValues.append(left.description)
                    }
                }
            }
            
            return outsetValues.joined(separator: " ")
        }
        
        private func repeatDescription(_ repeat: Repeat) -> String {
            if let vertical = `repeat`.vertical {
                return "\(repeatValueDescription(`repeat`.horizontal)) \(repeatValueDescription(vertical))"
            } else {
                return repeatValueDescription(`repeat`.horizontal)
            }
        }
        
        private func repeatValueDescription(_ value: Repeat.RepeatValue) -> String {
            switch value {
            case .stretch: return "stretch"
            case .repeat: return "repeat"
            case .round: return "round"
            case .space: return "space"
            }
        }
    }
    
    /// The source of the border image
    public enum Source: Sendable, Equatable {
        /// No border image
        case none
        
        /// URL to the border image
        case url(Url)
        
        /// Linear gradient as border image
        case linearGradient([String], String?)
        
        /// Radial gradient as border image
        case radialGradient([String], String?)
        
        /// Repeating linear gradient as border image
        case repeatingLinearGradient([String], String?)
        
        /// Repeating radial gradient as border image
        case repeatingRadialGradient([String], String?)
    }
    
    /// The slice values for dividing the border image
    public struct Slice: Sendable, Equatable {
        /// The top slice value
        public let top: SliceValue
        
        /// The right slice value
        public let right: SliceValue?
        
        /// The bottom slice value
        public let bottom: SliceValue?
        
        /// The left slice value
        public let left: SliceValue?
        
        /// Whether to fill the middle part
        public let fill: Bool
        
        /// Creates a slice with the same value for all sides
        ///
        /// - Parameters:
        ///   - value: The slice value for all sides
        ///   - fill: Whether to fill the middle part (default: false)
        public init(_ value: SliceValue, fill: Bool = false) {
            self.top = value
            self.right = nil
            self.bottom = nil
            self.left = nil
            self.fill = fill
        }
        
        /// Creates a slice with different values for each side
        ///
        /// - Parameters:
        ///   - top: The top slice value
        ///   - right: The right slice value
        ///   - bottom: The bottom slice value
        ///   - left: The left slice value
        ///   - fill: Whether to fill the middle part (default: false)
        public init(_ top: SliceValue, _ right: SliceValue, _ bottom: SliceValue, _ left: SliceValue, fill: Bool = false) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
            self.fill = fill
        }
        
        /// Slice value type
        public enum SliceValue: Sendable, Equatable, CustomStringConvertible {
            /// Number value for slice
            case number(Number)
            
            /// Percentage value for slice
            case percentage(Percentage)
            
            /// Returns string representation of the slice value
            public var description: String {
                switch self {
                case .number(let number):
                    return number.description
                case .percentage(let percentage):
                    return percentage.description
                }
            }
        }
        
        /// Creates a slice value from a number
        ///
        /// - Parameter value: The number value
        /// - Returns: A slice with the number value
        public static func slice(_ value: Number) -> Slice {
            return Slice(.number(value))
        }
        
        /// Creates a slice value as a percentage
        ///
        /// - Parameter value: The percentage value
        /// - Returns: A slice with the percentage value
        public static func percentage(_ value: Percentage) -> Slice {
            return Slice(.percentage(value))
        }
    }
    
    /// The width of the border image
    public struct Width: Sendable, Equatable {
        /// The top width value
        public let top: WidthValue
        
        /// The right width value
        public let right: WidthValue?
        
        /// The bottom width value
        public let bottom: WidthValue?
        
        /// The left width value
        public let left: WidthValue?
        
        /// Creates a width with the same value for all sides
        ///
        /// - Parameter value: The width value for all sides
        public init(_ value: WidthValue) {
            self.top = value
            self.right = nil
            self.bottom = nil
            self.left = nil
        }
        
        /// Creates a width with different values for each side
        ///
        /// - Parameters:
        ///   - top: The top width value
        ///   - right: The right width value
        ///   - bottom: The bottom width value
        ///   - left: The left width value
        public init(_ top: WidthValue, _ right: WidthValue, _ bottom: WidthValue, _ left: WidthValue) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
        }
        
        /// Width value type
        public enum WidthValue: Sendable, Equatable, CustomStringConvertible, LengthPercentageConvertible {
            /// Auto width
            case auto
            
            /// Number multiplier
            case number(Number)
            
            /// Length value
            case lengthPercentage(LengthPercentage)
            
            /// Returns string representation of the width value
            public var description: String {
                switch self {
                case .auto:
                    return "auto"
                case .number(let number):
                    return number.description
                case .lengthPercentage(let lengthPercentage):
                    return lengthPercentage.description
                }
            }
        }
        
        /// Creates a width with a length value
        ///
        /// - Parameter px: The pixel value
        /// - Returns: A width with the specified pixel length
        public static func px(_ px: Double) -> Width {
            return Width(.length(.px(px)))
        }
        
        /// Creates a width with a number multiplier
        ///
        /// - Parameter number: The number multiplier
        /// - Returns: A width with the specified number
        public static func number(_ number: Number) -> Width {
            return Width(.number(number))
        }
        
        /// Creates a width with auto value
        public static let auto = Width(.auto)
    }
    
    /// The outset value of the border image
    public struct Outset: Sendable, Equatable {
        /// The top outset value
        public let top: OutsetValue
        
        /// The right outset value
        public let right: OutsetValue?
        
        /// The bottom outset value
        public let bottom: OutsetValue?
        
        /// The left outset value
        public let left: OutsetValue?
        
        /// Creates an outset with the same value for all sides
        ///
        /// - Parameter value: The outset value for all sides
        public init(_ value: OutsetValue) {
            self.top = value
            self.right = nil
            self.bottom = nil
            self.left = nil
        }
        
        /// Creates an outset with different values for each side
        ///
        /// - Parameters:
        ///   - top: The top outset value
        ///   - right: The right outset value
        ///   - bottom: The bottom outset value
        ///   - left: The left outset value
        public init(_ top: OutsetValue, _ right: OutsetValue, _ bottom: OutsetValue, _ left: OutsetValue) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
        }
        
        /// Outset value type
        public enum OutsetValue: Sendable, Equatable, CustomStringConvertible, LengthConvertible {
            /// Number multiplier
            case number(Number)
            
            /// Length value
            case length(Length)
            
            /// Returns string representation of the outset value
            public var description: String {
                switch self {
                case .number(let number):
                    return number.description
                case .length(let length):
                    return length.description
                }
            }
        }
        
        /// Creates an outset with a length value
        ///
        /// - Parameter px: The pixel value
        /// - Returns: An outset with the specified pixel length
        public static func px(_ px: Double) -> Outset {
            return Outset(.length(.px(px)))
        }
        
        /// Creates an outset with a number multiplier
        ///
        /// - Parameter number: The number multiplier
        /// - Returns: An outset with the specified number
        public static func number(_ number: Number) -> Outset {
            return Outset(.number(number))
        }
    }
    
    /// The repeat behavior of the border image
    public struct Repeat: Sendable, Equatable {
        /// The horizontal repeat value
        public let horizontal: RepeatValue
        
        /// The vertical repeat value (optional)
        public let vertical: RepeatValue?
        
        /// Creates a repeat with the same value for horizontal and vertical
        ///
        /// - Parameter value: The repeat value for both directions
        public init(_ value: RepeatValue) {
            self.horizontal = value
            self.vertical = nil
        }
        
        /// Creates a repeat with different values for horizontal and vertical
        ///
        /// - Parameters:
        ///   - horizontal: The horizontal repeat value
        ///   - vertical: The vertical repeat value
        public init(_ horizontal: RepeatValue, _ vertical: RepeatValue) {
            self.horizontal = horizontal
            self.vertical = vertical
        }
        
        /// Repeat value type
        public enum RepeatValue: Sendable, Equatable {
            /// Stretch the image to fill the space
            case stretch
            
            /// Repeat the image to fill the space
            case `repeat`
            
            /// Scale the image to fit the space evenly
            case round
            
            /// Repeat the image with spacing to fit evenly
            case space
        }
    }
}

/// Provides string conversion for CSS output
extension BorderImage: CustomStringConvertible {
    /// Converts the border-image to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-image: url("border.png") 27;
    /// border-image: url("border.png") 27 / 20px round;
    /// border-image: url("border.png") 27 fill / 20px 30px / 10px round space;
    /// border-image: linear-gradient(45deg, red, blue) 20 round;
    /// border-image: inherit;
    /// ```
    public var description: String {
        switch self {
        case .config(let config):
            return config.description
        case .global(let global):
            return global.description
        }
    }
}

