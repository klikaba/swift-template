//
//  ModelMapper.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/31/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import RealmSwift

class ModelMapper<ApiModel, DBModel> {
    func toDatabase(apiModel: ApiModel) -> DBModel? {
        return nil
    }

    func toApi(dbModel: DBModel) -> ApiModel? {
        return nil
    }

    func toDatabaseArray(apiModels: [ApiModel]) -> [DBModel] {
        return apiModels.map({ (model) -> DBModel? in
            self.toDatabase(apiModel: model)
        }).compactMap { $0 }
    }
}
