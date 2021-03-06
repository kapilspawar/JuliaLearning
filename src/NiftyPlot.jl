using DataFrames, Requests, PyPlot

# Function for backwards-looking Moving Average. Source: http://stackoverflow.com/questions/34406691/how-to-add-a-column-of-simple-moving-average-of-another-column-to-a-julia-data-f
function ma(x::Vector{Float64}, wind::Int)
    len = length(x)
    y = Vector{Float64}(len)
    for i in 1:len
        if i < wind
            y[i] = NaN
        else
            y[i] = mean(x[i - wind + 1:i])
        end
    end
    return y
end

fastmabars = 20;
slowmabars = 50;
url = "https://raw.githubusercontent.com/kapilspawar/JuliaLearning/master/data/Nifty.csv"
r = Requests.get_streaming(url; timeout = 30.0)
if r.response.status / 100 != 2
    error("Error downloading data")
end
df0 = readtable(r, separator = ',', header = true)
df = tail(df0, 1000) # Restrict data to last 1000 days or approximately 4 years
date = df[:Date]
close = df[:Close]
volume = df[:Turnover_Rs_Cr_]
mafast = ma(convert(Array, close), fastmabars)
maslow = ma(convert(Array, close), slowmabars)

fig = figure("Nifty",figsize=(12,8))
ax1 = gca()
grid("on")
title("Nifty")
ylabel("Close")

dt = DateTime(date, "dd-uuu-yy")
p = plot_date(dt, close, color="blue", linestyle="-", marker="None", label="Close")

pmafast = plot_date(dt, mafast, color="green", linestyle="-", marker="None", label=string(fastmabars, "d MA"))
pmaslow = plot_date(dt, maslow, color="red", linestyle="-", marker="None", label=string(slowmabars, "d MA"))
legend(handles=[p; pmafast; pmaslow], loc="upper left")

ax2 = ax1[:twinx]() # Create another axis on top of the current axis
ax2[:set_ylim]([0, maximum(volume) * 5]) # Keep Volume bars to be no more than 20% of the total chart height
ylabel("Volume")
bar(dt, volume, color="black", align="center", label="Volume")
xlabel("Date")

savefig("nifty_1000d.png")
