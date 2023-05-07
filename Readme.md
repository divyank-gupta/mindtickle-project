# mindtickle-project

# Build

Build the application: `./gradlew build`

Test the application: `./gradlew test` (success, exit code: 0; error, exit code > 0)

# Run

The application requires access to a Postgres database.

In the Dockerfile, an OpenTelemetry agent for Java has been included to facilitate automatic instrumentation.
The Docker image for this application has already been pushed to the divyankgupta/mindtickle-project repository on DockerHub.

You can run the application along with opentelemetry collector, grafana tempo and grafana by using the docker-compose.yaml.

Run the application: `docker compose up`, but before running the application update the bewlo mwntion environment variables in docker-compose.yaml:
- `DATABASE_URL` (example: `DATABASE_URL=jdbc:postgresql://localhost:5432/public`)
- `DATABASE_USERNAME` (example: `DATABASE_USERNAME=user`)
- `DATABASE_PASSWORD` (example: `DATABASE_PASSWORD=password`)

The application can be accessed at http://localhost:8080/check-database. It will return a JSON payload. If the app can connect successfully to Postgres, it will return:

```json
{"status":"OK","message":"Sample application is working with database"}
```

If the app cannot successfully connect to Postgres, it will return:

```json
{"status":"KO","message":"Sample application is NOT working with database. Check logs.."}
```

Also the traces can be viewed on grafana using tempo datasource on http://localhost:3000

![trace_grafana](https://user-images.githubusercontent.com/58252729/236699903-396fef58-9a7c-4d95-aa21-abc795092767.png)

