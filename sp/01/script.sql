-- Create a table in which XML docs represent exchange orders

DROP TABLE crypto_orders_import_xml;    -- drop (in case it already exists)
DROP SEQUENCE import_id;                -- create a sequence

CREATE TABLE crypto_orders_import_xml
(
    id               INTEGER                        NOT NULL PRIMARY KEY,
    import_data      XMLTYPE                        NOT NULL,     -- import content
    import_timestamp TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,     -- timestamp of the import - defaults to curr. ts.
    exchange         VARCHAR(64)                    NOT NULL      -- name of the exchange on which it was realised
);

CREATE SEQUENCE import_id START WITH 1;


-- Insert data

-- 1) import of trading pairs. portfolios and some orders

INSERT INTO crypto_orders_import_xml (id, import_data, exchange)
VALUES (import_id.NEXTVAL,
        XMLTYPE('<?xml version="1.0" encoding="utf-8" ?>
        <crypto-tracker>

            <trading-pairs>
                <trading-pair id="1">
                    <name>Bitcoin</name>
                    <symbol>BTC</symbol>
                    <currency>USD</currency>
                </trading-pair>
                <trading-pair id="2">
                    <name>Litecoin</name>
                    <symbol>LTC</symbol>
                    <currency>USD</currency>
                </trading-pair>
                <trading-pair id="3">
                    <name>Ethereum</name>
                    <symbol>ETH</symbol>
                    <currency>EUR</currency>
                </trading-pair>
                <trading-pair id="4">
                    <name>Cardano</name>
                    <symbol>ADA</symbol>
                    <currency>USD</currency>
                </trading-pair>
            </trading-pairs>

            <portfolios>
                <portfolio id="1" name="Main Portfolio" description="Tracking Bitcoin/Ethereum transactions">
                    <orders>
                        <order trading-pair="1">
                            <size>1</size>
                            <price>20000</price>
                            <fee>1</fee>
                            <timestamp>1618675561</timestamp>
                        </order>
                        <order trading-pair="1" sell="true">
                            <size>0.30</size>
                            <price>20900</price>
                            <fee>0.22</fee>
                            <timestamp>1618675531</timestamp>
                        </order>
                    </orders>
                </portfolio>
                <portfolio id="2" name="Altcoin Portfolio" description="Tracking altcoin portfolio">
                    <orders>
                        <order trading-pair="4">
                            <size>10000</size>
                            <price>0.16</price>
                            <fee>1</fee>
                            <timestamp>1618675561</timestamp>
                        </order>
                        <order trading-pair="2" sell="true">
                            <size>5</size>
                            <price>230</price>
                            <fee>3</fee>
                            <timestamp>1618675531</timestamp>
                        </order>
                    </orders>
                </portfolio>
                <portfolio id="3" name="Parents portfolio" description="Tracking investments of my parents"/>
            </portfolios>

        </crypto-tracker>
        '), 'coinbase');


-- 2) an import of orders

INSERT INTO crypto_orders_import_xml (id, import_data, exchange)
VALUES (import_id.NEXTVAL,
        XMLTYPE('<?xml version="1.0" encoding="utf-8" ?>

        <crypto-tracker>
            <portfolios>
                <portfolio id="3">
                    <orders>
                        <order trading-pair="1">
                            <size>11200</size>
                            <price>0.01</price>
                            <fee>1.2</fee>
                            <timestamp>1618675161</timestamp>
                        </order>
                        <order trading-pair="2" sell="true">
                            <size>1</size>
                            <price>90</price>
                            <fee>0.2</fee>
                            <timestamp>1618675511</timestamp>
                        </order>
                    </orders>
                </portfolio>
            </portfolios>
        </crypto-tracker>

        '), 'coinbase');


-- 3) another import of orders including a new trading pairs (DOT and 🐕)

INSERT INTO crypto_orders_import_xml (id, import_data, exchange)
VALUES (import_id.NEXTVAL,
        XMLTYPE('<?xml version="1.0" encoding="utf-8" ?>

        <crypto-tracker>
            <trading-pairs>
                <trading-pair id="5">
                    <name>Polkadot</name>
                    <symbol>DOT</symbol>
                    <currency>USD</currency>
                </trading-pair>
                <trading-pair id="6">
                    <name>Dogecoin</name>
                    <symbol>DOGE</symbol>
                    <currency>EUR</currency>
                </trading-pair>
            </trading-pairs>

            <portfolios>
                <portfolio id="2">
                    <orders>
                        <order trading-pair="5">
                            <size>30</size>
                            <price>32</price>
                            <fee>2</fee>
                            <timestamp>1618611161</timestamp>
                        </order>
                        <order trading-pair="2">
                            <size>9</size>
                            <price>202</price>
                            <fee>1.5</fee>
                            <timestamp>1618679531</timestamp>
                        </order>
                    </orders>
                </portfolio>
            </portfolios>
        </crypto-tracker>

        '), 'binance');


-- 4) another import of orders

INSERT INTO crypto_orders_import_xml (id, import_data, exchange)
VALUES (import_id.NEXTVAL,
        XMLTYPE('<?xml version="1.0" encoding="utf-8" ?>

        <crypto-tracker>
            <portfolios>
                <portfolio id="1">
                    <orders>
                        <order trading-pair="1">
                            <size>0.003</size>
                            <price>34193</price>
                            <fee>0.5</fee>
                            <timestamp>1618711161</timestamp>
                        </order>
                    </orders>
                </portfolio>
                <portfolio id="2">
                    <orders>
                        <order trading-pair="3">
                            <size>0.5</size>
                            <price>1800</price>
                            <fee>1.21</fee>
                            <timestamp>1618659531</timestamp>
                        </order>
                        <order trading-pair="2">
                            <size>9</size>
                            <price>202</price>
                            <fee>1.5</fee>
                            <timestamp>1618679531</timestamp>
                        </order>
                    </orders>
                </portfolio>
            </portfolios>
        </crypto-tracker>

        '), 'kraken');


-- 5) another import of orders

INSERT INTO crypto_orders_import_xml (id, import_data, exchange)
VALUES (import_id.NEXTVAL,
        XMLTYPE('<?xml version="1.0" encoding="utf-8" ?>

        <crypto-tracker>
            <portfolios>
                <portfolio id="1">
                    <orders>
                        <order trading-pair="1">
                            <size>0.005</size>
                            <price>33123</price>
                            <fee>0.3</fee>
                            <timestamp>1618709161</timestamp>
                        </order>
                        <order trading-pair="1">
                            <size>0.015</size>
                            <price>33227</price>
                            <fee>0.6</fee>
                            <timestamp>1618709961</timestamp>
                        </order>
                        <order trading-pair="1">
                            <size>0.019</size>
                            <price>32217</price>
                            <fee>0.7</fee>
                            <timestamp>1618710961</timestamp>
                        </order>
                    </orders>
                </portfolio>
                <portfolio id="2">
                    <orders>
                        <order trading-pair="3">
                            <size>0.5</size>
                            <price>1800</price>
                            <fee>1.21</fee>
                            <timestamp>1618659531</timestamp>
                        </order>
                        <order trading-pair="2">
                            <size>9</size>
                            <price>202</price>
                            <fee>1.5</fee>
                            <timestamp>1618679531</timestamp>
                        </order>
                    </orders>
                </portfolio>
            </portfolios>
        </crypto-tracker>

        '), 'coinbase');


-- Custom xPath queries via XMLTABLE

-- 1) Finds all orders within the portfolio with ID 1

SELECT query.*
FROM crypto_orders_import_xml,
     XMLTABLE('crypto-tracker/portfolios/portfolio[@id=1]/orders/order' PASSING import_data
              COLUMNS trading_pair_id NUMBER PATH '@trading-pair',
                  order_size NUMBER PATH 'size',
                  price NUMBER PATH 'price',
                  order_fee NUMBER PATH 'fee',
                  timestamp NUMBER PATH 'timestamp'
         ) query
;

-- 2) Finds BTC orders within the portfolio with ID 1 with order size greater than 0.1

SELECT query.*
FROM crypto_orders_import_xml,
     XMLTABLE('//portfolios/portfolio[@id=1]/orders/order[@trading-pair=1 and size >= 0.015]' PASSING import_data
              COLUMNS trading_pair_id NUMBER PATH '@trading-pair',
                  order_size NUMBER PATH 'size',
                  price NUMBER PATH 'price',
                  order_fee NUMBER PATH 'fee',
                  timestamp NUMBER PATH 'timestamp'
         ) query
;

-- 3) Finds all USD trading pairs

SELECT query.*
FROM crypto_orders_import_xml,
     XMLTABLE('//trading-pairs/trading-pair[contains(currency, "USD")]' PASSING import_data
              COLUMNS currency VARCHAR(128) PATH 'currency',
                  symbol VARCHAR(128) PATH 'symbol',
                  name VARCHAR(128) PATH 'name'
         ) query
;

-- 4) Finds last orders of all portfolio imports

SELECT query.*
FROM crypto_orders_import_xml,
     XMLTABLE('//portfolios/portfolio/orders/order[last()]' PASSING import_data
              COLUMNS trading_pair_id NUMBER PATH '@trading-pair',
                  order_size NUMBER PATH 'size',
                  price NUMBER PATH 'price',
                  order_fee NUMBER PATH 'fee',
                  timestamp NUMBER PATH 'timestamp'
         ) query
;

-- 5) Finds all orders imported from Binance

SELECT query.*
FROM crypto_orders_import_xml,
     XMLTABLE('crypto-tracker/portfolios/portfolio/orders/order' PASSING import_data
              COLUMNS trading_pair_id NUMBER PATH '@trading-pair',
                  order_size NUMBER PATH 'size',
                  price NUMBER PATH 'price',
                  order_fee NUMBER PATH 'fee',
                  timestamp NUMBER PATH 'timestamp'
         ) query WHERE exchange = 'binance'
;

