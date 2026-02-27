# Meneses Backend - Fullstack Móvil

## Descripción

Este proyecto consiste en un backend desarrollado con Spring Boot que implementa un CRUD completo para la entidad **Person**, utilizando MySQL como base de datos y JPA (Hibernate) como ORM.

El sistema permite:

- Crear personas
- Obtener todas las personas
- Obtener persona por ID
- Actualizar persona
- Eliminar persona

---

## Tecnologías Utilizadas

- Java 17+
- Spring Boot
- Spring Data JPA
- Hibernate
- MySQL
- Maven
- Postman (para pruebas)

## Arquitectura del Proyecto

El proyecto sigue una arquitectura en capas:

### Capas

- **Model**: Representa la tabla `person` en la base de datos.
- **Repository**: Permite realizar operaciones CRUD sin escribir SQL manual.
- **Controller**: Expone los endpoints REST.

---

## Requisitos Previos

Antes de ejecutar el proyecto, es necesario tener instalado:

- Java 17 o superior
- Maven
- MySQL Server
- MySQL Workbench (opcional)
- Postman (opcional para pruebas)

Verificar instalación:

```bash
java -version
mvn -version
mysql --version
