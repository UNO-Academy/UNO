//
//  ActiveExperiences.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 17/11/22.
//

import Foundation

struct ActiveExperiences {
    var toDoExperiences: [Experience]
    var doneExperiences: [Experience]

    init(toDo: [Experience], done: [Experience]) {
        self.toDoExperiences = toDo
        self.doneExperiences = done
    }
}
