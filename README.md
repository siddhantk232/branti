# BRANTI


<!-- This README would normally document whatever steps are necessary to get the -->
<!-- application up and running. -->

<!-- Things you may want to cover: -->

<!-- * Ruby version -->

<!-- * System dependencies -->

<!-- * Configuration -->

<!-- * Database creation -->

#### DB config

* Start a postgres container

    ```bash
    docker run -p 5432:5432 --name=branti \
      -e POSTGRES_PASSWORD=branti \
      -e POSTGRES_USER=branti \
      -e POSTGRES_DB=branti_development \
      -d postgres:14
    ```

* `cp .env.example .env` (change the contents if needed)

* Use one of the following ways to start psql:
  
  * `rails dbconsole`
  * `docker exec -it branti psql -U branti --dbname branti_development`

<!-- * Database initialization -->

<!-- * How to run the test suite -->

<!-- * Services (job queues, cache servers, search engines, etc.) -->

<!-- * Deployment instructions -->

<!-- * ... -->

#### TODO

  - [x] check frontend assets
  - [x] authentication with email/password and google
  - [ ] music upload
  - [ ] serve/stream music

