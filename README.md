# Data Warehouse set up in MySQL for Used Cars Dataset

Project to create MySQL database, model and populate with used cars dataset.

Requirements: active `MySQL server` and `MySQL client` installed.</br>
Dataset was downloaded from [here](https://www.kaggle.com/datasets/rakkesharv/used-cars-detailed-dataset).

After cloning this repo follow these steps:</br>
**Option 1** Step by step from CLI. In repo folder run:
1. `./01_ingest_data.sh`
2. `./02_create_tables.sh`
3. `./03_load_data.sh`
4. `./04_load_data2.sh`
5. `./05_create_user.sh`
6. `./06_ad_hoc_queries.sh`

**Option 2** Restore database from file. In CLI run.</br>
1. `mysql -u root -p -e "CREATE DATABASE cars;"` 
2. `mysql -u root -p cars < carsdbbackup.sql`

You can explore DB cars from your favorite GUI Client like `MySQL WorkBench`, `DBeaver` or other or directly from `mysql` client.
 
  ## Data Model
 
 ![cars](https://github.com/Zivilevs/MySQL-DE1.2/assets/54817312/33df78b1-546d-4eb4-8c84-56b4e32eb852)

