# blast-recreation

BLAST 2 Sequences

by Gregory Sprenger

** Description **
	This is a front-end website for the NCBI BLAST tool called BLAST 2 Sequences, or bl2seq. This tool is used to identify similarities between two sequences and give various results on the matches between the sequences.


Source code can be found here:
	http://bfx3.aap.jhu.edu/gspreng2/BLAST2Sequences.tar.gz
	OR
	https://github.com/gsprenger56/blast-recreation/raw/main/BLAST2Sequences.tar.gz


A demo can be found here:
	http://bfx3.aap.jhu.edu/gspreng2/final/index.html


The bl2seq tool can be found here:
	https://ftp.ncbi.nlm.nih.gov/blast/executables/legacy.NOTSUPPORTED/2.2.26/blast-2.2.26-x64-linux.tar.gz


More information on bl2seq can be found within the 'doc' folder that is inside the above tar.gz file.

** Requirements **
	
	- Download BLAST2Sequences.tar.gz and extract
		- Contains BLAST tools, including bl2seq version 2.2.26

	- Recommended 1.8 ghz processor and 1 gb of memory
	
	- Modify MySQL database connections for the following files:
		autocomplete.cgi, output_to_sql.py, results_search.cgi

	- Import MySQL tables (queries, info) into a database
		Found in sql_dump folder
			- Log into MySQL with: mysql -u username -h localhost -p
			- Create database: CREATE DATABASE new_database;
			- Import MySQL file: mysql -u username -p new_database < BLAST2Sequences_dump.sql


** Usage **


1. Load index.html and choose which program to use (blastn, blastp, tblastn, tblastx, blastx).

2. Enter FASTA sequence into each sequence text area. It is recommended to title each, such as:
	">AccessionNumber
	ACTCATG"

3. Check the box next to 'Save Alignment' if you want the data stored in the MySQL database. Warning: Only first two queries are saved.

4. Press 'Align'.

5. 'Clear Sequences' will remove all data entered in Sequence 1/2 text areas.

-----------------------------------------------------------------------------------------------

6. To view analyses saved to MySQL database, begin entering the AccessionNumber (from example in Step 2). A drop down menu will appear. Select the analysis you would like to view.

7. Press 'Submit'.
