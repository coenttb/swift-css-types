import Foundation
import CSSTypeTypes

//
//  PositionVisibility.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation

/// The CSS `position-visibility` property enables conditionally hiding an anchor-positioned element
/// based on certain conditions.
///
/// This property allows you to control when anchor-positioned elements should be hidden, for instance,
/// when they overflow their containing element or when their anchor element is not visible.
///
/// Example:
/// ```swift
/// .positionVisibility(.always)         // position-visibility: always
/// .positionVisibility(.anchorsVisible) // position-visibility: anchors-visible
/// .positionVisibility(.noOverflow)     // position-visibility: no-overflow
/// ```
///
/// - Note: This is an experimental property and may not be fully supported across all browsers.
///
/// - SeeAlso: [MDN Web Docs on position-visibility](https://developer.mozilla.org/en-US/docs/Web/CSS/position-visibility)
public enum PositionVisibility: Property {
    public static let property: String = "position-visibility"
    
    /// The positioned element is always displayed
    case always
    
    /// Element is hidden if its anchor is completely hidden
    case anchorsVisible
    
    /// Element is hidden if it starts to overflow its containing element or viewport
    case noOverflow
    
    /// Multiple visibility conditions combined
    case combined([Condition])
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    /// Individual visibility conditions
    public enum Condition: String, Sendable, Equatable {
        /// Element is hidden if its anchor is completely hidden
        case anchorsVisible = "anchors-visible"
        
        /// Element is hidden if it starts to overflow its containing element or viewport
        case noOverflow = "no-overflow"
    }
    
    public var description: String {
        switch self {
        case .always:
            return "always"
        case .anchorsVisible:
            return "anchors-visible"
        case .noOverflow:
            return "no-overflow"
        case .combined(let conditions):
            return conditions.map { $0.rawValue }.joined(separator: " ")
        case .global(let global):
            return global.description
        }
    }
}
