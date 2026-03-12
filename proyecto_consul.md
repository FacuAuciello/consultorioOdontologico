# Proyecto: Consultorio Odontológico

## Descripción General
Sistema web para la gestión de un consultorio odontológico. Permite administrar pacientes, turnos y fichas médicas a través de una interfaz moderna y clara.

---

## Stack Tecnológico

| Capa | Tecnología |
|------|-----------|
| Backend | Java (JDK 17+), Java EE / Jakarta EE |
| Web | Servlets, JSP |
| Persistencia | JPA (Hibernate como provider) |
| Base de datos | MySQL (gestionada via phpMyAdmin) |
| Servidor | Apache Tomcat |
| Build | Maven |
| IDE | IntelliJ IDEA |
| Frontend | HTML5, CSS3, JavaScript (plantilla estática integrada via JSP) |
| Asistente IA | Claude Code (en terminal de IntelliJ) |

---

## Arquitectura del Proyecto

```
consultorio-odontologico/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/consultorio/
│   │   │       ├── model/          # Entidades JPA
│   │   │       ├── dao/            # Capa de acceso a datos (DAO)
│   │   │       ├── service/        # Lógica de negocio
│   │   │       ├── servlet/        # Controladores (Servlets)
│   │   │       └── util/           # Clases utilitarias (EMF, helpers)
│   │   ├── resources/
│   │   │   └── META-INF/
│   │   │       └── persistence.xml # Config JPA / datasource
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── web.xml
│   │       ├── views/              # JSP por módulo
│   │       │   ├── admin/
│   │       │   ├── pacientes/
│   │       │   └── turnos/
│   │       ├── assets/
│   │       │   ├── css/
│   │       │   ├── js/
│   │       │   └── img/
│   │       └── index.jsp
└── pom.xml
```

---

## Entidades del Dominio

### 1. `Admin` (Secretaria)
Representa al usuario administrativo del sistema.

```java
// Campos principales
Long id
String nombre
String apellido
String email
String password       // hasheada
String rol            // "ADMIN" (extensible a futuro)
LocalDateTime creadoEn
```

**Responsabilidades:**
- Iniciar sesión en el sistema
- Dar de alta / baja pacientes
- Crear, modificar y cancelar turnos
- Ver fichas médicas

---

### 2. `Paciente`
Persona atendida en el consultorio.

```java
// Datos personales
Long id
String nombre
String apellido
String dni
String telefono
String email
LocalDate fechaNacimiento
String direccion
LocalDateTime creadoEn
boolean activo          // alta/baja lógica

// Relaciones
FichaMedica fichaMedica   // @OneToOne
List<Turno> turnos        // @OneToMany
```

---

### 3. `FichaMedica`
Historial clínico del paciente.

```java
Long id
Paciente paciente           // @OneToOne
String obraSocial
String nroAfiliado
String alergias
String medicacionActual
String antecedentesClinicosGenerales
String notasOdontologicas   // observaciones del dentista
LocalDateTime ultimaActualizacion
```

---

### 4. `Turno`
Registro de un turno agendado.

```java
Long id
LocalDate fecha
LocalTime horario
String motivo               // "Consulta", "Limpieza", "Extracción", etc.
String estado               // PENDIENTE | CONFIRMADO | CANCELADO | REALIZADO
Paciente paciente           // @ManyToOne
Admin creadoPor             // @ManyToOne
String observaciones
LocalDateTime creadoEn
```

---

## Flujos Principales

### Autenticación
1. Admin ingresa email + password en `/login`
2. Servlet valida contra BD → crea `HttpSession`
3. Redirige a dashboard
4. Logout destruye la sesión

### Gestión de Pacientes
- Listar todos → `/pacientes` (GET)
- Nuevo paciente → `/pacientes/nuevo` (GET/POST)
- Ver detalle + ficha → `/pacientes/detalle?id=X`
- Editar → `/pacientes/editar?id=X`
- Baja lógica → `/pacientes/baja?id=X` (no elimina, pone `activo=false`)

### Gestión de Turnos
- Ver agenda del día/semana → `/turnos`
- Nuevo turno → `/turnos/nuevo` (selecciona paciente + fecha + hora)
- Cambiar estado → `/turnos/estado`
- Cancelar turno → `/turnos/cancelar?id=X`

---

## Base de Datos (MySQL via phpMyAdmin)

**Nombre sugerido de la BD:** `consultorio_odontologico`

**Tablas esperadas (generadas por JPA/Hibernate):**
- `admins`
- `pacientes`
- `fichas_medicas`
- `turnos`

**persistence.xml** — unidad de persistencia: `consultorioPU`

```xml
<!-- Ejemplo de configuración -->
<persistence-unit name="consultorioPU" transaction-type="RESOURCE_LOCAL">
    <provider>org.hibernate.jpa.HibernatePersistenceProvider</provider>
    <properties>
        <property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/consultorio_odontologico"/>
        <property name="javax.persistence.jdbc.user" value="root"/>
        <property name="javax.persistence.jdbc.password" value=""/>
        <property name="javax.persistence.jdbc.driver" value="com.mysql.cj.jdbc.Driver"/>
        <property name="hibernate.dialect" value="org.hibernate.dialect.MySQL8Dialect"/>
        <property name="hibernate.hbm2ddl.auto" value="update"/>
        <property name="hibernate.show_sql" value="true"/>
    </properties>
</persistence-unit>
```

---

## Frontend / Estética

**Estilo:** Moderno-clásico. Paleta de colores sugerida: azul marino (`#1a3c5e`), blanco, gris claro, y un acento en celeste (`#4a90d9`). Tipografía limpia (Inter o Roboto).

**Estructura de vistas JSP:**
- `layout/header.jsp` — navbar con logo + menú
- `layout/sidebar.jsp` — navegación lateral (Inicio, Pacientes, Turnos, Ficha Médica)
- `layout/footer.jsp`

**Páginas principales:**
| Vista | Descripción |
|-------|-------------|
| `index.jsp` / Dashboard | Resumen: turnos del día, últimos pacientes |
| `pacientes/lista.jsp` | Tabla paginada con buscador |
| `pacientes/formulario.jsp` | Alta / edición |
| `pacientes/detalle.jsp` | Datos + ficha médica integrada |
| `turnos/agenda.jsp` | Vista de turnos (tabla o calendario) |
| `turnos/formulario.jsp` | Nuevo turno / edición |
| `login.jsp` | Pantalla de acceso |

---

## Convenciones de Código

- **Paquete base:** `com.consultorio`
- **Servlets:** sufijo `Servlet` → ej. `PacienteServlet`, `TurnoServlet`
- **DAOs:** sufijo `DAO` → ej. `PacienteDAO`, `TurnoDAO`
- **Servicios:** sufijo `Service` → ej. `PacienteService`
- **Entidades:** nombre en singular, PascalCase → `Paciente`, `Turno`
- **JSPs:** nombre en minúscula con guión → `lista-pacientes.jsp`
- **EntityManagerFactory:** singleton en `util/JPAUtil.java`

---

## Estado Actual del Proyecto

> Actualizar esta sección a medida que avanza el desarrollo.

- [ ] Estructura Maven creada
- [ ] Entidades JPA definidas
- [ ] DAOs implementados
- [ ] Servlets de Paciente
- [ ] Servlets de Turno
- [ ] Autenticación / Sesión
- [ ] Frontend / plantilla HTML integrada
- [ ] Pruebas con phpMyAdmin

---

## Notas para Claude Code

- Siempre respetar la arquitectura en capas: Servlet → Service → DAO → JPA
- No usar Spring; el proyecto es Java EE puro con Servlets y JPA
- Las vistas son JSP, no Thymeleaf ni ningún template engine externo
- El servidor es Tomcat; no usar EJBs ni CDI
- Ante dudas sobre mapeo JPA, preferir anotaciones sobre XML
- El proyecto se construye con Maven; respetar el `pom.xml` existente
- Comentar el código en español si el contexto lo indica