#!/bin/env python

import functools

@functools.cache
def sameInstance(Cls, *args, **kwArgs,):
    return Cls(*args, **kwArgs)

class ClsA(object):
    def __init__(self, oneArg, kwArgOne=None):
        self.oneArg = oneArg
        self.kwArgOne = kwArgOne

first_aInst = sameInstance(ClsA, 'arg1',)
second_aInst = sameInstance(ClsA, 'arg1',)
first_other_aInst = sameInstance(ClsA, 'argA',)
third_aInst = sameInstance(ClsA, 'arg1',)
second_other_aInst = sameInstance(ClsA, 'argA',)
first_otherKw_aInst = sameInstance(ClsA, 'argA', kwArgOne='kwA')
second_otherKw_aInst = sameInstance(ClsA, 'argA', kwArgOne='kwA')

print(f"{first_aInst}\n{second_aInst}\n{first_other_aInst}\n{third_aInst}\n{second_other_aInst}\n{first_otherKw_aInst}\n{second_otherKw_aInst}")
print(f"{third_aInst.oneArg} -- {third_aInst.kwArgOne}")
print(f"{second_other_aInst.oneArg} -- {second_other_aInst.kwArgOne}")
print(f"{first_otherKw_aInst.oneArg} -- {first_otherKw_aInst.kwArgOne}")

class SingleA(object):
    def __init__(self,):
        self.param = 'initVal'

singeltonExA = sameInstance(SingleA)
singeltonExB = sameInstance(SingleA)
singeltonExA.param = 'a-editVal'
print(f"{singeltonExB.param}")
