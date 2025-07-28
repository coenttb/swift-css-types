import CSSTypeTypes
import Foundation

/// Represents the CSS `mask-border` shorthand property, which allows creating a mask along the edge
/// of an element's border.
///
/// This property allows you to use an image as a mask for the border of an element. It's a shorthand
/// for setting the mask border source, slice, width, outset, repeat, and mode properties.
///
/// Example:
/// ```swift
/// // Basic mask border with a URL
/// .maskBorder(.config(.url("border-mask.png"), .slice(30)))
///
/// // Mask border with width and repeat
/// .maskBorder(.config(.url("border-mask.png"), .slice(30), width: .px(20), repeat: .round))
///
/// // Complex mask border with all properties
/// .maskBorder(.config(
///     .url("border-mask.png"),
///     .slice(30, 30, 30, 30, fill: true),
///     width: .px(20),
///     outset: .px(1),
///     repeat: .init(.round, .space),
///     mode: .alpha
/// ))
///
/// // Gradient as mask border
/// .maskBorder(.config(.linearGradient("45deg, black, transparent"), .slice(20), repeat: .round))
///
/// // Use a global value
/// .maskBorder(.global(.inherit))
/// ```
///
/// - Note: The `fill` keyword in the slice value is generally needed to make the element's
///         content visible when using `mask-border`.
///
/// - SeeAlso: [MDN Web Docs on mask-border](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border)
public enum MaskBorder: Property {
    public static let property: String = "mask-border"

    /// Configuration for a mask border
    case config(Configuration)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a mask border with specified properties
    ///
    /// - Parameters:
    ///   - source: The source of the mask border image
    ///   - slice: The slice values for dividing the mask border image
    ///   - width: The width of the mask border (optional)
    ///   - outset: The outset value of the mask border (optional)
    ///   - repeat: The repeat behavior of the mask border (optional)
    ///   - mode: The blending mode used for the mask border (optional)
    public init(
        _ source: Source,
        _ slice: Slice,
        _ width: Width? = nil,
        _ outset: Outset? = nil,
        _ repeat: Repeat? = nil,
        _ mode: Mode? = nil
    ) {
        self = .config(Configuration(
            source: source,
            slice: slice,
            width: width,
            outset: outset,
            repeat: `repeat`,
            mode: mode
        ))
    }

    /// Creates a mask border with simple parameters
    ///
    /// - Parameters:
    ///   - source: The source image (URL or gradient)
    ///   - slice: The slice value (single number for all sides)
    ///   - width: The width of the mask border (optional)
    ///   - repeat: The repeat behavior of the mask border (optional)
    ///   - mode: The blending mode of the mask border (optional)
    public init(
        source: Source,
        slice: Slice,
        width: Width? = nil,
        repeat: Repeat? = nil,
        mode: Mode? = nil
    ) {
        self = .config(Configuration(
            source: source,
            slice: slice,
            width: width,
            repeat: `repeat`,
            mode: mode
        ))
    }

    /// Configuration for a mask border
    public struct Configuration: Sendable, Hashable, CustomStringConvertible {
        /// The source of the mask border image
        public let source: Source

        /// The slice values for dividing the mask border image
        public let slice: Slice

        /// The width of the mask border
        public let width: Width?

        /// The outset value of the mask border
        public let outset: Outset?

        /// The repeat behavior of the mask border
        public let `repeat`: Repeat?

        /// The blending mode of the mask border
        public let mode: Mode?

        /// Creates a mask border configuration with specified properties
        ///
        /// - Parameters:
        ///   - source: The source of the mask border image
        ///   - slice: The slice values for dividing the mask border image
        ///   - width: The width of the mask border (optional)
        ///   - outset: The outset value of the mask border (optional)
        ///   - repeat: The repeat behavior of the mask border (optional)
        ///   - mode: The blending mode of the mask border (optional)
        public init(
            source: Source,
            slice: Slice,
            width: Width? = nil,
            outset: Outset? = nil,
            repeat: Repeat? = nil,
            mode: Mode? = nil
        ) {
            self.source = source
            self.slice = slice
            self.width = width
            self.outset = outset
            self.repeat = `repeat`
            self.mode = mode
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

            // Mode (optional)
            if let mode = mode {
                parts.append(modeDescription(mode))
            }

            return parts.joined(separator: " ")
        }

        private var sourceDescription: String {
            switch source {
            case .none:
                return "none"
            case .url(let url):
                return url.description
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

        private func modeDescription(_ mode: Mode) -> String {
            switch mode {
            case .alpha: return "alpha"
            case .luminance: return "luminance"
            case .global(let global):
                return global.description
            }
        }
    }

    /// The source of the mask border image
    public enum Source: Sendable, Hashable {
        /// No mask border image
        case none

        /// URL to the mask border image
        case url(Url)

        /// Linear gradient as mask border image
        case linearGradient(CSSString)

        /// Radial gradient as mask border image
        case radialGradient(CSSString)

        /// Conic gradient as mask border image
        case conicGradient(CSSString)

        /// Repeating linear gradient as mask border image
        case repeatingLinearGradient(CSSString)

        /// Repeating radial gradient as mask border image
        case repeatingRadialGradient(CSSString)

        /// Repeating conic gradient as mask border image
        case repeatingConicGradient(CSSString)
    }

    /// The slice values for dividing the mask border image
    public struct Slice: Sendable, Hashable {
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
        public enum SliceValue: Sendable, Hashable, CustomStringConvertible {
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
        public static func slice(_ value: Double) -> Slice {
            return Slice(.number(.init(value)))
        }

        /// Creates a slice value as a percentage
        ///
        /// - Parameter value: The percentage value
        /// - Returns: A slice with the percentage value
        public static func percentage(_ value: Percentage) -> Slice {
            return Slice(.percentage(value))
        }
    }

    /// The width of the mask border
    public struct Width: Sendable, Hashable, LengthPercentageConvertible {
        /// The top width value
        public let top: WidthValue

        /// The right width value
        public let right: WidthValue?

        /// The bottom width value
        public let bottom: WidthValue?

        /// The left width value
        public let left: WidthValue?

        public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> MaskBorder.Width {
            .init(.lengthPercentage(value))
        }

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
        public enum WidthValue: Sendable, Hashable, CustomStringConvertible, LengthPercentageConvertible {
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
                case .lengthPercentage(let length):
                    return length.description
                }
            }
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

    /// The outset value of the mask border
    public struct Outset: Sendable, Hashable, LengthConvertible {
        /// The top outset value
        public let top: OutsetValue

        /// The right outset value
        public let right: OutsetValue?

        /// The bottom outset value
        public let bottom: OutsetValue?

        /// The left outset value
        public let left: OutsetValue?

        public static func length(_ length: CSSTypeTypes.Length) -> MaskBorder.Outset {
            .init(.length(length))
        }

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
        public enum OutsetValue: Sendable, Hashable, CustomStringConvertible, LengthConvertible {
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

        /// Creates an outset with a number multiplier
        ///
        /// - Parameter number: The number multiplier
        /// - Returns: An outset with the specified number
        public static func number(_ number: Number) -> Outset {
            return Outset(.number(number))
        }
    }

    /// The repeat behavior of the mask border
    public struct Repeat: Sendable, Hashable {
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
        public enum RepeatValue: Sendable, Hashable {
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

    /// The blending mode of the mask border
    public typealias Mode = MaskBorderMode
}

/// Provides string conversion for CSS output
extension MaskBorder: CustomStringConvertible {
    /// Converts the mask-border to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-border: url("border-mask.png") 30;
    /// mask-border: url("border-mask.png") 30 / 20px round;
    /// mask-border: url("border-mask.png") 30 fill / 20px 30px / 1px round space alpha;
    /// mask-border: linear-gradient(45deg, black, transparent) 20 round;
    /// mask-border: inherit;
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
