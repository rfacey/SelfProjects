import requests
import json
import datetime

clientIDFile = open("clientID.txt", "r")
for line in clientIDFile:
    clientID = line.strip()

clientSecretFile = open("clientSecret.txt", "r")
for line in clientSecretFile:
    clientSecret = line.strip()

def create_access_token(client_id, client_secret, region = 'us'):
    data = { 'grant_type': 'client_credentials' }
    response = requests.post('https://%s.battle.net/oauth/token' % region, data=data, auth=(client_id, client_secret))
    return response.json()

response = create_access_token(clientID, clientSecret)

auctionUrl = 'https://us.api.blizzard.com/data/wow/connected-realm/3684/auctions?namespace=dynamic-us&locale=en_US&access_token='

auctionResults = requests.get(auctionUrl + response['access_token'])

itemID = [172043,172053,172055,173034,173036,173037]

itemName = ['Feast of Gluttonous Hedonism','Tenebrous Ribs','Phantasmal Haunch','Silvergill Pike','Spinefin Piranha','Elysian Thade','Surprisingly Palatable Feast','Spectral Flask of Power']

auctionCleaned = json.loads(auctionResults.text)

auctionList = auctionCleaned['auctions']

currentDatetime = datetime.datetime.now()

currentDate = currentDatetime.strftime("%x")
currentTime = currentDatetime.strftime("%X")
dayOfWeek = currentDatetime.strftime("%A")

auctionByRow = []

for row in auctionList:
    if row['item']['id'] in itemID:
        auctionByRow.append((row['id'], row['item']['id'], itemName[itemID.index(row['item']['id'])], row['time_left'],row['quantity'], row['unit_price'], currentDate, currentTime, dayOfWeek))
    else: ''

with open("data.txt", "a") as data_file:
    for row in auctionByRow:
        for column in row:
            data_file.write(str(column) + ",")
        data_file.write("\n")
