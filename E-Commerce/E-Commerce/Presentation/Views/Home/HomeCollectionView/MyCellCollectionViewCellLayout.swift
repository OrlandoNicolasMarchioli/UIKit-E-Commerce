import UIKit

class MyCellCollectionViewCellLayout: UICollectionViewLayout {
    
    private let itemSize = CGSize(width: 273, height: 250)
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through each item in the collection view
        for section in 0..<collectionView!.numberOfSections {
            for item in 0..<collectionView!.numberOfItems(inSection: section) {
                let indexPath = IndexPath(item: item, section: section)
            
                if let attributes = layoutAttributesForItem(at: indexPath) {
                    if attributes.frame.intersects(rect) {
                        layoutAttributes.append(attributes)
                    }
                }
            }
        }
        
        return layoutAttributes
    }
    
    // Override this method to provide layout attributes for a specific item
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        
        // Calculate the origin for the item based on its index path and item size
        let x = CGFloat(indexPath.item) * (itemSize.width + 20)
        let y: CGFloat = 0
        
        attributes.frame = CGRect(x: x, y: y, width: itemSize.width, height: itemSize.height)
        
        return attributes
    }
    
    // Override this method to return the content size of the entire collection view
    override var collectionViewContentSize: CGSize {
        let numberOfItems = collectionView?.numberOfItems(inSection: 0) ?? 0
        let contentWidth = CGFloat(numberOfItems) * (itemSize.width + 20)
        let contentHeight: CGFloat = itemSize.height
        
        return CGSize(width: contentWidth, height: contentHeight)
    }
}
