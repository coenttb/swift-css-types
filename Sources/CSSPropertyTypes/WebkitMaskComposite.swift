//
//  WebkitMaskComposite.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The non-standard `-webkit-mask-composite` property specifies the manner in which
/// multiple mask images applied to the same element are composited with one another.
///
/// Mask images are composited in the opposite order that they are declared with the
/// -webkit-mask-image property.
///
/// Example:
/// ```swift
/// // Use source-over compositing (default)
/// .webkitMaskComposite(.sourceOver)
///
/// // Clear overlapping pixels
/// .webkitMaskComposite(.clear)
///
/// // Use XOR compositing
/// .webkitMaskComposite(.xor)
///
/// // Multiple composite operations for multiple masks
/// .webkitMaskComposite([.xor, .sourceOver, .sourceIn])
/// ```
///
/// - Note: This is a non-standard property and may not be supported by all browsers.
///         Consider using the standard `mask-composite` property for production sites,
///         though it uses different keywords.
///
public enum WebkitMaskComposite: Property {
    public static let property: String = "-webkit-mask-composite"
    
    /// A single composite operation
    case operation(CompositeOperation)
    
    /// Multiple composite operations for multiple masks
    case multiple([CompositeOperation])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Create a WebkitMaskComposite with a single operation
    public init(_ operation: CompositeOperation) {
        self = .operation(operation)
    }
    
    /// Create a WebkitMaskComposite with multiple operations
    public init(_ operations: [CompositeOperation]) {
        if operations.count == 1 {
            self = .operation(operations[0])
        } else {
            self = .multiple(operations)
        }
    }
    
    /// Composite operation for mask layers
    public enum CompositeOperation: String, Sendable, Equatable, CaseIterable {
        /// Overlapping pixels in the source mask image and the destination mask image are cleared
        case clear
        
        /// The source mask image replaces the destination mask image
        case copy
        
        /// The source mask image is rendered over the destination mask image
        case sourceOver = "source-over"
        
        /// Overlapping pixels in the source mask image and the destination mask image are replaced by the pixels of the source mask image; all other pixels are cleared
        case sourceIn = "source-in"
        
        /// Overlapping pixels in the source mask image and the destination mask image are cleared; all remaining pixels of the source mask image are rendered
        case sourceOut = "source-out"
        
        /// The pixels of the destination mask image are rendered. The pixels of the source mask image are rendered only if they overlap a nontransparent portion of the destination mask image
        case sourceAtop = "source-atop"
        
        /// The destination mask image is rendered over the source mask image
        case destinationOver = "destination-over"
        
        /// Overlapping pixels in the source mask image and the destination mask image remain the pixels of the destination mask image; all other pixels are cleared
        case destinationIn = "destination-in"
        
        /// Overlapping pixels in the source mask image and the destination mask image are cleared; all remaining pixels of the source mask image are rendered
        case destinationOut = "destination-out"
        
        /// The pixels of the source mask image are rendered. The pixels of the destination mask image are rendered only if they overlap a nontransparent portion of the destination mask image
        case destinationAtop = "destination-atop"
        
        /// Overlapping pixels in the source mask image and the destination mask image become fully transparent if they are both fully opaque
        case xor
    }
    
    public var description: String {
        switch self {
        case .operation(let operation):
            return operation.rawValue
        case .multiple(let operations):
            return operations.map { $0.rawValue }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience properties for WebkitMaskComposite
extension WebkitMaskComposite {
    /// Overlapping pixels in the source mask image and the destination mask image are cleared
    public static let clear = WebkitMaskComposite(.clear)
    
    /// The source mask image replaces the destination mask image
    public static let copy = WebkitMaskComposite(.copy)
    
    /// The source mask image is rendered over the destination mask image (default)
    public static let sourceOver = WebkitMaskComposite(.sourceOver)
    
    /// Overlapping pixels in the source mask image and the destination mask image are replaced by the pixels of the source mask image; all other pixels are cleared
    public static let sourceIn = WebkitMaskComposite(.sourceIn)
    
    /// Overlapping pixels in the source mask image and the destination mask image are cleared; all remaining pixels of the source mask image are rendered
    public static let sourceOut = WebkitMaskComposite(.sourceOut)
    
    /// The pixels of the destination mask image are rendered. The pixels of the source mask image are rendered only if they overlap a nontransparent portion of the destination mask image
    public static let sourceAtop = WebkitMaskComposite(.sourceAtop)
    
    /// The destination mask image is rendered over the source mask image
    public static let destinationOver = WebkitMaskComposite(.destinationOver)
    
    /// Overlapping pixels in the source mask image and the destination mask image remain the pixels of the destination mask image; all other pixels are cleared
    public static let destinationIn = WebkitMaskComposite(.destinationIn)
    
    /// Overlapping pixels in the source mask image and the destination mask image are cleared; all remaining pixels of the source mask image are rendered
    public static let destinationOut = WebkitMaskComposite(.destinationOut)
    
    /// The pixels of the source mask image are rendered. The pixels of the destination mask image are rendered only if they overlap a nontransparent portion of the destination mask image
    public static let destinationAtop = WebkitMaskComposite(.destinationAtop)
    
    /// Overlapping pixels in the source mask image and the destination mask image become fully transparent if they are both fully opaque
    public static let xor = WebkitMaskComposite(.xor)
}
