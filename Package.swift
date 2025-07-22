// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let atRules: Self = "CSSAtRuleTypes"
    static let combinators: Self = "CSSCombinatorTypes"
    static let functions: Self = "CSSFunctionTypes"
    static let properties: Self = "CSSPropertyTypes"
    static let pseudoClasses: Self = "CSSPseudoClassTypes"
    static let pseudoElements: Self = "CSSPseudoElementTypes"
    static let selectors: Self = "CSSSelectorTypes"
    static let css: Self = "CSSTypes"
    static let types: Self = "CSSTypeTypes"
}

extension Target.Dependency {
    static var atRules: Self { .target(name: .atRules) }
    static var combinators: Self { .target(name: .combinators) }
    static var functions: Self { .target(name: .functions) }
    static var properties: Self { .target(name: .properties) }
    static var pseudoClasses: Self { .target(name: .pseudoClasses) }
    static var pseudoElements: Self { .target(name: .pseudoElements) }
    static var selectors: Self { .target(name: .selectors) }
    static var css: Self { .target(name: .css) }
    static var types: Self { .target(name: .types) }
}

let package = Package(
    name: "swift-css-types",
    products: [
        .library(name: .atRules, targets: [.atRules]),
        .library(name: .combinators, targets: [.combinators]),
        .library(name: .functions, targets: [.functions]),
        .library(name: .pseudoClasses, targets: [.pseudoClasses]),
        .library(name: .pseudoElements, targets: [.pseudoElements]),
        .library(name: .selectors, targets: [.selectors]),
        .library(name: .css, targets: [.css]),
        .library(name: .types, targets: [.types]),
        .library(name: .properties, targets: [.properties]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: .atRules,
            dependencies: [.types, .properties]
        ),
        .testTarget(
            name: .atRules.tests,
            dependencies: [.atRules]
        ),
        .target(
            name: .combinators,
            dependencies: []
        ),
        .testTarget(
            name: .combinators.tests,
            dependencies: [.combinators]
        ),
        .target(
            name: .functions,
            dependencies: []
        ),
        .testTarget(
            name: .functions.tests,
            dependencies: [.functions]
        ),
        .target(
            name: .pseudoClasses,
            dependencies: []
        ),
        .testTarget(
            name: .pseudoClasses.tests,
            dependencies: [.pseudoClasses]
        ),
        .target(
            name: .pseudoElements,
            dependencies: []
        ),
        .testTarget(
            name: .pseudoElements.tests,
            dependencies: [.pseudoElements]
        ),
        .target(
            name: .selectors,
            dependencies: []
        ),
        .testTarget(
            name: .selectors.tests,
            dependencies: [.selectors]
        ),
        .target(
            name: .css,
            dependencies: [
                .atRules,
                .combinators,
                .functions,
                .properties,
                .pseudoClasses,
                .pseudoElements,
                .selectors,
            ]
        ),
        .testTarget(
            name: .css.tests,
            dependencies: [.css]
        ),
        .target(
            name: .types,
            dependencies: []
        ),
        .testTarget(
            name: .types.tests,
            dependencies: [.types]
        ),
        .target(
            name: .properties,
            dependencies: [.types]
        ),
        .testTarget(
            name: .properties.tests,
            dependencies: [.properties, .types]
        ),
    ]
)

extension String {
    var tests: String {
        "\(self) Tests"
    }
}
