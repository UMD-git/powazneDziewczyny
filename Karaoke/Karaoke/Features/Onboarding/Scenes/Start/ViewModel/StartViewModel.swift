import Foundation
import Combine

final class StartViewModel: ObservableObject {
    
    // MARK: - Properties
    let inputs: StartInputs
    let outputs: StartOutputs
    private let subjects: StartSubjects
    
    init(subjects: StartSubjects = StartSubjects()) {
        self.subjects = subjects
        self.inputs = StartInputs(subjects: subjects.inputs)
        self.outputs = StartOutputs(subjects: subjects.outputs)
        setupBindings()
    }
    
    // MARK: - Setup
    private func setupBindings() {
        subjects
            .inputs
            .continuePressedSubject
            .eraseToAnyPublisher()
            .receive(subscriber: AnySubscriber(subjects.outputs.continuePressedSubject))
    }
}
