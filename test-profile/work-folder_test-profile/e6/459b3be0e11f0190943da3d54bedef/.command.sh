#!/bin/bash -euo pipefail
bgzip  --threads 1 -c  chr22_1-40001.bed > chr22_1-40001.bed.gz
tabix  chr22_1-40001.bed.gz

cat <<-END_VERSIONS > versions.yml
"NFCORE_SAREK:PREPARE_INTERVALS:TABIX_BGZIPTABIX_INTERVAL_SPLIT":
    tabix: $(echo $(tabix -h 2>&1) | sed 's/^.*Version: //; s/ .*$//')
END_VERSIONS
