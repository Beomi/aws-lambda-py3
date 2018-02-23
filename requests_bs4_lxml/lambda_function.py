import requests
from bs4 import BeautifulSoup as bs

def lambda_handler(event, context):
    if 'keyword' in event.keys():
        keyword = event['keyword']
    else:
        keyword = 'aws+lambda'
    url = 'https://www.google.com/search?q=' + keyword
    res = requests.get(url)
    html = res.text
    soup = bs(html, 'lxml')
    title = soup.select('h3.r')
    if title:
        text = title[0].text

    return {
        'title': text
    }
