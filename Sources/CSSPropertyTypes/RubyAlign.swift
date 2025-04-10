//
//  RubyAlign.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `ruby-align` property defines the distribution of ruby elements over the base text.
///
/// Ruby annotations are small text used to indicate pronunciation or meaning of the corresponding characters.
/// This property controls how the ruby text is aligned in relation to its base text when the two
/// have different lengths.
///
/// Example:
/// ```swift
/// .rubyAlign(.start)          // ruby-align: start
/// .rubyAlign(.center)         // ruby-align: center
/// .rubyAlign(.spaceBetween)   // ruby-align: space-between
/// .rubyAlign(.spaceAround)    // ruby-align: space-around
/// ```
///
/// - SeeAlso: [MDN Web Docs on ruby-align](https://developer.mozilla.org/en-US/docs/Web/CSS/ruby-align)
public enum RubyAlign: Property {
    public static let property: String = "ruby-align"
    
    /// Ruby is aligned with the start of the base text
    case start
    
    /// Ruby is aligned at the middle of the base text
    case center
    
    /// Extra space is distributed between ruby elements
    case spaceBetween
    
    /// Extra space is distributed between and around ruby elements
    case spaceAround
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .start:
            return "start"
        case .center:
            return "center"
        case .spaceBetween:
            return "space-between"
        case .spaceAround:
            return "space-around"
        case .global(let global):
            return global.description
        }
    }
}
