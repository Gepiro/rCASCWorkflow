mkdir ResultsWorkflow
rm -r cellrangerCount/fastqs
cp -r cellrangerCount/a cellrangerCount/fastqs
streamflow streamflow.yml --outdir ResultsWorkflow
