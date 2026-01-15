import os
import pandas as pd
from sqlalchemy import create_engine

def ingest_data():
    # Database connection parameters
    user = os.environ.get('POSTGRES_USER')
    password = os.environ.get('POSTGRES_PASSWORD')
    host = os.environ.get('POSTGRES_HOST')
    port = os.environ.get('POSTGRES_PORT')
    db = os.environ.get('POSTGRES_DB')
    
    url = f'postgresql://{user}:{password}@{host}:{port}/{db}'
    engine = create_engine(url)

    print(f"Connecting to database: {url}")

    # Ingest Green Taxi Data (Parquet)
    print("Ingesting green_tripdata_2025-11.parquet...")
    try:
        df_green = pd.read_parquet('green_tripdata_2025-11.parquet')
        df_green.to_sql(name='green_taxi_trips', con=engine, if_exists='replace', chunksize=100000)
        print("Successfully ingested green_taxi_trips")
    except Exception as e:
        print(f"Error ingesting parquet file: {e}")

    # Ingest Taxi Zone Lookup (CSV)
    print("Ingesting taxi_zone_lookup.csv...")
    try:
        df_zones = pd.read_csv('taxi_zone_lookup.csv')
        df_zones.to_sql(name='taxi_zones', con=engine, if_exists='replace')
        print("Successfully ingested taxi_zones")
    except Exception as e:
        print(f"Error ingesting csv file: {e}")

if __name__ == '__main__':
    ingest_data()
