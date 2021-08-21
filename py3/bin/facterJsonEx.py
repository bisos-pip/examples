#!/bisos/venv/py2/bisos3/bin/python
# -*- coding: utf-8 -*-
"""\
* *[Summary]* :: Example of accessing facter info in python
"""
import json
import subprocess

y = json.loads(subprocess.check_output(['facter', '--json']))

print((dir(y)))

print(y)

print((y['kernel']))
print((y['os']))
print((y['networking']))
