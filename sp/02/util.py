import random
import json

def random_tx(tx_id, portfolio_id, symbol, currency, price_start, price_end, size_start, size_end):
    size = round(random.uniform(size_start, size_end), 2)
    filled_price = round(random.uniform(price_start, price_end), 2)
    tx = {
        "_id": tx_id,
        "portfolio_id": portfolio_id,
        "size": size,
        "filled_price": filled_price,
        "fee": round((filled_price * size) * (random.uniform(0.005, 0.02)), 2),
        "timestamp": random.randrange(1596351310, 1619938546),
        "trading-pair": {
            "symbol": symbol,
            "curency": currency,
        }
    } 
    if random.randrange(0,100) > 80:
        tx["sell"] = True
    return json.dumps(tx)

def file_to_js(file_name, db, collection, out_file):
    with open(file_name, "r") as f:
        content = f.read()
        data = json.loads(content)
        with open(out_file, "w") as out_file:
            for item in data:
                out_file.write(f"{db}.{collection}.insert({item})\n \n")

        
