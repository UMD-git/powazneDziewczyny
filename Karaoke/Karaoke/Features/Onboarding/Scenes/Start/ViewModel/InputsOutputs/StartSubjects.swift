//
//  StartSubjects.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 21/12/2022.
//

import Combine

struct StartSubjects {
    let inputs = StartInputsSubjects()
    let outputs = StartOutputsSubjects()
}

struct StartInputsSubjects {
    let continuePressedSubject = PassthroughSubject<Void, Never>()
}

struct StartOutputsSubjects {
    let continuePressedSubject = PassthroughSubject<Void, Never>()
}
