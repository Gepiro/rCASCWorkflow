
rm -r cellrangerCount/fastqs
cp -r cellrangerCount/a cellrangerCount/fastqs
streamflow prova.yml --outdir ResultsWorkflow
