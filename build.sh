#!/bin/bash

set -e


DUCKDB=${DUCKDB-"duckdb"}
AIRCRAFT_URL="https://registry.faa.gov/database/ReleasableAircraft.zip"


rm -rf output
rm -rf temp
rm -f temp.ddb


mkdir -p temp
mkdir -p output

cd temp

echo "Fetching ${AIRCRAFT_URL}..."
curl -H "User-agent: Mozilla" -o aircraft.zip ${AIRCRAFT_URL}

unzip -q aircraft.zip
#rm *.pdf


cat ENGINE.txt | sed 's/,\r//' >engine.csv
mv MASTER.txt master.csv
mv ACFTREF.txt acftref.csv
mv DEALER.txt dealer.csv
mv DEREG.txt dereg.csv
mv RESERVED.txt reserved.csv
mv DOCINDEX.txt docindex.csv

cd ..

mkdir -p output
rm -f temp.ddb


${DUCKDB} temp.ddb -f xform.sql






${DUCKDB} temp.ddb -c "copy (select * from acftref) to 'output/acftref.csv'"
${DUCKDB} temp.ddb -c "copy (select * from master order by N_NUMBER) to 'output/master.csv'"
${DUCKDB} temp.ddb -c "copy (select * from engine) to 'output/engine.csv'"
${DUCKDB} temp.ddb -c "copy (select * from reserved) to 'output/reserved.csv'"

find ./output -type f