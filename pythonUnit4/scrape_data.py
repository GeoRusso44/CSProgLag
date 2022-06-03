from bs4 import BeautifulSoup
import requests


def get_tagsfrom(tag, data_url):
    ''' It gets the HTML from the website from a request and then parses it to fit the beautifulSoup format '''
    req = requests.get(data_url)
    soup = BeautifulSoup(req.text, "html.parser")
    return soup.find_all(tag)  #returns a list of tags

def main():
    ''' This then goes to UNB's website and finds all the course tags with keyword table '''
    course_tags = get_tagsfrom('table'," https://www.unb.ca/academics/calendar/undergraduate/current/frederictoncourses/softwareengineering/index.html")
    

print(get_tagsfrom.__doc__)
print(main.__doc__)

if __name__ == "__main__":
    main()