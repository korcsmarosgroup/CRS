import pandas as pd
import os
#download data from pubtator website ftp://ftp.ncbi.nlm.nih.gov/pub/lu/PubTatorCentral 
#split to roughly 1 gb chunks: split -l 19783218 bioconcepts2pubtatorcentral

cytokines = ["CCL2","CCL3","CCL4","CCL5","CCL8","CXCL1","CXCL10",
             "CXCL11","CXCL2","CXCL8","CXCL9","G-CSF","GM-CSF",
             "HGF","IFN-a","IFN-b","IFN-g","IL-10","IL-12","IL-13",
             "IL-15","IL-17","IL-18","IL-1a","IL-1b","IL-1RA","IL-2",
             "IL-2R","IL-4","IL-5","IL-6","IL-7","IL-9","MIF","SCF",
             "TGF-a","TGF-b1","TNF-a"] #get cytokines

papers = pd.read_csv('pubtator_virus_paper_list.tsv', sep ='\n', header=None) #list of papers mentioning the viruses via grep

cyt = pd.DataFrame(cytokines) #list to df to enable partial matching of cytokines (e.g. TNF-a and TNF-alpha both to be found)
for filename in os.listdir("/Users/olbeim/Downloads/cytokines-tissue-blood/virus_comparison/new_comparison/citation_numbers/pubtator"
):
    if filename.startswith("xa"):
        print(filename) #track where we're at
        df = pd.read_csv(filename, sep = '\t', header=None,quoting=3, error_bad_lines=False) #last two deal with uneven quotes
        papers_df = pd.merge(df, papers, how='inner', on=[0,0]) #inner join to get pmids from the chunk that deal with the viruses
        mask = papers_df.stack().str.contains('|'.join(cytokines)).any(level=0) #find cytokines
        filt = papers_df[mask]
        cytokine_papers = set(filt[0].tolist()) #deduplicate, write to file
        with open('papers_containing_cytokines.tsv', 'a') as outf:
            for pmid in cytokine_papers:
                outf.write(f"{pmid}\n")