import re
import fileinput
from urlparse import parse_qs


RE = re.compile("INFO  - (?P<timestamp>.*);"
                " .*; \[(?P<collection>.*)\] webapp=.*"
                " path=/select params=\{(?P<params>.*)\}"
                " hits=(?P<hits>\d+) status=.*"
                " QTime=(?P<query_milliseconds>\d+)")

for line in fileinput.input():
    match = RE.match(line)
    if match:
        groups = match.groupdict()
        params = parse_qs(groups['params'])
        try:
            print '\t'.join( (
                groups['timestamp'],
                groups['collection'],
                params.get('q', [''])[0],
                params.get('start', ['0'])[0],
                params.get('rows', ['\N'])[0],
                groups['hits'],
                groups['query_milliseconds'],
            ) )
        except:
            print 'offending line: ' + line
            raise
