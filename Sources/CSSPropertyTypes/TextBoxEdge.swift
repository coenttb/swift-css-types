//
//  TextBoxEdge.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `text-box-edge` property specifies an amount of space to trim from a text 
/// element's block container.
///
/// This property works with `text-box-trim` to determine how and where to trim space 
/// from text elements, making consistent typesetting easier. It has no effect if 
/// `text-box-trim` is set to none.
///
/// Example:
/// ```swift
/// .textBoxEdge(.auto)                      // text-box-edge: auto
/// .textBoxEdge(.edge(.text))               // text-box-edge: text
/// .textBoxEdge(.edgePair(.cap, .alphabetic)) // text-box-edge: cap alphabetic
/// ```
///
/// - Note: The `text-box` shorthand property can be used to specify both the text-box-edge
///         and text-box-trim values in a single declaration.
///
/// - SeeAlso: [MDN Web Docs on text-box-edge](https://developer.mozilla.org/en-US/docs/Web/CSS/text-box-edge)
public enum TextBoxEdge: Property {
    public static let property: String = "text-box-edge"
    
    /// The default value. Equivalent to the text-edge value text.
    case auto
    
    /// A single text-edge value for both over and under edges
    case edge(TextEdge.Value)
    
    /// Separate values for over and under edges
    case edgePair(TextEdge.OverValue, TextEdge.UnderValue)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    /// Creates a text box edge using the TextEdge type
    public init(_ textEdge: TextEdge) {
        switch textEdge {
        case .single(let value):
            self = .edge(value)
        case .pair(let overValue, let underValue):
            self = .edgePair(overValue, underValue)
        }
    }
    
    /// Both font edges are set to 'text' baseline
    public static let text = TextBoxEdge.edge(.text)
    
    /// Both font edges are set to 'ideographic' baseline
    public static let ideographic = TextBoxEdge.edge(.ideographic)
    
    /// Both font edges are set to 'ideographic-ink' baseline
    public static let ideographicInk = TextBoxEdge.edge(.ideographicInk)
    
    /// Over edge at cap height, under edge at alphabetic baseline (common for Latin text)
    public static let capAlphabetic = TextBoxEdge.edgePair(.cap, .alphabetic)
    
    /// Over edge at x-height, under edge at alphabetic baseline
    public static let exAlphabetic = TextBoxEdge.edgePair(.ex, .alphabetic)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .edge(let value):
            return value.rawValue
        case .edgePair(let overValue, let underValue):
            return "\(overValue.rawValue) \(underValue.rawValue)"
        case .global(let global):
            return global.description
        }
    }
}
