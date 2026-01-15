# Answers for HW 01

## Question 1. Understanding Docker images
Run docker with the python:3.13 image. Use an entrypoint bash to interact with the container.

What's the version of pip in the image?

```bash
root@d56d3cad5f1c:/app# pip --version
pip 25.3 from /usr/local/lib/python3.13/site-packages/pip (python 3.13)
```

Answer: 25.3

## Question 2. Understanding Docker networking and docker-compose
Given the following {docker-compose.yaml](https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2026/01-docker-terraform/homework.md#question-2-understanding-docker-networking-and-docker-compose), what is the hostname and port that pgadmin should use to connect to the postgres database?

Answer: postgres:5432 and db:5432. Connection is established either container name or service name, targeting port 5432.

## 