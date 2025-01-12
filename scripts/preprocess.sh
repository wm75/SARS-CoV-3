#!/bin/bash
fdate=$1
python3 /data/shares/veg/SARS-CoV-2/SARS-CoV-2/python/extract_attributes.py -j /data/shares/gisaid/$fdate.master.json > /data/shares/gisaid/$fdate.attributes.csv
mkdir -p /data/shares/veg/SARS-CoV-2/SARS-CoV-2/data/fasta/$fdate/
cp /data/shares/gisaid/$fdate.attributes.csv /data/shares/veg/SARS-CoV-2/SARS-CoV-2/data/fasta/$fdate/attributes.csv
cp /data/shares/gisaid/$fdate.master.nofasta.json /data/shares/veg/SARS-CoV-2/SARS-CoV-2/data/fasta/$fdate/master-no-fasta.json
cp /data/shares/gisaid/$fdate.master.json /data/shares/veg/SARS-CoV-2/SARS-CoV-2/data/fasta/$fdate/master.json
python3 /data/shares/veg/SARS-CoV-2/SARS-CoV-2/python/extract_sequences.py -j /data/shares/gisaid/$fdate.master.json -f "host" "re" "[hH]uman" -f "sequence" ">" 28000 > /data/shares/veg/SARS-CoV-2/SARS-CoV-2/data/fasta/$fdate/sequences
# TO ADD
# sed -i 's/\(\w\)>/\1\n>/'
# sed -i 's/\?/N/'
