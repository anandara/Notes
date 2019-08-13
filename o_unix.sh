#NOTE: NEVER USE DOUBLE QUOTES INSIDE THE QUERY, AS WE ARE USING DOUBLE QUOTES FOR QUOTING THE QUERY ITSELF, IF DOUBLEQUOTES ARE USED INSIDE QUERY, THEN IT IS BOUND TO FAIL. USE SINGLE QUOTE ONLY INSIDE QUERY IN PLACE OF DOUBLE QUOTES.
------------------------------------------------------
#grep
[dl_lumeris@shdpslndm2u026 united]$ grep 'U325633746601' UNITED_ServiceLine_V4_20190326.txt
Binary file UNITED_ServiceLine_V4_20190326.txt matches
[dl_lumeris@shdpslndm2u026 united]$ grep -a 'U325633746601' UNITED_ServiceLine_V4_20190326.txt
------------------------------------------------------
#Only for number of fields in First Line
awk -F'|' '{print NF;exit}' MSH_PayerDef_20181103.txt;
#get number of fields in all lines
awk -F'|' '{print NF}' MSH_PayerDef_20181103.txt;
#get number of fields in all lines #unique number of fields
awk -F'|' '{print NF}' MSH_PayerDef_20181103.txt | sort -u;
------------------------------------------------------
#DISTINCT RECORDS considering 1-15 as one value
cut -f1-15 -d"|" MSH_PayerDef_20181103.txt | sort -u | wc -l;
#DISTINCT RECORDS considering  and 2 as one value
cut -f1,2 -d"|" MSH_PayerDef_20181103.txt | sort -u | wc -l;
------------------------------------------------------
#To Find number NULL VALUES count for a particular field
cut -f1 -d"|" MSH_PayerDef_20181103.txt | egrep '^$|^  *$' | wc -l;
cut -f2 -d"|" MSH_PayerDef_20181103.txt | egrep '^$|^  *$' | wc -l;
cut -f3 -d"|" MSH_PayerDef_20181103.txt | egrep '^$|^  *$' | wc -l;
------------------------------------------------------
#IF 66TH FIELD CONTAINS LABCORP_EXTERNAL or EMR_SOURCE some where in the 66 th field print complete line
awk -F"|" '$66 ~ /LABCORP_EXTERNAL|EMR_SOURCE/{print}' Labcorp_Results_112718.txt > labcorp
#IF 66TH FIELD CONTAINS exactly 0 print 2nd field
awk -F"|" '$11 ~ /^0$/{print $2}' ANTHEMCOM_ClaimHeader_V4_20190515.txt | wc -l 
------------------------------------------------------
#to get medical and rx claim header in diff files
awk -F"|" '$7 ~ /laim|1|2/{print}' CIGNA_ClaimHeader_V4_20190522.txt > mediclaim_full.csv
awk -F"|" '$7 ~ /laim|5/{print}' CIGNA_ClaimHeader_V4_20190522.txt > pharmaclaim_full.csv
------------------------------------------------------
#sed Exact Match
[dl_lumeris@shdpslndm2u026 a1218_228]$ sed 's/\bNULL\b//g' nulle.csv > abc.csv
------------------------------------------------------
#to get specified lines recordssed -n -e '1,999p' cigna7838mrns  > 0cigna;
sed -n -e '1001,1999p' cigna7838mrns  > 1cigna;
sed -n -e '2001,2999p' cigna7838mrns  > 2cigna;
sed -n -e '3001,3999p' cigna7838mrns  > 3cigna;
sed -n -e '4001,4999p' cigna7838mrns  > 4cigna;
------------------------------------------------------
#UNIX JOIN #To see the extra/Non matching records in file1 #both files should have one column
join file1.txt file2.txt -v 1 > a.txt
join file1.txt file2.txt -v 2 > a.txt
------------------------------------------------------
#max of column length EXCLUDING HEADER
tail -n +2 A1218_Diagnoses_V4_20190307.txt | cut -f6 -d"|" | wc -L
------------------------------------------------------
#INTRODUCE ctrl M character (^M) in a file.
sed 's/$/\r/g'  abc.csv > def.csv
------------------------------------------------------
#2nd field 1199 and 27th field as mentioned then print entire line
awk -F"|" '$2 ~ /^1199$/ && $27 ~ /2018-07-02 |2018-10-15 /{print}' MSH_Lab_20181204.txt >> /tmp/d/1227_qatesting/mbr_lab_samp.txt;
awk -F"|" '$2 ~ /^AETNA$/ && $27 ~ /2017-11-30 |2018-01-15 |2018-06-12 |2018-09-08 |2018-11-02 /{print}' MSH_Lab_20181204.txt >> /tmp/d/1227_qatesting/mbr_lab_samp.txt;
awk -F"|" '$2 ~ /^AETNA MA$/ && $27 ~ /2018-09-12 |2018-07-05 |2018-11-03 /{print}' MSH_Lab_20181204.txt >> /tmp/d/1227_qatesting/mbr_lab_samp.txt;
------------------------------------------------------
#remove header#get 2nd column#sorting#count of duplicates and duplicate value#print value and count
tail -n +2 Mismatch.csv|cut -f2 -d"~" | sort |uniq -c | awk  '{print $2, $1}' > a.txt
------------------------------------------------------
#remove header #if length != 10 print entire line
tail -n +2 1199_Medications_V4_20190320.txt | awk -F"|" 'length($1) !=10 {print}' 
#remove header #if length > 20 print entire line
tail -n +2 file_input| awk -F"|" 'LENGTH($11) > 20 {print}' > file_out
------------------------------------------------------
#print entire line with (4th and 5th field remove last char)
awk -F"|" 'BEGIN {OFS = FS}{$4=substr($4, 1, length($4)-1);$5=substr($5, 1, length($5)-1);print}' abc > def
------------------------------------------------------
#distinct number of column count:
awk -F'|' '{print NF}' MSH_Mbr_20190606.txt | sort -u
------------------------------------------------------
#get hdfs file size: 
hdfs dfs -du -s -h hdfs://lhdpslus3/apps/hive/warehouse/lumeris_epic_outbound.db/member_temp
------------------------------------------------------
#tab and null replace in a file 
| sed -e 's/\t/|/g' -e 's/|NULL/|/g'
------------------------------------------------------
#delete logs:
hdfs dfs -ls -R /inbound/landing/lumeris_claims_feed/logs/STG/  | grep "^-" | tr -s " " | cut -d' ' -f6-8 | awk 'BEGIN{ RETENTION_DAYS=2; LAST=24*60*60*RETENTION_DAYS; "date +%s" | getline NOW } { cmd="date -d'\''"$1" "$2"'\'' +%s"; cmd | getline WHEN; DIFF=NOW-WHEN; if(DIFF > LAST){ system("hdfs dfs -rm -r -skipTrash "$3 ) }}'
------------------------------------------------------
#sort by time
hdfs dfs -ls -t /oozie_wf/HealthInsight/ETL_STG_CORE/logs/
------------------------------------------------------