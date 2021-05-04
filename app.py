'''
Source:
Author: Raja CSP
'''
from flask import Flask, render_template, request
import random
import json
import yfinance as yf
import datetime
import math

app  = Flask(__name__)
PORT = 3009

    
@app.route("/", methods=["GET","POST"])
def startpy():

    
    return render_template("index.html")




@app.route("/get/output", methods=["GET","POST"])
def get_profit_by_price():


    ticker = request.values.get("ticker")
    price  = request.values.get("amount")

    stock  = yf.Ticker(ticker)
    price = int(price)
    start = datetime.datetime(2021, 1, 4) 
    end   = datetime.datetime(2021, 1, 17) 

    history = stock.history(start = start, end = end)

    history.reset_index(drop=True, inplace=True)

    start_price = history['Close'].iloc[0]
    end_price   = history['Close'].iloc[-1]

    if(start_price > price ):
        return None

    units       =  price // start_price 

    # print("No of shares ",units)

    profit      = end_price-start_price

    total_profit = profit * units

    # return total_profit
    return render_template("index.html", result = total_profit)


if __name__ == "__main__":
    app.run( debug = True,host="0.0.0.0",port = PORT)