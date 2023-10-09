import requests
from bs4 import BeautifulSoup
import re

# Define the URL of the web page you want to scrape
url = 'https://www.coingecko.com/en/coins/bitcoin'

# Define a user agent to simulate a real user's request
headers = {'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36'}

# Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36

# Send an HTTP GET request to the URL with the user agent headers
response = requests.get(url, headers=headers)

# Check if the request was successful (status code 200)
if response.status_code == 200:
    # Parse the HTML content of the page using BeautifulSoup
    soup = BeautifulSoup(response.text, 'html.parser')

    # Use a regular expression to find all Reddit links
    reddit_links = soup.find_all('a', href=re.compile(r'^https?://(www\.)?reddit\.com'))

    # Print the found Reddit links
    for link in reddit_links:
        print(link['href'])
else:
    print('Failed to retrieve the web page. Status code:', response.status_code)
