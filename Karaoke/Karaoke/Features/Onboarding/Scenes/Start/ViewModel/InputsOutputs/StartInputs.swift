//
//  StartInputs.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 21/12/2022.
//

import Combine

struct StartInputs {
    
    // MARK: - Inputs
    func continueButton() {
        continuePressedSubject.send()
    }
    
    private let continuePressedSubject: PassthroughSubject<Void, Never>
    
    // MARK: - Initialization
    init(subjects: StartInputsSubjects) {
        continuePressedSubject = subjects.continuePressedSubject
    }
}

