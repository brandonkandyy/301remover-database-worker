# Database Worker

Part of the 301remover project

This component is the database worker that takes jobs from the message queue and resolves unknown URLs from their shortening service.


## Setup

To build the database worker using docker, run the following command in the main directory.

```
docker build ./ 
```

In order to use the resolver work you'll need have the server and rabbitMQ running.
