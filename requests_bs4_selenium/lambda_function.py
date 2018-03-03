import os
import requests
from bs4 import BeautifulSoup as bs
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

dcap = dict(DesiredCapabilities.PHANTOMJS)
dcap["phantomjs.page.settings.userAgent"] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36'

driver = webdriver.PhantomJS(
    service_log_path=os.path.devnull, 
    executable_path="/var/task/phantomjs", 
    service_args=['--ignore-ssl-errors=true'], 
    desired_capabilities=dcap
)

def lambda_handler(event, context):
    global driver

    if 'keyword' in event.keys():
        keyword = event['keyword']
    else:
        keyword = 'aws+lambda'
    url = 'https://www.google.com/search?q=' + keyword
    driver.get(url)
    html = driver.page_source
    soup = bs(html, 'html.parser')
    title = soup.select('h3.r')
    if title:
        text = title[0].text
    return {
        'title': text
    }
