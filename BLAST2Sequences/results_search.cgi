#!/usr/bin/env python3

import jinja2
import cgi, cgitb
import mysql.connector

cgitb.enable()
form = cgi.FieldStorage()

#template loader
templateLoader = jinja2.FileSystemLoader(searchpath='./templates')

#html file to load
env = jinja2.Environment(loader=templateLoader)
template = env.get_template('compare.html')

#get selection
search = form.getvalue('search')

#connect to mysql database
#Change based on your MySQL server!
conn = mysql.connector.connect(user="user", password="password", host="localhost", database="database")
curs = conn.cursor()

#queries
info_query = """SELECT query_id, short_title, sequence_one, sequence_two FROM info WHERE short_title LIKE %s"""
queries_query = """SELECT * FROM queries WHERE query_id LIKE %s"""


#initiate arrays
query_id, short_title, sequence_one, sequence_two = [], [], [], []
row_id, query, match, subject, score, identities, strand = [], [], [], [], [], [], []



try:
        
    #execute info_query 
    curs.execute(info_query, ('%' + str(search) + '%',))
    

    info_records = curs.fetchall()

    for record in info_records:
        query_id.append(record[0])
        short_title.append(record[1])
        sequence_one.append(record[2])
        sequence_two.append(record[3])
    conn.commit()

    q_id = query_id[0]    
           
    #execute queries_query
    curs.execute(queries_query, ('%' + str(q_id) + '%',))

    query_records = curs.fetchall()
    for record in query_records:
        row_id.append(record[0])
        query.append(record[2])
        match.append(record[3])
        subject.append(record[4])
        score.append(record[5])
        identities.append(record[6])
        strand.append(record[7])

except conn.Error():
    print("Connection failed.")

conn.close()

print("Content-type: text/html\n\n")
print(template.render(length = len(row_id), sequence_one = sequence_one[0], sequence_two = sequence_two[0], query = query, match = match, subject = subject, score = score, identities = identities, strand = strand))


