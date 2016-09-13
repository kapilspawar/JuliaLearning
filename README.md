# JuliaLearning
Learning to write a simple trading strategy in Julia using Moving Averages Crossover. Ideally the MA Crossover itself should be one of the many indicators that can be provided out-of-the-box. Strategies can then be written on any of the published indicators.

Step 1: Visualization - Plot Nifty Closing prices along with 20d and 50d SMA.
![Nifty Spot](https://github.com/kapilspawar/JuliaLearning/blob/master/images/nifty_1000d.png?raw=true "Nifty Spot")

Step 2: Trade Generation
Generate trades based on the entries/exits provided by one or more technical indicators. Provide for transaction costs viz. slippage, brokerage, commissions, fees, taxes etc.

In MA crossover example, an entry will be taken on a price move above/below the close after the MA Crossover and exit on a high/low after MA crossover in the opposite direction. E.g. Add long position when faster MA crosses the slower MA on the upside and price closes above a previous high. And exit once the faster MA crosses the slower MA on the downside and price closes below a previous low. Also use a stop and reverse strategy. That means short positions will be initiated on closing longs and vice versa.

Step 3: Trading System Performance Statistics
Calculate the Trading System Performance based on the trades generated. To include:
a. Total profit, Profitability
b. Profit factor (Win/Loss ratio), Payout ratio (Avg. Win/Avg. Loss), Trade Expectancy
c. Total trades
d. Winning Percentage
e. Average trade
f. Maximum favorable excursion (MFE), Maximum adverse excursion (MAE)
g. Maximum Drawdown, Maximum Time to recovery
h. Sharpe ratio
i. Winning trades count, Average Winner, Max. Winner, Min. Winner
j. Losing trades count, Average Loser, Max. Loser, Min Loser
k. Maximum Winning streak, Maximum Losing streak

Step 4: Optimization
Optimize input parameters that make up the technical indicators and analyze trading system performance. Use 3d plotting for visualization.

In MA crossover example, optimize based on the duration of fast and slow moving averages.

Step 5: Monte Carlo Simulation
Using randomized simulated trade sequences to evaluate statistical properties of a trading system. Determine worst case losing streaks, drawdowns etc.