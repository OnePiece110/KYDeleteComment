// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KYDeleteComment",
    products: [
      .library(name: "SwiftSyntax", type: .static, targets: ["SwiftSyntax"]),
      .library(name: "SwiftSyntaxParser", type: .static, targets: ["SwiftSyntaxParser"]),
      .library(name: "SwiftSyntaxBuilder", type: .static, targets: ["SwiftSyntaxBuilder"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
          name: "_CSwiftSyntax",
          exclude: [
            "README.md"
          ]
        ),
        .target(
          name: "SwiftSyntax",
          dependencies: ["_CSwiftSyntax"],
          exclude: [
            "SyntaxFactory.swift.gyb",
            "SyntaxTraits.swift.gyb",
            "Trivia.swift.gyb",
            "Misc.swift.gyb",
            "SyntaxRewriter.swift.gyb",
            "SyntaxEnum.swift.gyb",
            "SyntaxClassification.swift.gyb",
            "SyntaxBuilders.swift.gyb",
            "TokenKind.swift.gyb",
            "SyntaxVisitor.swift.gyb",
            "SyntaxCollections.swift.gyb",
            "SyntaxBaseNodes.swift.gyb",
            "SyntaxAnyVisitor.swift.gyb",
            "SyntaxNodes.swift.gyb.template",
            "SyntaxKind.swift.gyb",
          ]
        ),
        .target(
          name: "SwiftSyntaxBuilder",
          dependencies: ["SwiftSyntax"],
          exclude: [
            "gyb_helpers",
            "ExpressibleAsProtocols.swift.gyb",
            "BuildableBaseProtocols.swift.gyb",
            "BuildableCollectionNodes.swift.gyb",
            "BuildableNodes.swift.gyb",
            "ResultBuilders.swift.gyb",
            "Tokens.swift.gyb",
            "TokenSyntax.swift.gyb",
          ]
        ),
        .target(
          name: "SwiftSyntaxParser",
          dependencies: ["SwiftSyntax"],
          exclude: [
            "NodeDeclarationHash.swift.gyb"
          ]
        ),
        .executableTarget(
            name: "KYDeleteComment",
            dependencies: ["SwiftSyntax", "SwiftSyntaxParser"]),
        .testTarget(
            name: "KYDeleteCommentTests",
            dependencies: ["KYDeleteComment"]),
    ]
)
