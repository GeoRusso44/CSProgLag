from lists_and_dictionaries import *

testList = [1,2,3,4,5,6,7,8,9]
def test1():
    testList1 = make_listofnumbers(1,10)
    return testList1

def test_funcTest1():
    assert test1() == testList

def test2():
    testList2 = make_numberlist(1,10,2)
    return testList2

testList2 = [2,4,6,8]

def test_funcTest2():
    assert test2() == testList2
d_original = {"water": 5, "chicken" : 10, "Soda": 2.50, "100 in TV" : 5003}
tax = 1.16
def test3():
    d_new = make_itemswithtax(d_original, tax)
    return d_new

testList2 = [2,4,6,8]

d_test = {"water": 5.8, "chicken" : 11.6, "Soda": 2.9, "100 in TV" : 5803.48}

def test_funcTest3():
    assert test3() == d_test