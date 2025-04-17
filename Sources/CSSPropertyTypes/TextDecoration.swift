import Foundation
import CSSTypeTypes


public enum TextDecoration: Property {
    public static let property: String = "text-decoration"
    
    /// No text decoration
    case none
    
    /// Specified text decoration configuration
    case decoration(TextDecorationValue)
    
    /// Single line decoration
    case line(TextDecorationLine,
              style: TextDecorationStyle? = nil,
              color: Color? = nil,
              thickness: LengthPercentage? = nil)
    
    /// Multiple line decorations
    case lines([TextDecorationLine],
               style: TextDecorationStyle? = nil,
               color: Color? = nil,
               thickness: LengthPercentage? = nil)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

extension TextDecoration: CustomStringConvertible {
    public var description: String {
        switch self {
        case .none:
            return "none"
            
        case .decoration(let value):
            return value.description
            
        case .line(let line, let style, let color, let thickness):
            let value = TextDecorationValue(line, style: style, color: color, thickness: thickness)
            return value.description
            
        case .lines(let lines, let style, let color, let thickness):
            let value = TextDecorationValue(lines, style: style, color: color, thickness: thickness)
            return value.description
            
        case .global(let global):
            return global.description
        }
    }
}

/// Value to represent a text decoration configuration
public struct TextDecorationValue: Sendable, Hashable, CustomStringConvertible {
    /// The line type(s) to apply
    public let lines: [TextDecorationLine]
    
    /// The style of the decoration (optional)
    public let style: TextDecorationStyle?
    
    /// The color of the decoration (optional)
    public let color: Color?
    
    /// The thickness of the decoration (optional)
    public let thickness: LengthPercentage?
    
    /// Create a single-line text decoration
    public init(_ line: TextDecorationLine,
                style: TextDecorationStyle? = nil,
                color: Color? = nil,
                thickness: LengthPercentage? = nil) {
        self.lines = [line]
        self.style = style
        self.color = color
        self.thickness = thickness
    }
    
    /// Create a multi-line text decoration
    public init(_ lines: [TextDecorationLine],
                style: TextDecorationStyle? = nil,
                color: Color? = nil,
                thickness: LengthPercentage? = nil) {
        self.lines = lines
        self.style = style
        self.color = color
        self.thickness = thickness
    }
    
    public var description: String {
        var components: [String] = []
        
        if let style = style {
            components.append(style.description)
        }
        
        let linesString = lines.map { $0.description }.joined(separator: " ")
        components.append(linesString)
        
        if let color = color {
            components.append(color.description)
        }
        
        if let thickness = thickness {
            components.append(thickness.description)
        }
        
        return components.joined(separator: " ")
    }
}
