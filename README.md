# Exercise 1: Terraform

Write a terraform script that:

- create a pubsub topic with name “topic-test”
- create a scheduler that sends a message to the topic daily
- create a cloud function in europe-west4 that is triggered by receiving the message
pubsub on the subscription “subscription-test”
- create a dataset on bigquery in europe-west4 with name “dataset_test”
- create a bucket in europe-west4 with name “bucket_test”

For everything that has not been explained, the candidate can proceed at his own discretion.

# Exercise 2: GCP

Design an architecture that allows you to:

- read csv files (which the customer has locally but is willing to upload to the cloud) of 2TB each
- process (near real-time) row by row of the file to perform checks
- move the file to folder A on storage if the file contains errors, otherwise to folder B

For everything that has not been explained, the candidate can proceed at his own discretion.

# Exercise 3: Python

Write python code in the main.py file that:

- read the two tables from the sales.xlx file in the input folder and create a dataframe for each
of them
- create a third dataframe that has all the data from the two dataframes created in the previous point and that
contains the following columns: name_of_country,year, tables, total
- perform cleaning operations and any data enrichment operations that the candidate
deems appropriate (motivating them)
- create a json file for each row of the dataframe produced in the output folder

Fill in the related requirements.txt file.

# Exercise 4: SQL

RESERVATIONS table:

| Field name | Type    | Note                          |
|------------|---------|-------------------------------|
| id         | INTEGER | pk                            |
| spot_type  | STRING  | fk                            |
| spot_name  | STRING  | fk                            |
| status     | INTEGER |                               |
| deleted    | INTEGER |                               |
| first_name | STRING  |                               |
| last_name  | STRING  |                               |
| email      | STRING  |                               |
| start_date | STRING  | format: mm-dd-yyyy            |
| end_date   | STRING  | format: mm-dd-yyyy            |

SPOTS table:

| Field name | Type    | Note                          |
|------------|---------|-------------------------------|
| name       | STRING  | pk                            |
| type       | STRING  | pk                            |
| sector     | STRING  |                               |
| updated_at | STRING  | pk                            |
|            |         | format: dd/mm/yyyy            |

Specifications:

Considering the above schemes, write a SQL query that:

1) Extract the data of the non-canceled reservations that fall partially or completely within the interval
between July 10, 2022 and July 15, 2022.
2) retrieve the most recent sector of each station knowing that the SPOT table has a row for
each record update and that the sectors are not updated all on the same day

To better clarify point 2, by way of example, the station table could have the following
content:

| name   | type       | sector   | updated_at |
|--------|------------|----------|------------|
| sole   | cabina     | 1        | 10/10/2021 |
| sole   | ombrellone | gamma    | 16/10/2021 |
| sole   | cabina     | 3        | 14/10/2021 |
| sole   | ombrellone | delta    | 24/10/2021 |
| luna   | cabina     | 5        | 25/10/2021 |
| luna   | ombrellone | beta     | 16/10/2021 |
| luna   | gazebo     | 4        | 15/10/2021 |
| luna   | gazebo     | alpha    | 10/11/2021 |

The records that must therefore be considered are only those highlighted.

The output of this exercise must therefore be a query that extracts all the fields present in
RESERVATIONS that correspond to point 1 of the specifications and the relative sector field of the table
SPOTS (point 2 of the specifications).

Finally, draw the ER diagram that links RESERVATIONS and SPOTS with the tool that the
candidate prefers.

Evaluation criteria

The following aspects will be evaluated:

- reasoning ability
- functioning of the code
- quality of the code produced

Source: Conversation with Bing, 5/28/2023
(1) Google Traduttore. https://translate.google.com/?hl=it.
(2) . https://bing.com/search?q=translate+italian+to+english.
(3) Translate Italian to English online | Translate.com. https://www.translate.com/italian-english.
(4) DeepL Translate: The world's most accurate translator. https://www.deepl.com/en/translator-mobile.
