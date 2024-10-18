//  Created by Valerie N. Prinz on 17/10/2024.

import Foundation
import SwiftData

class EntityService<T: PersistentModel> {
    var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func delete(_ entity: T) throws {
        modelContext.delete(entity)
        try modelContext.save()
    }
}
