#!/bin/bash

scp -r * trapp@esx-80.gbv.de:/opt/geodummy/
printf 'Now lo onto esx-80 and fire\n\ncd /opt/geodummy && sudo ./build_and_start_container.sh\n'