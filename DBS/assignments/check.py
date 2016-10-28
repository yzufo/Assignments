import psycopg2
import argparse
import csv
import os, glob
import cStringIO
from collections import Counter

def parse_args():
    parser = argparse.ArgumentParser( add_help=False )
    parser.add_argument( '--help', action='help',
                         help="print this help message and exit" )
    parser.add_argument( '-d', '--dbname', metavar='<dbname>', type=str,
                         help=("name of the PostgreSQL database") )
    parser.add_argument( '-u', '--user', metavar='<username>', type=str,
                         help="connect to the database as '%(metavar)s'" )
    parser.add_argument( '-h', '--host', metavar='<hostname>', type=str,
                         help="the machine on which the server is running" )
    parser.add_argument( '-p', '--port', metavar='<port>', type=str,
                         help="the port on which the server is listening" )
    parser.add_argument( 'answers', metavar='<path/to/answers>', type=str,
                         help="CSV answers file" )
    parser.add_argument( 'query', metavar='<path/to/query>', type=str,
                         help="SQL query file" )
    return parser.parse_args()

def mark(wrong, correct, percent):
    if wrong > 0:
        return 0
    if percent == 100:
        return 2
    elif percent >= 50:
        return 1

def check(solution,candidate):
    sol = Counter(solution)
    ans = Counter(candidate)
    tot_sol = sum(sol.itervalues())
    tot_ans = sum(ans.itervalues())
    sol.subtract(ans)
    correct = len([ x for x in sol.itervalues() if x==0 ])
    wrong   = len([ x for x in sol.itervalues() if x<0  ])
    percent = 100.00;
    if tot_sol > 0:
        percent = round( float(correct)*100 / float(tot_sol), 2 )
    marks = mark(wrong, correct, percent)
    return tot_sol, tot_ans, wrong, correct, percent, marks

def main():
    args = parse_args()
    # connect to the database and load the specified instance
    conn_str = ''
    if args.dbname is not None:
        conn_str += (' dbname=' + args.dbname)
    if args.user is not None:
        conn_str += (' user=' + args.user)
    if args.host is not None:
        conn_str += (' host=' + args.host)
    if args.port is not None:
        conn_str += (' port=' + args.port)
    conn = psycopg2.connect(conn_str)
    conn.autocommit = True

    answers = []
    with open(args.answers, 'rb') as csvfile:
        reader = csv.reader(csvfile)
        for line in reader:
            answers.append(tuple(line))
    query = None
    with open(args.query, 'r') as sqlfile:
        query = sqlfile.read()
    semicolons = query.count(';')
    if semicolons != 1:
        msg = "Exactly one semicolon is allowed: query uses {}"
        conn.close()
        raise Exception(msg.format(semicolons))
    cur = conn.cursor()
    cur.execute(query)
    memfile = cStringIO.StringIO()
    writer = csv.writer(memfile)
    writer.writerows(cur.fetchall())
    memfile.flush()
    candidate = []
    reader = csv.reader(memfile.getvalue().splitlines())
    for line in reader:
        candidate.append(tuple(line))
    cur.close()
    result = check(answers, candidate)
    print "Expected: {:6} | Returned: {:6} | Wrong: {:6} | Correct: {:6} | Percentage: {:>6.2f}% | Marks: {}".format(*result)
    conn.close()
        
if __name__ == "__main__":
    main()

