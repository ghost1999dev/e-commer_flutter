# Documentación del Login BLoC

## ¿Qué es BLoC?

BLoC (Business Logic Component) es un patrón de arquitectura para Flutter que permite separar la lógica de negocio de la interfaz de usuario, facilitando la reutilización y el testeo del código.

---

## Estructura del Login BLoC

### 1. `LoginBlocCubit`

Clase que gestiona el estado y la validación del formulario de login.

#### Principales responsabilidades:

- **Controladores de estado:**  
  Utiliza `BehaviorSubject` para manejar los valores y errores de los campos de email y contraseña.
- **Streams:**  
  Expone streams para que la UI pueda reaccionar a los cambios en los campos.
- **Validaciones:**  
  Valida en tiempo real el email y la contraseña, mostrando errores si no cumplen los requisitos mínimos.
- **Validación de formulario:**  
  Usa `Rx.combineLatest2` para habilitar el botón de login solo cuando ambos campos son válidos.
- **Obtener información:**  
  Permite acceder a los valores actuales de email y contraseña.

---

### 2. Uso en la UI (`LoginPage`)

- **StreamBuilder:**  
  Los campos de email y contraseña usan `StreamBuilder` para escuchar los streams y mostrar mensajes de error en tiempo real.
- **Botón de login:**  
  También usa un `StreamBuilder` para habilitar o deshabilitar el botón según la validez del formulario.

---

## Ejemplo de flujo

1. El usuario escribe su email y contraseña.
2. Cada cambio se envía al BLoC mediante los métodos `changeEmail` y `changePassword`.
3. El BLoC valida los datos y actualiza los streams.
4. La UI reacciona automáticamente mostrando errores o habilitando el botón de login.

---

## Ventajas

- Separación clara entre lógica y presentación.
- Validaciones reactivas y en tiempo real.
- Código más limpio y fácil de mantener.

---