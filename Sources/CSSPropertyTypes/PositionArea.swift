//
//  PositionArea.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `position-area` property enables an anchor-positioned element to be positioned 
/// relative to the edges of its associated anchor element.
///
/// This property places the positioned element on one or more tiles of an implicit 3x3 grid,
/// where the anchoring element is in the center cell.
///
/// Example:
/// ```swift
/// .positionArea(.none)                         // position-area: none
/// .positionArea(.vertical(.top), .horizontal(.left))   // position-area: top left
/// .positionArea(.vertical(.bottom), .horizontal(.spanAll))  // position-area: bottom span-all
/// .positionArea(.logical(.blockStart), .logical(.inlineEnd))  // position-area: block-start inline-end
/// ```
///
/// - Note: This is an experimental property and may not be fully supported across all browsers.
///
/// - SeeAlso: [MDN Web Docs on position-area](https://developer.mozilla.org/en-US/docs/Web/CSS/position-area)
public enum PositionArea: Property {
    public static let property: String = "position-area"
    
    /// No position area is set
    case none
    
    /// Combination of vertical and horizontal physical positions
    case physical(Physical, Physical)
    
    /// Combination of vertical and horizontal logical positions
    case logical(Logical, Logical)
    
    /// Combination of self-logical positions
    case selfLogical(SelfLogical, SelfLogical)
    
    /// Combination of start/end/center positions
    case startEnd(StartEnd, StartEnd)
    
    /// Combination of self-start/end/center positions
    case selfStartEnd(SelfStartEnd, SelfStartEnd)
    
    /// Single keyword value (implied second value)
    case single(AreaKeyword)
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    /// Vertical (top/bottom) and horizontal (left/right) physical positions
    public enum Physical: String, Sendable, Hashable {
        // Vertical (Y-axis) positions
        case top
        case center
        case bottom
        case spanTop = "span-top"
        case spanBottom = "span-bottom"
        case yStart = "y-start"
        case yEnd = "y-end"
        case spanYStart = "span-y-start"
        case spanYEnd = "span-y-end"
        case ySelfStart = "y-self-start"
        case ySelfEnd = "y-self-end"
        case spanYSelfStart = "span-y-self-start"
        case spanYSelfEnd = "span-y-self-end"
        
        // Horizontal (X-axis) positions
        case left
        case right
        case spanLeft = "span-left"
        case spanRight = "span-right"
        case xStart = "x-start"
        case xEnd = "x-end"
        case spanXStart = "span-x-start"
        case spanXEnd = "span-x-end"
        case xSelfStart = "x-self-start"
        case xSelfEnd = "x-self-end"
        case spanXSelfStart = "span-x-self-start"
        case spanXSelfEnd = "span-x-self-end"
        
        // Span all positions (both vertical and horizontal)
        case spanAll = "span-all"
    }
    
    /// Logical block and inline positions
    public enum Logical: String, Sendable, Hashable {
        // Block direction positions
        case blockStart = "block-start"
        case center
        case blockEnd = "block-end"
        case spanBlockStart = "span-block-start"
        case spanBlockEnd = "span-block-end"
        
        // Inline direction positions
        case inlineStart = "inline-start"
        case inlineEnd = "inline-end"
        case spanInlineStart = "span-inline-start"
        case spanInlineEnd = "span-inline-end"
        
        // Span all positions (both block and inline)
        case spanAll = "span-all"
    }
    
    /// Self-logical block and inline positions
    public enum SelfLogical: String, Sendable, Hashable {
        // Self-block direction positions
        case selfBlockStart = "self-block-start"
        case center
        case selfBlockEnd = "self-block-end"
        case spanSelfBlockStart = "span-self-block-start"
        case spanSelfBlockEnd = "span-self-block-end"
        
        // Self-inline direction positions
        case selfInlineStart = "self-inline-start"
        case selfInlineEnd = "self-inline-end"
        case spanSelfInlineStart = "span-self-inline-start"
        case spanSelfInlineEnd = "span-self-inline-end"
        
        // Span all positions (both self-block and self-inline)
        case spanAll = "span-all"
    }
    
    /// Start/end/center positions
    public enum StartEnd: String, Sendable, Hashable {
        case start
        case center
        case end
        case spanStart = "span-start"
        case spanEnd = "span-end"
        case spanAll = "span-all"
    }
    
    /// Self-start/end/center positions
    public enum SelfStartEnd: String, Sendable, Hashable {
        case selfStart = "self-start"
        case center
        case selfEnd = "self-end"
        case spanSelfStart = "span-self-start"
        case spanSelfEnd = "span-self-end"
        case spanAll = "span-all"
    }
    
    /// Position area keywords that can be used as a single value
    public enum AreaKeyword: String, Sendable, Hashable {
        // Physical positions
        case top
        case bottom
        case left
        case right
        
        // Logical positions
        case blockStart = "block-start"
        case blockEnd = "block-end"
        case inlineStart = "inline-start"
        case inlineEnd = "inline-end"
        
        // Self-logical positions
        case selfBlockStart = "self-block-start"
        case selfBlockEnd = "self-block-end"
        case selfInlineStart = "self-inline-start"
        case selfInlineEnd = "self-inline-end"
        
        // Start/end positions
        case start
        case end
        case selfStart = "self-start"
        case selfEnd = "self-end"
        
        // Center position
        case center
        
        // Span all positions
        case spanAll = "span-all"
    }
    
    /// Container for creating vertical/horizontal position combinations
    public enum Vertical {
        /// Top position
        case top
        
        /// Bottom position
        case bottom
        
        /// Center position
        case center
        
        /// Span from top to center
        case spanTop
        
        /// Span from center to bottom
        case spanBottom
        
        /// Y-start position
        case yStart
        
        /// Y-end position
        case yEnd
        
        /// Span all vertical positions
        case spanAll
        
        /// Convert to a Physical value
        fileprivate var physical: Physical {
            switch self {
            case .top: return .top
            case .bottom: return .bottom
            case .center: return .center
            case .spanTop: return .spanTop
            case .spanBottom: return .spanBottom
            case .yStart: return .yStart
            case .yEnd: return .yEnd
            case .spanAll: return .spanAll
            }
        }
    }
    
    /// Container for creating vertical/horizontal position combinations
    public enum Horizontal {
        /// Left position
        case left
        
        /// Right position
        case right
        
        /// Center position
        case center
        
        /// Span from left to center
        case spanLeft
        
        /// Span from center to right
        case spanRight
        
        /// X-start position
        case xStart
        
        /// X-end position
        case xEnd
        
        /// Span all horizontal positions
        case spanAll
        
        /// Convert to a Physical value
        fileprivate var physical: Physical {
            switch self {
            case .left: return .left
            case .right: return .right
            case .center: return .center
            case .spanLeft: return .spanLeft
            case .spanRight: return .spanRight
            case .xStart: return .xStart
            case .xEnd: return .xEnd
            case .spanAll: return .spanAll
            }
        }
    }
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .physical(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"
        case .logical(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"
        case .selfLogical(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"
        case .startEnd(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"
        case .selfStartEnd(let v, let h):
            return "\(v.rawValue) \(h.rawValue)"
        case .single(let keyword):
            return keyword.rawValue
        case .global(let global):
            return global.description
        }
    }
    
    /// Create a position-area with vertical and horizontal positions
    public static func vertical(_ vertical: Vertical, _ horizontal: Horizontal) -> PositionArea {
        .physical(vertical.physical, horizontal.physical)
    }
//    
//    /// Create a position-area with logical block and inline positions
//    public static func logical(block: Logical, inline: Logical) -> PositionArea {
//        .logical(block, inline)
//    }
}
