#!/bin/bash -euo pipefail
gatk --java-options "-Xmx5324M -XX:-UsePerfData" \
    IntervalListToBed \
    --INPUT genome.interval_list \
    --OUTPUT genome.bed \
    --TMP_DIR . \


cat <<-END_VERSIONS > versions.yml
"NFCORE_SAREK:PREPARE_INTERVALS:GATK4_INTERVALLISTTOBED":
    gatk4: $(echo $(gatk --version 2>&1) | sed 's/^.*(GATK) v//; s/ .*$//')
END_VERSIONS
