# Juego de Piedra, Papel o Tijera

Este proyecto es una implementación en Swift del clásico juego de Piedra, Papel o Tijera. El juego permite a un jugador humano competir contra la máquina. El objetivo es jugar varias rondas hasta que el jugador elija salir del juego.

## Descripción del Código

El código está dividido en varias funciones principales:

- **`showWelcomeAndUserOptionsGame()`**: Muestra un mensaje de bienvenida y las opciones disponibles para el juego.
- **`readUserChoice()`**: Lee la entrada del usuario y la convierte en un valor entero válido que representa la opción seleccionada.
- **`generateComputerChoice()`**: Genera una opción aleatoria para la máquina y la muestra.
- **`evaluateMove(userOptionInt:computerChoiceInt:)`**: Compara la opción del usuario con la opción de la máquina y determina el resultado del juego (empate, victoria del usuario o victoria de la máquina).
- **`displayResult(evaluatedMove:)`**: Muestra el resultado del juego basado en el valor evaluado.
- **`gameLoop()`**: Controla el flujo del juego, incluyendo la interacción con el usuario y la generación de opciones, repitiendo el juego hasta que el usuario elija salir.
- **`main()`**: Función principal que inicia el juego.

## Requisitos

- macOS con Xcode o un compilador de Swift instalado.
- Terminal para ejecutar el programa.

## Instrucciones de Uso

1. **Clona el Repositorio**: Si aún no tienes el código, clónalo usando Git.
    ```bash
    git clone https://github.com/javiermmdev/PiedraPapelTijera.git
    ```

2. **Navega al Directorio del Proyecto**:
    ```bash
    cd nombre_del_directorio
    ```

3. **Compila y Ejecuta el Código**:
   - Puedes abrir el proyecto en Xcode y ejecutar el archivo `main.swift`.
   - Alternativamente, usa la Terminal para compilar y ejecutar el archivo:
     ```bash
     swift main.swift
     ```

4. **Juega**:
   - Sigue las instrucciones en la consola para seleccionar una opción (Piedra, Papel o Tijera) y ver el resultado del juego.
   - Puedes continuar jugando hasta que elijas la opción de salida (3).

## Funcionalidad

- **Opciones del Juego**: Piedra, Papel, Tijera y Salir.
- **Resultado**:
  - **Empate**: Cuando el usuario y la máquina eligen la misma opción.
  - **Victoria del Usuario**: Cuando la opción del usuario vence a la opción de la máquina.
  - **Victoria de la Máquina**: Cuando la opción de la máquina vence a la opción del usuario.

## Ejemplo de Ejecución

```plaintext
Bienvenido al juego de Piedra, Papel o Tijera
Opciones disponibles para el juego:
Piedra = 0
Papel = 1
Tijera = 2
Exit = 3
Escribe tu opción
0
Tu opción ha sido Piedra
La opción de la máquina ha sido Tijera
Has ganado
Iniciamos una nueva partida.
----------------------------
