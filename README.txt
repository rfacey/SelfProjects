This Github repo was recreated in 2023 to clean up some older study materials and projects. 
The projects themselves can range between 2018 to current day.

Currently completed self projects:
[FindingDoctor]
	-Problem: 
		-Recieved a list of providers from my insurance company. 
        -Provider information was incorrect.
		-Needed to find a way to confirm provider information to get a doctor appointment.
	-Solution:
		-Joined provider data from my insurance company to publicly available data to find a doctor appointment.
		-Not data science, just practical analytics.
	-Conclusion:
		-Narrowed it down to 26 providers.
		-Chose my primary care provider based on proximity with good reviews.
[PokemonSnap]
	-Problem:
		-Wanted a way to prove the Pokemon Snap remake game was targeted at people who played the original game.
	-Solution:
		-DecisionTree model to determine what factors attributed to Pokemon being added into the remake.
		-Chose decision tree model because of easy explainability.
		-Wanted a simple model to explain to other people.
	-Conclusion:
		-The game has a large number of Pokemon from generation one.
		-Will probably add to this project and do a lasso regression model instead (currently too many variables).
		-Will play around with this one because of the inbalance in data.
	-UPDATE:
		-Found a Reddit post with a Pokemon popularity poll.
		-Joined the popularity data to the data being used.
		-Narrowed down data to distinct Pokemon, merging variants/multiple types.
		-Narrowed attributes down based on statistical significance.
		-Compared multiple models based on pros/cons of results.
[WorldOfWarcraft]
	-Problem:
		-Wanted to find a way to work the WoW auction how to fund a character on a new server.
	-Solution:
		-Pulled WoW auctionhouse data from their API to find days to work the auctionhouse for profit.
		-Bought feasts on days where the sell price was low and sold them when sale price was high.
		-Look at multiple scenarios including holidays, weekends, individual reagents.
	-Conclusion:
		-Best time to buy was Tuesday mornings / early afternoons.
		-Best time to sell (at a consistent price) was Friday between 3pm and 6pm.
		-Second best time to sell was Saturday, but the average price differed more than Friday.
		-Individual reagents did not have patterns on when to buy/sell.
		-Holidays caused varying amounts to change to peak buy/sell days.