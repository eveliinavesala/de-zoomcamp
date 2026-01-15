# Answers for HW 01

## Docker

### Question 1. Understanding Docker images
Run docker with the python:3.13 image. Use an entrypoint bash to interact with the container.

What's the version of pip in the image?

```bash
root@d56d3cad5f1c:/app# pip --version
pip 25.3 from /usr/local/lib/python3.13/site-packages/pip (python 3.13)
```

**Answer**: 25.3

### Question 2. Understanding Docker networking and docker-compose
Given the following [docker-compose.yaml](https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2026/01-docker-terraform/homework.md#question-2-understanding-docker-networking-and-docker-compose), what is the hostname and port that pgadmin should use to connect to the postgres database?

**Answer**: postgres:5432 and db:5432. Connection is established either container name or service name, targeting port 5432.

## PostgreSQL

### Question 3. Counting short trips
For the trips in November 2025 (lpep_pickup_datetime between '2025-11-01' and '2025-12-01', exclusive of the upper bound), how many trips had a trip_distance of less than or equal to 1 mile?

**Answer**: 

### Question 4. Longest trip for each day
Which was the pick up day with the longest trip distance? Only consider trips with trip_distance less than 100 miles (to exclude data errors).

Use the pick up time for your calculations.

**Answer**:

### Question 5. Biggest pickup zone
Which was the pickup zone with the largest total_amount (sum of all trips) on November 18th, 2025?

**Answer**:

### Question 6. Largest tip
For the passengers picked up in the zone named "East Harlem North" in November 2025, which was the drop off zone that had the largest tip?

Note: it's tip , not trip. We need the name of the zone, not the ID.

**Answer**:

## Terraform

### Question 7. Terraform Workflow
Which of the following sequences, respectively, describes the workflow for:

Downloading the provider plugins and setting up backend,
Generating proposed changes and auto-executing the plan
Remove all resources managed by terraform`

**Answer**: 
 terraform init,
 terraform apply -auto-approve,
 terraform destroy
