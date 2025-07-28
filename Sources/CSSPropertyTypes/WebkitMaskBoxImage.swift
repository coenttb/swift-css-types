//
//  WebkitMaskBoxImage.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard `-webkit-mask-box-image` property is a shorthand property that sets the mask image
/// for an element's border box.
///
/// This property allows using an image, gradient, or other mask source to define a mask for the border
/// area of an element with options for specifying offsets and repetition behavior.
///
/// Example:
/// ```swift
/// // Basic usage with URL
/// .webkitMaskBoxImage(.url("mask.png"))
///
/// // With edge offsets
/// .webkitMaskBoxImage(.url("mask.png"), .init(10, 20, 20, 10))
///
/// // With edge offsets and repeat style
/// .webkitMaskBoxImage(.url("mask.png"), .init(10, 20, 20, 10), repeat: .init(.round, .space))
/// ```
///
/// - Note: This is a non-standard property and may not be supported by all browsers.
///         Consider using the standard `mask-border` property for production sites.
///
public enum WebkitMaskBoxImage: Property {

    public static let property: String = "-webkit-mask-box-image"

    /// No mask image
    case none

    /// Mask image with offset and repeat configuration
    case config(Source, EdgeOffset? = nil, RepeatStyle? = nil)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Source for the mask image
    public enum Source: Sendable, Hashable {
        /// URL to the mask image
        case url(Url)

        /// Linear gradient as mask image
        case linearGradient(CSSString)

        /// Radial gradient as mask image
        case radialGradient(CSSString)
    }

    /// Edge offsets for the mask image
    public struct EdgeOffset: Sendable, Hashable {
        /// Top edge offset
        public let top: OffsetValue

        /// Right edge offset
        public let right: OffsetValue?

        /// Bottom edge offset
        public let bottom: OffsetValue?

        /// Left edge offset
        public let left: OffsetValue?

        /// Creates an edge offset with the same value for all sides
        public init(_ value: OffsetValue) {
            self.top = value
            self.right = nil
            self.bottom = nil
            self.left = nil
        }

        /// Creates an edge offset with different values for each side
        public init(_ top: OffsetValue, _ right: OffsetValue, _ bottom: OffsetValue, _ left: OffsetValue) {
            self.top = top
            self.right = right
            self.bottom = bottom
            self.left = left
        }

        /// Value type for edge offsets
        public enum OffsetValue: Sendable, Hashable, CustomStringConvertible {
            /// Number of pixels
            case number(Int)

            /// Length value
            case length(Length)

            /// Percentage value
            case percentage(Percentage)

            public var description: String {
                switch self {
                case .number(let number):
                    return number.description
                case .length(let length):
                    return length.description
                case .percentage(let percentage):
                    return percentage.description
                }
            }
        }
    }

    /// Repeat style for the mask image
    public struct RepeatStyle: Sendable, Hashable {
        /// Horizontal repeat style
        public let horizontal: Style

        /// Vertical repeat style (optional)
        public let vertical: Style?

        /// Creates a repeat style with same value for horizontal and vertical directions
        public init(_ style: Style) {
            self.horizontal = style
            self.vertical = nil
        }

        /// Creates a repeat style with different values for horizontal and vertical directions
        public init(_ horizontal: Style, _ vertical: Style) {
            self.horizontal = horizontal
            self.vertical = vertical
        }

        /// Style for how the image repeats
        public enum Style: String, Sendable, Hashable {
            /// Stretch the image to fill the space
            case stretch

            /// Repeat the image as needed
            case `repeat`

            /// Scale and repeat the image to fill the space evenly
            case round

            /// Repeat the image with spacing to fill the space
            case space
        }
    }

    public var description: String {
        switch self {
        case .none:
            return "none"

        case .config(let source, let offset, let repeatStyle):
            var parts: [String] = [sourceDescription(source)]

            if let offset = offset {
                parts.append(offsetDescription(offset))
            }

            if let repeatStyle = repeatStyle {
                parts.append(repeatStyleDescription(repeatStyle))
            }

            return parts.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }

    private func sourceDescription(_ source: Source) -> String {
        switch source {
        case .url(let url):
            return url.description
        case .linearGradient(let value):
            return "linear-gradient(\(value))"
        case .radialGradient(let value):
            return "radial-gradient(\(value))"
        }
    }

    private func offsetDescription(_ offset: EdgeOffset) -> String {
        var offsetValues: [String] = [offset.top.description]

        if let right = offset.right {
            offsetValues.append(right.description)

            if let bottom = offset.bottom {
                offsetValues.append(bottom.description)

                if let left = offset.left {
                    offsetValues.append(left.description)
                }
            }
        }

        return offsetValues.joined(separator: " ")
    }

    private func repeatStyleDescription(_ repeatStyle: RepeatStyle) -> String {
        if let vertical = repeatStyle.vertical {
            return "\(repeatStyle.horizontal.rawValue) \(vertical.rawValue)"
        } else {
            return repeatStyle.horizontal.rawValue
        }
    }
}
