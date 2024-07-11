#!/bin/bash -euo pipefail
vcftools \
    --gzvcf test.strelka.variants.vcf.gz \
    --out test.strelka.variants \
    --FILTER-summary \
     \


cat <<-END_VERSIONS > versions.yml
"NFCORE_SAREK:SAREK:VCF_QC_BCFTOOLS_VCFTOOLS:VCFTOOLS_SUMMARY":
    vcftools: $(echo $(vcftools --version 2>&1) | sed 's/^.*VCFtools (//;s/).*//')
END_VERSIONS
