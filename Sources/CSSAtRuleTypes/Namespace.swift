import Foundation
import CSSTypeTypes

/// Represents a CSS @namespace at-rule.
///
/// The @namespace at-rule is used to define XML namespaces to be used in a CSS style sheet.
/// It's particularly useful when dealing with documents containing multiple namespaces,
/// such as HTML with inline SVG or MathML, or XML that mixes multiple vocabularies.
///
/// Examples:
/// ```swift
/// // Default namespace
/// Namespace.default(.url("http://www.w3.org/1999/xhtml"))
///
/// // Prefixed namespace
/// Namespace.prefixed("svg", .url("http://www.w3.org/2000/svg"))
///
/// // Using string literal
/// Namespace.default("http://www.w3.org/1999/xhtml")
/// ```
public struct Namespace: AtRule {
    public static let identifier: String = "namespace"
    
    public var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// Creates a default namespace with the specified namespace URI.
    /// @namespace url(XML-namespace-URL);
    public static func `default`(_ uri: NamespaceURI) -> Namespace {
        Namespace(rawValue: "@namespace \(uri.rawValue);")
    }
    
    /// Creates a default namespace with the specified namespace URI as a string.
    /// @namespace "XML-namespace-URL";
    public static func `default`(_ uri: String) -> Namespace {
        Namespace(rawValue: "@namespace \"\(uri)\";")
    }
    
    /// Creates a prefixed namespace with the specified prefix and namespace URI.
    /// @namespace prefix url(XML-namespace-URL);
    public static func prefixed(_ prefix: String, _ uri: NamespaceURI) -> Namespace {
        Namespace(rawValue: "@namespace \(prefix) \(uri.rawValue);")
    }
    
    /// Creates a prefixed namespace with the specified prefix and namespace URI as a string.
    /// @namespace prefix "XML-namespace-URL";
    public static func prefixed(_ prefix: String, _ uri: String) -> Namespace {
        Namespace(rawValue: "@namespace \(prefix) \"\(uri)\";")
    }
}

extension Namespace {
    /// Represents a URI for a namespace.
    public enum NamespaceURI: Hashable, Sendable {
        /// A URL-based namespace URI.
        case url(String)
        
        /// The raw value representation in CSS.
        public var rawValue: String {
            switch self {
            case .url(let url):
                return "url(\(url))"
            }
        }
    }
    
    /// Common XML namespaces used in web development
    public struct CommonNamespaces {
        /// XHTML namespace: http://www.w3.org/1999/xhtml
        public static let xhtml = "http://www.w3.org/1999/xhtml"
        
        /// SVG namespace: http://www.w3.org/2000/svg
        public static let svg = "http://www.w3.org/2000/svg"
        
        /// MathML namespace: http://www.w3.org/1998/Math/MathML
        public static let mathML = "http://www.w3.org/1998/Math/MathML"
        
        /// XLink namespace: http://www.w3.org/1999/xlink
        public static let xlink = "http://www.w3.org/1999/xlink"
    }
}
