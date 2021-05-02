db.createCollection("portfolios")

db.portfolios.insert({'_id': 0, 'name': 'Main Portfolio', 'description': 'Tracking Bitcoin/Ethereum', 'tradingPairs': [{'symbol': 'btc', 'currency': 'usd'}, {'symbol': 'eth', 'currency': 'usd'}]})
 
db.portfolios.insert({'_id': 1, 'name': 'Altcoin Portfolio', 'description': 'Tracking altcoins', 'tradingPairs': [{'symbol': 'ada', 'currency': 'usd'}, {'symbol': 'ltc', 'currency': 'usd'}, {'symbol': 'doge', 'currency': 'eur'}]})
 
db.portfolios.insert({'_id': 2, 'name': "Parents' portfolio", 'description': 'Tracking investments of my parents', 'tradingPairs': [{'symbol': 'btc', 'currency': 'eur'}, {'symbol': 'ada', 'currency': 'usd'}]})
 
db.portfolios.insert({'_id': 3, 'name': "John's portfolio", 'description': 'Tracking investments of my friend John', 'tradingPairs': [{'symbol': 'btc', 'currency': 'eur'}, {'symbol': 'ada', 'currency': 'usd'}, {'symbol': 'dot', 'currency': 'usd'}, {'symbol': 'eth', 'currency': 'usd'}, {'symbol': 'xlm', 'currency': 'eur'}, {'symbol': 'bnb', 'currency': 'eur'}, {'symbol': 'mkr', 'currency': 'eur'}]})
 
