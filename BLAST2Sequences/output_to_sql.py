#!/usr/bin/env python3

import re, jinja2, mysql.connector

def save():
    #initiate variables
    sequences = []
    short_seq = []
    query = []
    match = []
    subject = []
    score = []
    identities = []
    strand = []

    #extract data from output.txt
    with open('output.txt') as f:
        for line in f:
           # line = line.rstrip()

            #get first sequence in file
            if line.startswith("Query="):
                m = re.match(r'^Query=\s(.+\.\d+)\s(.+)', line)
                if m:
                    short_seq.append(m.group(1))
                    add = m.group(1) + ' ' + m.group(2)
                    sequences.append(add)
                else:
                    m = re.search(r'Query=\s(.+)', line)
                    sequences.append(m.group(1))
                    short_seq.append(m.group(1)[:10]) #append first 10 chars

            
            #get second sequence in file
            elif line.startswith(">"):
                m = re.search(r'>(.+\.*\d+)\s(.*)', line)
                if m:
                    short_seq.append(m.group(1))
                    add = m.group(1) + ' ' + m.group(2)
                    sequences.append(add)
                else:
                    m = re.search(r'>(.+)', line)
                    sequences.append(m.group(1))
                    short_seq.append(m.group(1)[:10]) #append first 10 chars
            
            #find Score and append Score, Identities, Strand
            score_m = re.search(r'Score\s=\s(.+)', line)
            if score_m:
                score.append(score_m.group(1))

            ident_m = re.search(r'Identities\s=\s(.+)', line)
            if ident_m:
                identities.append(ident_m.group(1))
            
            strand_m = re.search(r'Strand\s=\s(.+)', line)
            if strand_m:
                strand.append(strand_m.group(1))

            query_m = re.search(r'Query:\s(.+\s+)', line)
            if query_m:
                query.append(query_m.group(1))
                matchings = next(f)
                match.append(matchings)
                
            sbjct_m = re.search(r'Sbjct:\s(.+\s+)', line)
            if sbjct_m:
                subject.append(sbjct_m.group(1))
            
            if (len(query) > len(score)):
                score.append('')
                identities.append('')
                strand.append('')

    #print(score, "\n\n", identities, "\n\n", strand, "\n\n", query, "\n\n", match, "\n\n", subject)
    
    #create accession x accession
    combine_short_seq = str(short_seq[0] + ' x ' + short_seq[1])
    short_seq.append(combine_short_seq)

    #connect to mysql database
    #Change based on your MySQL server!
    conn = mysql.connector.connect(user="user", password="password", host="localhost", database="database")
    curs = conn.cursor()

    #mysql queries
    queries = """INSERT INTO queries (query_id, query, matches, subject, score, identities, strand) VALUES (%s, %s, %s, %s, %s, %s, %s)"""
    info = """INSERT INTO info (short_title, sequence_one, sequence_two) VALUES (%s, %s, %s)"""
    max_query = """SELECT MAX(query_id) FROM info"""


    try:
        #insert short_title, sequence_one, and sequence_two into table 'info'
        curs.execute(info, (combine_short_seq, sequences[0], sequences[1]))
        conn.commit()

        #obtain highest query_id as it is auto_increment
        curs.execute(max_query)
        result = curs.fetchall()
        conn.commit()

        #make max_query an int
        for i in result:
            maximum = int(i[0])
            #print(maximum)

        #insert top 2 sequences into query table
        for i in range(0, 2):
            curs.execute(queries, (maximum, query[i], match[i], subject[i], score[i], identities[i], strand[i]))
            conn.commit()

        conn.close()

    except conn.Error():
        print("Connection failed.")

if __name__ == '__main__':
    save()
