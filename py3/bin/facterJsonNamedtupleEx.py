#!/bisos/venv/py2/bisos3/bin/python
# -*- coding: utf-8 -*-
"""\
* *[Summary]* :: Example of using facter info in python using json and namedtuple.
"""
import json
import subprocess

import collections

y = json.loads(subprocess.check_output(['facter', '--json']), object_hook=lambda d: collections.namedtuple('Factset', list(d.keys()), rename=True)(*list(d.values())))

print((y.networking.primary))

print((dir(y)))
print(y)

print((y.kernel))
print((y.networking))
