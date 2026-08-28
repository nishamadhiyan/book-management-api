# Book Management REST API

A Spring Boot REST API for managing a book inventory, built as part of a Spring Boot Intern Technical Assessment.

## Tech Stack
- Java 17
- Spring Boot 4.x
- Spring Web
- Spring Data JPA (Hibernate)
- PostgreSQL (Render) / H2 (local development)
- Maven
- Postman (for testing)

## Project Structure
src/main/java/com/example/bookmanagement
├── controller/ # REST endpoints
├── service/ # Business logic
├── repository/ # Database access (Spring Data JPA)
└── model/ # Entity classes


## Setup Instructions

### Local development

The application can run locally without a database server by using the built-in H2 in-memory database:

```bash
./mvnw spring-boot:run
```

The API and UI will be available at `http://localhost:8080`.

### Render deployment

For production, use a persistent Render PostgreSQL database. In the Render Web Service environment variables, configure:

- `SPRING_DATASOURCE_URL` = your PostgreSQL JDBC URL, for example `jdbc:postgresql://<host>:5432/<database>`
- `SPRING_DATASOURCE_USERNAME` = PostgreSQL username
- `SPRING_DATASOURCE_PASSWORD` = PostgreSQL password

Do not use the H2 `mem:` database in production if data must survive deployments/restarts.

The frontend uses the same-origin API path `/books`, so it works both locally and on Render without hard-coded `localhost` URLs.

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST   | /books   | Create a new book |
| GET    | /books   | Get all books |
| GET    | /books/{id} | Get a book by ID |
| PUT    | /books/{id} | Update a book by ID |
| DELETE | /books/{id} | Delete a book by ID |
| GET    | /books/category/{category} | Get books by category |

## Sample Request Body (POST/PUT)
```json
{
  "title": "Atomic Habits",
  "author": "James Clear",
  "category": "Self-help",
  "price": 399,
  "available": true
}
```

## Validation Rules
- `title` — mandatory
- `author` — mandatory
- `price` — must be greater than 0

## Application Flow
Request → Controller (handles HTTP, validates input) → Service (business logic) → Repository (Spring Data JPA) → MySQL Database

Response flows back the same path, converted to JSON automatically by `@RestController`.
