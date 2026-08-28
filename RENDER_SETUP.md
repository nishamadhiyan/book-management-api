# Render deployment notes

## 1. Frontend/API fix

The frontend now calls the backend with the same-origin path:

`/books`

Do not change this back to `http://localhost:8080/books` when deploying.

## 2. Database

For local development, the project falls back to H2 in-memory storage.

For Render production, configure a persistent PostgreSQL database and add these Web Service environment variables:

- `SPRING_DATASOURCE_URL` = `jdbc:postgresql://<host>:5432/<database>`
- `SPRING_DATASOURCE_USERNAME` = `<username>`
- `SPRING_DATASOURCE_PASSWORD` = `<password>`

The project includes the PostgreSQL JDBC driver.

## 3. Render service

If using the Dockerfile, keep the service as a Web Service. The application reads Render's `PORT` environment variable automatically.

## 4. Test after deployment

Open the deployed site and press F12 -> Network.

When adding a book, the browser should show:

`POST /books`

A successful response is HTTP `201 Created`.

The catalog should then refresh with:

`GET /books`

You can also check:

`GET /books/health`

which should return `Book Management API is running`.
