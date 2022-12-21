//
//  StartOutputs.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 21/12/2022.
//

import Combine

struct StartOutputs {
    
    // MARK: - Outputs
    var continuePressedPublisher: AnyPublisher<Void, Never> {
        continuePressedSubject.eraseToAnyPublisher()
    }
    private let continuePressedSubject: PassthroughSubject<Void, Never>
    
    // MARK: - Initialization
    init(subjects: StartOutputsSubjects) {
        continuePressedSubject = subjects.continuePressedSubject
    }
}
