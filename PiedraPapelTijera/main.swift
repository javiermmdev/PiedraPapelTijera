//
//  main.swift
//  game
//
//  Created by Javier Muñoz 04/09/2024

import Foundation

// MARK: - Enums

/// Enum de las posibles opciones del juego.
/// Conforma a `CaseIterable` para permitir la iteración sobre todos los casos.
enum GameChoice: Int, CaseIterable {
    case Piedra = 0
    case Papel = 1
    case Tijera = 2
    case Exit = 3
}

// MARK: - Utility Functions

/// Convierte una cadena en un entero.
/// - Parameter input: La cadena que se va a convertir en entero.
/// - Returns: Un entero convertido de la cadena, o 4 si la cadena no es válida.
func stringToInt(_ input: String) -> Int {
    if let number = Int(input) {
        return number
    } else {
        return 4 // Indicador de que el texto no es válido
    }
}

// MARK: - Game Functions

/// Muestra la bienvenida al juego y las opciones disponibles.
/// Imprime en la consola los casos del enum `GameChoice` con sus valores enteros.
func showWelcomeAndUserOptionsGame() {
    print("Bienvenido al juego de Piedra, Papel o Tijera")
    print("Opciones disponibles para el juego:")
    
    for choice in GameChoice.allCases {
        print("\(choice) = \(choice.rawValue)")
    }
}

/// Lee la opción ingresada por el usuario y la convierte en un valor entero válido.
/// - Returns: Un entero que representa la opción seleccionada por el usuario.
func readUserChoice() -> Int {
    print("Escribe tu opción")
    
    // Lee la entrada del usuario
    let line = readLine()
    
    // Convierte la entrada a un entero usando `stringToInt`
    let choiceValue = stringToInt(line ?? "")
    
    // Verifica si el valor convertido es válido y pertenece a un caso del enum
    if let choice = GameChoice(rawValue: choiceValue) {
        print("Tu opción ha sido \(choice)")
        return choiceValue  // Devuelve el valor válido del enum
    } else if choiceValue == 4 {
        // Maneja el caso donde el texto no es válido
        print("Opción no válida, vuelve a intentarlo de nuevo.")
        return readUserChoice()  // Llama recursivamente y devuelve el valor
    } else {
        // Maneja cualquier otro caso no contemplado
        print("Opción no válida, vuelve a intentarlo de nuevo.")
        return readUserChoice()  // Llama recursivamente y devuelve el valor
    }
}

/// Genera una opción aleatoria para la máquina.
/// - Returns: Un entero que representa la opción seleccionada aleatoriamente por la máquina.
func generateComputerChoice() -> Int {
    let numberRandom = Int.random(in: 0..<3)
    let computerChoice = GameChoice(rawValue: numberRandom)!
    
    print("La opción de la máquina ha sido \(computerChoice)")
    
    return numberRandom
}

/// Evalúa el resultado del juego comparando la opción del usuario con la opción de la máquina.
/// - Parameters:
///   - userOptionInt: La opción seleccionada por el usuario como un valor entero.
///   - computerChoiceInt: La opción seleccionada por la máquina como un valor entero.
/// - Returns: Un entero que indica el resultado del juego: 0 para empate, 1 si gana el usuario, 2 si gana la máquina.
func evaluateMove(userOptionInt: Int, computerChoiceInt: Int) -> Int {
    // Convertir los enteros a valores del enum `GameChoice`
    let userChoice = GameChoice(rawValue: userOptionInt)!
    let computerChoice = GameChoice(rawValue: computerChoiceInt)!
    
    switch (userChoice, computerChoice) {
    case (let x, let y) where x == y:
        // Empate: devuelve 0
        return 0
    case (.Piedra, .Tijera), (.Papel, .Piedra), (.Tijera, .Papel):
        // Gana el jugador: devuelve 1
        return 1
    case (.Tijera, .Piedra), (.Piedra, .Papel), (.Papel, .Tijera):
        // Gana la máquina: devuelve 2
        return 2
    default:
        // Valor inesperado: devuelve -1
        return -1
    }
}

/// Muestra el resultado del juego en función del valor de `evaluatedMove`.
/// - Parameters:
///   - evaluatedMove: Un entero que representa el resultado del juego: 0 para empate, 1 si gana el usuario, 2 si gana la máquina.
func displayResult(evaluatedMove: Int) {
    switch evaluatedMove {
    case 0:
        print("Habéis empatado")
    case 1:
        print("Has ganado")
    case 2:
        print("Gana la máquina")
    default:
        print("Error en la selección de ganador")
    }
}

// MARK: - Game Loop

/// Controla el flujo del juego, incluyendo la interacción con el usuario y la generación de opciones.
/// Repite el ciclo de juego hasta que el usuario elija la opción de salida.
func gameLoop() {
    var userOptionNumber: Int
    var computerChoiceNumber: Int
    var evaluateMoveNumber: Int
    
    // Mostramos la bienvenida y las posibles opciones del juego
    showWelcomeAndUserOptionsGame()
    repeat {
        // El jugador selecciona una opción posible
        userOptionNumber = readUserChoice()
        if userOptionNumber != GameChoice.Exit.rawValue {
            computerChoiceNumber = generateComputerChoice()
            evaluateMoveNumber = evaluateMove(userOptionInt: userOptionNumber, computerChoiceInt: computerChoiceNumber)
            displayResult(evaluatedMove: evaluateMoveNumber)
            print("Iniciamos una nueva partida.")
            print("----------------------------")
        }
    } while userOptionNumber != GameChoice.Exit.rawValue
    
    print("Fin del juego.")
}

// MARK: - Main Function

/// Función principal que inicia el juego.
/// Llama a `gameLoop` para comenzar el juego.
func main() {
    gameLoop()
}

// MARK: - Program Execution

// Llamada a la función principal para iniciar el juego.
main()
