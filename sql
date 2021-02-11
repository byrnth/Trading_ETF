Create Table Stock(
#add columns
#independant numbering integer added as id
  id PRIMARY SYMBOL KEY
#make sure data not empty
  symbol TEXT NOT NULL
  name TEXT NOT NULL,
  exchange TEXT NOT NULL,
  #TRUe/FALSE
  is_ETF BOOLEAN NOT NULL,
    
);

CREATE TABLE etf_holding (  
    etf_id INTEGER NOT NULL,
    holding_id INTEGER NOT NULL,
    dt DATE NOT NULL,
    shares NUMERIC,
    weight NUMERIC,
    PRIMARY KEY (etf_td,holding_id,dt),
    CONSTRAINT fk_etf FOREIGN KEY (etf_id) REFERENCES stock (id),
    CONSTRAINT fk_holding FOREIGN KEY (holding_id) stock (id)
);

CREATE TABLE stock_price (  
    stock_id INTEGER NOT NULL,
    dt TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    open NUMERIC NOT NULL,
    high NUMERIC NOT NULL,
    low NUMERIC NOT NULL,
    close NUMERIC NOT NULL,
    volume NUMERIC NOT NULL,
    PRIMARY KEY (stock_id, dt),
    CONSTRAINT fk_stock FOREIGN KEY (stock_id) REFERENCES stock (id)
);

#index with date descending
CREATE INDEX ON stock_price (stock_id, dt DESC);
