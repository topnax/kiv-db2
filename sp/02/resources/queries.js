// QUERIES:

// #1 find all portfolios with X/ADA trading pairs
print()
print("#1 find all portfolios with X/ADA trading pairs")

db.portfolios.find({"tradingPairs.symbol": "ada"})


// #2 find all BTC transactions with size greater than 0.33
print()
print("#2 find all BTC transactions with size greater than 0.33")
db.transactions.find({$and:[{"size": {$gte: 0.33}}, {"tradingPair.symbol": "btc"}, {"tradingPair.currency": "eur"}]})


// #3 find all sell order transactions
print()
print("#3 find all sell order transactions")

db.transactions.find({"sell": {$exists:true}})


// #4 find all transactions with symbols ADA (Cardano) or DOT (Polkadot) with a projected trading pair ("symbol/currency")
print()
print("#4 find all transactions with symbols ADA (Cardano) or DOT (Polkadot) with a projected trading pair (\"symbol/currency\")")

db.transactions.aggregate([{$match:{"tradingPair.symbol": {$in: ["ada", "dot"]}}}, {$project: {"size": 1, "filledPrice":1, "tradingPair": {$concat:["$tradingPair.symbol", "/","$tradingPair.currency"]}}}])


// #5 find all portfolios matching a certain regex (filtering by regex does not make a lot of sense in this database)
print()
print("#5 find all portfolios matching a certain regex (filtering by regex does not make a lot of sense in this database)")

db.portfolios.find({"description": {$regex: "(Tracking )(.*)( of)"}})


// #6 sum the size of all BTC buy orders from the portfolio with ID 2
print()
print("#6 sum the size of all BTC buy orders from the portfolio with ID 2")

db.transactions.aggregate([{$match: {$and:[{"portfolioId":2}, {"tradingPair.symbol": "btc"}, {"sell": {$exists: false}}]}}, {$group: {_id: "$tradingPair.symbol", sum: {$sum: "$size"}}}])

// #7 use aggregation assign transactions to the portfolio they belong in
db.portfolios.aggregate([{$lookup: {"from": "transactions", "localField": "_id", "foreignField": "portfolioId", "as": "transactions"}}, {$project: {"portfolio_name":"$name", "transactions":"$transactions"}}])
