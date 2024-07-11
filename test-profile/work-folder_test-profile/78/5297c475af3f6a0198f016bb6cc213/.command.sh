#!/bin/bash -euo pipefail
samtools \
    stats \
    --threads 1 \
    --reference genome.fasta \
    test.md.cram \
    > test.md.cram.stats

cat <<-END_VERSIONS > versions.yml
"NFCORE_SAREK:SAREK:BAM_MARKDUPLICATES:CRAM_QC_MOSDEPTH_SAMTOOLS:SAMTOOLS_STATS":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
