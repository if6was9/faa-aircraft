# faa-aircraft

Fetches [aircraft registration](https://www.faa.gov/licenses_certificates/aircraft_certification/aircraft_registry/releasable_aircraft_download) from the FAA and cleans it up a bit.

# Usage

```shell
$ ./build.sh
Fetching https://registry.faa.gov/database/ReleasableAircraft.zip...
Writing CSV files...

./output/master.csv
./output/engine.csv
./output/reserved.csv
./output/acftref.csv

Done.
```