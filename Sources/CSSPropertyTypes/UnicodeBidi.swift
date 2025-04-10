//
//  UnicodeBidi.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `unicode-bidi` property, together with the `direction` property, determines how bidirectional text
/// in a document is handled.
///
/// For example, if a block of content contains both left-to-right and right-to-left text,
/// the user-agent uses a complex Unicode algorithm to decide how to display the text.
/// The `unicode-bidi` property overrides this algorithm and allows the developer to control the text embedding.
///
/// - Note: The `unicode-bidi` and `direction` properties are the only properties that are not affected
///         by the `all` shorthand.
///
/// - Warning: This property is intended for Document Type Definition (DTD) designers.
///            Web designers and similar authors should not override it.
///
/// - SeeAlso: [MDN Web Docs on unicode-bidi](https://developer.mozilla.org/en-US/docs/Web/CSS/unicode-bidi)
public enum UnicodeBidi: Property {
    
    public static let property: String = "unicode-bidi"
    
    /// The element does not offer an additional level of embedding with respect to the bidirectional algorithm.
    /// For inline elements, implicit reordering works across element boundaries.
    case normal
    
    /// If the element is inline, this value opens an additional level of embedding with respect to
    /// the bidirectional algorithm. The direction of this embedding level is given by the direction property.
    case embed
    
    /// For inline elements this creates an override. For block container elements this creates an
    /// override for inline-level descendants not within another block container element.
    case bidiOverride
    
    /// This keyword indicates that the element's container directionality should be calculated
    /// without considering the content of this element. The element is therefore isolated from its siblings.
    case isolate
    
    /// This keyword applies the isolation behavior of the isolate keyword to the surrounding content
    /// and the override behavior of the bidi-override keyword to the inner content.
    case isolateOverride
    
    /// This keyword makes the elements directionality calculated without considering its parent bidirectional
    /// state or the value of the direction property.
    case plaintext
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .normal: return "normal"
        case .embed: return "embed"
        case .bidiOverride: return "bidi-override"
        case .isolate: return "isolate"
        case .isolateOverride: return "isolate-override"
        case .plaintext: return "plaintext"
        case .global(let global): return global.description
        }
    }
}
