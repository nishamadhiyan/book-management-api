# Book Management REST API

A Spring Boot REST API for managing a book inventory, built as part of a Spring Boot Intern Technical Assessment.

## Tech Stack
- Java 17
- Spring Boot 3.x
- Spring Web
- Spring Data JPA (Hibernate)
- MySQL
- Maven
- Postman (for testing)

## Project Structure
src/main/java/com/example/bookmanagement
├── controller/ # REST endpoints
├── service/ # Business logic
├── repository/ # Database access (Spring Data JPA)
└── model/ # Entity classes


## Setup Instructions

1. Clone the repository
git clone https://github.com/nishamadhiyan/book-management-api.git

2. Create the MySQL database
```sql
   CREATE DATABASE bookdb;
```

3. Configure database credentials
   - Copy `src/main/resources/application.properties.example` to `src/main/resources/application.properties`
   - Replace `nisha@2330` with your actual MySQL root password

4. Run the application
./mvnw spring-boot:run

   The API will start on `http://localhost:8080`

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