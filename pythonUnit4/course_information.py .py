from bs4 import BeautifulSoup
import requests
from scrape_data import get_tagsfrom
import re


def main():
    course_tags = get_tagsfrom('table'," https://www.unb.ca/academics/calendar/undergraduate/current/frederictoncourses/softwareengineering/index.html")
    # courseNum = [get_coursekey(x) for x in course_tags]
    # courseProp = [get_courseproperty(x,"course_prereq") for x in course_tags]
    # print(courseProp)
    # print("")
    # courseTitleCredits = [get_coursevalues(y, ["Course Dscription", "Course Credit"]) for y in course_tags]
    # print(courseTitleCredits)
    courses = {get_coursekey(outer_tag) : get_coursevalues(outer_tag, ["Course Dscription", "Course Credit"]) for outer_tag in course_tags}
    for k,v in courses.items():
        outer_tag = list(filter(lambda x : is_coursetag(x , k), course_tags))
        prereq = slim_prereq(get_courseproperty(outer_tag[0], 'course_prereq'))
        v.append(prereq)
        print(k,v) 


def get_coursekey(outer_tag):
    inner_tag = outer_tag.find(abbr="Course Code")
    return inner_tag.text

def get_coursevalues(outer_tag, abbrs):
 values = [(outer_tag.find(abbr=a)).text for a in abbrs]
 return values


def get_courseproperty(outer_tag, property):
    inner_tag = outer_tag.find(property)
    return inner_tag.text    

def is_coursetag(outer_tag, key):
    inner_tag = outer_tag.find(abbr="Course Code")
    if (inner_tag.text == key):
        return True
    else:
        return False

def slim_prereq(prereq):
    pattern = re.compile("[A-Z]{2,4}[\" \"]\\d{4,4}")
    return re.findall(pattern, prereq)

if __name__ == "__main__":
    main()