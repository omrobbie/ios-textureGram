//
//  ActionNode.swift
//  textureOnboarding
//
//  Created by Wendy Liga on 19/09/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import AsyncDisplayKit

class ActionNode: ASDisplayNode {

    // MARK: - Nodes

    private let loveButton: ASImageNode
    private let commentButton: ASImageNode
    private let shareButton: ASImageNode

    override init() {
        let imageSize: CGFloat = 16

        loveButton = ASImageNode()
        loveButton.image = #imageLiteral(resourceName: "love")
        loveButton.style.preferredSize = CGSize(width: imageSize, height: imageSize)

        commentButton = ASImageNode()
        commentButton.image = #imageLiteral(resourceName: "comment")
        commentButton.style.preferredSize = CGSize(width: imageSize, height: imageSize)

        shareButton = ASImageNode()
        shareButton.image = #imageLiteral(resourceName: "share")
        shareButton.style.preferredSize = CGSize(width: imageSize, height: imageSize)

        super.init()

        self.automaticallyManagesSubnodes = true
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let mainStack = ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .start, children: [loveButton, commentButton, shareButton])

        let padding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8), child: mainStack)

        return padding
    }
}
