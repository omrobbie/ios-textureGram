//
//  StoryNode.swift
//  textureOnboarding
//
//  Created by Wendy Liga on 19/09/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import AsyncDisplayKit

class StoryNode: ASCollectionNode{
    let stories: [Story]

    init(stories: [Story]) {
        self.stories = stories

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)

        style.width = ASDimension(unit: .fraction, value: 1)
        style.height = ASDimension(unit: .points, value: 75)

        delegate = self
        dataSource = self

        view.showsHorizontalScrollIndicator = false
    }
}

extension StoryNode: ASCollectionDelegate, ASCollectionDataSource {
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }

    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }

    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        guard stories.count > indexPath.row else {return { ASCellNode() }}
        let story = stories[indexPath.row]

        let cellNodeBlock = { () -> ASCellNode in
            return StoryCell(story: story)
        }

        return cellNodeBlock
    }
}
