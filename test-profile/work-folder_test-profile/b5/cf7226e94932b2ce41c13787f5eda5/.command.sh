#!/bin/bash -euo pipefail
samtools \
    index \
    -@ 0 \
     \
    test.recal.cram

cat <<-END_VERSIONS > versions.yml
"NFCORE_SAREK:SAREK:BAM_APPLYBQSR:CRAM_MERGE_INDEX_SAMTOOLS:INDEX_CRAM":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
