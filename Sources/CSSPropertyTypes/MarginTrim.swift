//
//  MarginTrim.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `margin-trim` property allows a container to trim the margins of its children
/// where they adjoin the container's edges.
///
/// This property is particularly useful for eliminating unwanted extra spaces at the beginning
/// and end of containers while maintaining spacing between child elements.
///
/// Example:
/// ```swift
/// // No margin trimming (default)
/// .marginTrim(.none)
///
/// // Trim margins at both block edges
/// .marginTrim(.block)
///
/// // Trim margins at the start of blocks only
/// .marginTrim(.blockStart)
///
/// // Trim both inline margins
/// .marginTrim(.inline)
///
/// // Trim multiple edge margins
/// .marginTrim(.edges([.blockStart, .inlineEnd]))
/// ```
///
/// - Note: This is an experimental property and support is currently limited. 
///         As of early 2025, only Safari supports this property.
///
/// - SeeAlso: [MDN Web Docs on margin-trim](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-trim)
public enum MarginTrim: Property {
    public static let property: String = "margin-trim"
    
    /// Margins are not trimmed by the container (default)
    case none
    
    /// Margins of block children at both start and end edges are trimmed
    case block
    
    /// Margin of the first block child with the container's edge is trimmed
    case blockStart
    
    /// Margin of the last block child with the container's edge is trimmed
    case blockEnd
    
    /// Margins of inline children at both start and end edges are trimmed
    case inline
    
    /// Margin between the container's edge and the first inline child is trimmed
    case inlineStart
    
    /// Margin between the container's edge and the last inline child is trimmed
    case inlineEnd
    
    /// Custom combination of edge margins to trim
    case edges([Edge])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Edge types for margin trimming
    public enum Edge: String, Sendable, Equatable, CaseIterable {
        /// First block child margin
        case blockStart = "block-start"
        
        /// Last block child margin
        case blockEnd = "block-end"
        
        /// First inline child margin
        case inlineStart = "inline-start"
        
        /// Last inline child margin
        case inlineEnd = "inline-end"
    }
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .block:
            return "block"
        case .blockStart:
            return "block-start"
        case .blockEnd:
            return "block-end"
        case .inline:
            return "inline"
        case .inlineStart:
            return "inline-start"
        case .inlineEnd:
            return "inline-end"
        case .edges(let edges):
            return edges.map { $0.rawValue }.joined(separator: " ")
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for MarginTrim
extension MarginTrim {
    /// Creates a margin-trim with both block and inline trimming
    public static let all = MarginTrim.edges([.blockStart, .blockEnd, .inlineStart, .inlineEnd])
    
    /// Creates a margin-trim with custom edge settings
    ///
    /// - Parameter edges: The edges to trim
    /// - Returns: A margin-trim with the specified edges
    public static func trim(_ edges: Edge...) -> MarginTrim {
        .edges(edges)
    }
}
