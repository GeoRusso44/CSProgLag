def make_listofnumbers(a,b):
    lst = [i for i in range(a,b)]
    return lst
def make_numberlist(a,b,d): 
    lst = [i for i in make_listofnumbers(a,b) if i % d == 0]
    return lst
def make_itemswithtax(d_original, tax): 
    d_new = {key: value * tax for (key,value) in d_original.items()} 
    return d_new