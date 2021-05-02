// UPDATES:

// #1 change all ETH transactions to ETH2
db.transactions.update({"tradingPair.symbol": "eth"}, {"$set": {"tradingPair.symbol":"eth2"}}, {"multi": true})

// #2 add DOGE/CZK trading pair to portfolio with ID 0
db.portfolios.update({"_id": 0}, {"$push": {"tradingPairs": {"symbol": "doge", "currency": "czk"}}})

