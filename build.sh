#!/bin/bash

set -e

rm -rf output
rm -rf temp
rm -f temp.ddb


mkdir -p temp
mkdir -p output

cd temp
curl -H "User-agent: Mozilla" -o aircraft.zip https://registry.faa.gov/database/ReleasableAircraft.zip

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


duckdb temp.ddb -f xform.sql






duckdb temp.ddb -c "copy (select * from acftref) to 'output/acftref.csv'"
duckdb temp.ddb -c "copy (select * from master order by N_NUMBER) to 'output/master.csv'"
duckdb temp.ddb -c "copy (select * from engine) to 'output/engine.csv'"
duckdb temp.ddb -c "copy (select * from reserved) to 'output/reserved.csv'"

