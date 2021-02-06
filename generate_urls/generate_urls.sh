#generate list of URLs for all virus-cytokine combinations for all three checked resources

declare -a viruses=("H5N1" "H7N9" "SARS-CoV" "SARS-CoV-2" "MERS-CoV")

declare -a cytokines=("CCL2" "CCL3" "CCL4" "CCL5" "CCL8" "CXCL1" "CXCL10" "CXCL11" "CXCL2" "CXCL8" "CXCL9" "G-CSF" "GM-CSF" "HGF" "IFN-a" "IFN a" "IFN alpha" "IFN-b" "IFN b" "IFN beta" "IFN-g" "IFN g" "IFN gamma" "IL-10" "IL-12" "IL-13" "IL-15" "IL-17" "IL-18" "IL-1a" "IL-1b" "IL-1RA" "IL-2" "IL-2R" "IL-4" "IL-5" "IL-6" "IL-7" "IL-9" "MIF" "SCF" "TGF-a" "TGF alpha" "TGF-b1" "TGF beta" "TNF-a" "TNF alpha")


for j in "${viruses[@]}"
do
	for i in "${cytokines[@]}"
	do
		echo "https://www.ncbi.nlm.nih.gov/research/pubtator/?view=docsum&query=""$j" "$i"
	done
done

for j in "${viruses[@]}"
do
	for i in "${cytokines[@]}"
	do
		echo "https://www.biorxiv.org/search/"$i"%252B"$j""
	done
done

for j in "${viruses[@]}"
do
	for i in "${cytokines[@]}"
	do
		echo "https://www.medrxiv.org/search/"$i"%252B"$j""
	done
done