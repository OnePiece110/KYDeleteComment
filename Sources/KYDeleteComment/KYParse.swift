//
//  File.swift
//  
//
//  Created by Keyon on 2023/2/14.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxParser

struct Parser {
    
    static func parse(url: URL) throws {
        let parsed = try SyntaxParser.parse(url)
        let renamed = DeleteComment().visit(parsed)
        let renamedSource = renamed.description
        try renamedSource.write(to: url, atomically: true, encoding: .utf8)
    }
}

private class DeleteComment: SyntaxRewriter {
    override func visitChildren<SyntaxType>(_ node: SyntaxType) -> SyntaxType where SyntaxType : SyntaxProtocol {
        var resultNode = node._syntaxNode
        resultNode.leadingTrivia?.removeNewLines()
        resultNode.trailingTrivia?.removeNewLines()
        return super.visitChildren(SyntaxType(resultNode)!)
    }
}
