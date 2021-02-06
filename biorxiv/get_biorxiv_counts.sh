#!/bin/sh

#this script estimates the amount of literature published for each virus until the time we closed curation

while read i 
do
echo "$i" >> SARS-CoV-2_biomedrxiv_hits.txt
curl "$i" | grep 'https://doi.org' | cut -d'>' -f9  >> SARS-CoV-2_biomedrxiv_hits.txt
done < biorxiv_sarscov2_urllist.txt


while read j 
do
echo "$j" >> SARS-CoV_biomedrxiv_hits.txt
curl "$j" | grep 'https://doi.org' | cut -d'>' -f9 >> SARS-CoV_biomedrxiv_hits.txt
done < biorxiv_sarscov_urllist.txt

while read k 
do
echo "$k" >> H5N1_biomedrxiv_hits.txt
curl "$k" | grep 'https://doi.org' | cut -d'>' -f9  >> H5N1_biomedrxiv_hits.txt
done < biorxiv_h5n1_urllist.txt

while read l 
do
echo "$l" >> MERS-CoV_biomedrxiv_hits.txt
curl "$l" | grep 'https://doi.org' | cut -d'>' -f9  >> MERS-CoV_biomedrxiv_hits.txt
done < biorxiv_merscov_urllist.txt

while read m 
do
echo "$m" >> H7N9_biomedrxiv_hits.txt
curl "$m" | grep 'https://doi.org' | cut -d'>' -f9  >> H7N9_biomedrxiv_hits.txt
done < biorxiv_h7n9_urllist.txt
