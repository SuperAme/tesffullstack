//
//  PersonFormView.swift
//  frontend_meneses
//
//  Created by Américo MQ on 27/02/26.
//

import SwiftUI

struct PersonFormView: View {

    @Environment(\.dismiss) var dismiss

    @State var person: Person?

    @State private var nombre = ""
    @State private var apellido = ""
    @State private var fechaNacimiento = Date()
    @State private var puesto = ""
    @State private var sueldo = ""

    private let service = NetworkManager()

    var body: some View {
        NavigationStack {
            Form {
                TextField("Nombre", text: $nombre)
                TextField("Apellido", text: $apellido)
                DatePicker("Fecha Nacimiento",
                           selection: $fechaNacimiento,
                           displayedComponents: .date)
                TextField("Puesto", text: $puesto)
                TextField("Sueldo", text: $sueldo)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle(person == nil ? "Crear Persona" : "Editar Persona")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        Task {
                            await save()
                        }
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                if let person = person {
                    nombre = person.nombre
                    apellido = person.apellido
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd"
                    formatter.locale = Locale(identifier: "en_US_POSIX")
                    if let date = formatter.date(from: person.fechaNacimiento) {
                        fechaNacimiento = date
                    }
                    puesto = person.puesto
                    sueldo = String(person.sueldo)
                }
            }
        }
    }

    func save() async {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")

        let fechaString = formatter.string(from: fechaNacimiento)

        let newPerson = Person(
            id: person?.id,
            nombre: nombre,
            apellido: apellido,
            fechaNacimiento: fechaString,
            puesto: puesto,
            sueldo: Double(sueldo) ?? 0
        )

        try? await service.save(person: newPerson)
        dismiss()
    }
}

#Preview {
    PersonFormView()
}
