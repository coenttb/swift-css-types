//
//  MozImageRegion.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard CSS `-moz-image-region` property specifies a region of an image to use
/// in place of the whole image for certain Mozilla XUL elements.
///
/// This property is primarily used with elements that use `list-style-image` to display images,
/// allowing multiple elements to use different parts of the same image (like a sprite sheet),
/// improving performance by reducing the number of image requests.
///
/// Example:
/// ```swift
/// // Use the entire image (default)
/// .mozImageRegion(.auto)
///
/// // Use only a specific region of the image
/// .mozImageRegion(.rect(top: .px(0), right: .px(16), bottom: .px(16), left: .px(0)))
/// ```
///
/// - Note: This is a non-standard Mozilla-specific property for XUL elements and specific pseudo-elements.
///         It's primarily used in Firefox UI development and is not intended for standard web content.
///         For web content, consider using CSS background properties with background-position.
///
/// - SeeAlso: [MDN Web Docs on -moz-image-region](https://developer.mozilla.org/en-US/docs/Web/CSS/-moz-image-region)
public enum MozImageRegion: Property {
    public static let property: String = "moz-image-region"

    /// Use the entire image
    case auto

    /// Specify a rectangular region of the image to use
    case rect(top: Length, right: Length, bottom: Length, left: Length)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .rect(let top, let right, let bottom, let left):
            return
                "rect(\(top.description), \(right.description), \(bottom.description), \(left.description))"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience extensions for creating rect-based MozImageRegion
extension MozImageRegion {
    /// Creates a rectangular region with pixel values
    ///
    /// - Parameters:
    ///   - top: Top edge offset in pixels
    ///   - right: Right edge offset in pixels
    ///   - bottom: Bottom edge offset in pixels
    ///   - left: Left edge offset in pixels
    /// - Returns: A MozImageRegion with the specified rectangular region
    public static func pxRect(
        top: Double,
        right: Double,
        bottom: Double,
        left: Double
    ) -> MozImageRegion {
        .rect(top: .px(top), right: .px(right), bottom: .px(bottom), left: .px(left))
    }
}
