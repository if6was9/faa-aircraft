# faa-aircraft

Fetches [aircraft registration](https://www.faa.gov/licenses_certificates/aircraft_certification/aircraft_registry/releasable_aircraft_download) from the FAA and cleans it up a bit.

Produces four files:

```shell
$ ./build.sh
Fetching https://registry.faa.gov/database/ReleasableAircraft.zip...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 68.9M  100 68.9M    0     0  22.2M      0  0:00:03  0:00:03 --:--:-- 22.2M
Writing CSV files...

./output/master.csv
./output/engine.csv
./output/reserved.csv
./output/acftref.csv
```