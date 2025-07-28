//
//  ImageOrientation.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `image-orientation` property specifies a layout-independent correction to the orientation of an image.
///
/// This property is intended only to be used for the purpose of correcting the orientation of images
/// which were shot with the camera rotated. It should not be used for arbitrary rotations. For any purpose
/// other than correcting an image's orientation due to how it was shot or scanned, use a transform
/// property to specify rotation.
///
/// - Note: If used in conjunction with other CSS properties, such as a transform function,
///         any image-orientation rotation is applied before any other transformations.
///
/// - SeeAlso: [MDN Web Docs on image-orientation](https://developer.mozilla.org/en-US/docs/Web/CSS/image-orientation)
public enum ImageOrientation: Property {

    public static let property: String = "image-orientation"

    /// Does not apply any additional image rotation; the image is oriented as encoded
    /// or as other CSS property values dictate.
    ///
    /// - Warning: `none` does not override the orientation of non-secure-origin images
    ///            as encoded by their EXIF information, due to security concerns.
    case none

    /// The EXIF information contained in the image is used to rotate the image appropriately.
    /// This is the default value.
    case fromImage

    /// Specifies a rotation angle and optional flip
    case angle(Angle, flip: Bool)

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .fromImage:
            return "from-image"
        case .angle(let angle, let flip):
            return flip ? "\(angle) flip" : angle.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factory methods for common angle values
extension ImageOrientation {
    /// Rotate the image 90 degrees clockwise
    public static var rotate90: ImageOrientation {
        .angle(.deg(90), flip: false)
    }

    /// Rotate the image 180 degrees
    public static var rotate180: ImageOrientation {
        .angle(.deg(180), flip: false)
    }

    /// Rotate the image 270 degrees clockwise (or 90 degrees counterclockwise)
    public static var rotate270: ImageOrientation {
        .angle(.deg(270), flip: false)
    }

    /// Rotate the image 90 degrees clockwise and flip
    public static var rotate90Flip: ImageOrientation {
        .angle(.deg(90), flip: true)
    }

    /// Flip the image without rotation
    public static var flip: ImageOrientation {
        .angle(.deg(0), flip: true)
    }
}
