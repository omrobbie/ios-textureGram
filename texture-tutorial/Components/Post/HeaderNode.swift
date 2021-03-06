//
//  HeaderNode.swift
//  textureOnboarding
//
//  Created by Wendy Liga on 19/09/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import AsyncDisplayKit

class HeaderNode: ASDisplayNode {
    // MARK: - Values

    private let post: Post

    // MARK: - Nodes

    private let profilePicture: ASImageNode
    private let profileName: ASTextNode
    private let postLocation: ASTextNode?

    init(post: Post) {
        let imageSize:CGFloat = 32

        self.post = post

        profilePicture = ASImageNode()
        profilePicture.image = post.user.userPhoto
        profilePicture.style.preferredSize = CGSize(width: imageSize, height: imageSize)
        profilePicture.cornerRadius = imageSize/2

        profileName = ASTextNode()
        profileName.attributedText = NSAttributedString.bold(post.user.username)

        if let location = post.location {
            postLocation = ASTextNode()
            postLocation?.attributedText = NSAttributedString.subtitle(location)
        } else {
            postLocation = nil
        }

        super.init()

        automaticallyManagesSubnodes = true
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var leftStackComponents = [ASLayoutElement]()
        leftStackComponents.append(profileName)

        if let postLocation = self.postLocation {
            leftStackComponents.append(postLocation)
        }

        let leftStack = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: leftStackComponents)

        let mainStack = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [profilePicture, leftStack])

        let padding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 4, right: 8), child: mainStack)

        return padding
    }
}
