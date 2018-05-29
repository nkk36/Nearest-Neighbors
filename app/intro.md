# Similar Government Contractors

## Introduction
This is a web application that gives the results of implementing k-nearest neighbors on government contracting data. Features considered for finding neighbors include NAICS codes, product/service codes, and the funding agency. Click [here](https://www.census.gov/eos/www/naics/) if you'd like to read more about NAICS codes or [here](https://www.acquisition.gov/PSC_Manual) if you'd like to learn about PSC codes. 

## How To Use This App

To see the results, click on the "Dashboard" icon on the left side menu. First, search for a company in the left sidebar. After selecting a company a table will display that shows the total revenue the company recieved from the government in FY16 and total actions. Use this information to help select other inputs on the sidebar. For example, if a company made \$15,000,000 on 10 actions in FY16 you could select \$10,000,000 - \$20,000,000 as the range for revenue and 5 - 15 as the range for the number of actions. Feel free to experiment with these inputs. Click the update button once all inputs have been chosen. 

<!-- 1. All Contractors - this lists all of the contractors in the full data set by their name and DUNS number. **Use the search feature to see if a contractor is in the full data set and, if so, determine what cluster it is in. Then you can use the drop down input in the side bar menu to see the companies in the cluster.** -->
1. contractor_rev_act_table - this is a fixed table that just lists the number of companies in each cluster
2. contractor_nn_table - this lists the contractors in the chosen cluster. 

## Data
The data comes from U.S. governemnt spending data found on  [USA Spending](https://www.usaspending.gov/Pages/Default.aspx). Details on how to download the data can be found [here](https://www.usaspending.gov/DownloadCenter/Pages/default.aspx) or on the [beta version](https://beta.usaspending.gov) of USA Spending that's still currently in development.

## Methodology
This application use [K-Nearest Neighbors](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm) to find the most similar government contractors of a chosen company after applying [Principal Component Analysis](https://en.wikipedia.org/wiki/Principal_component_analysis) (PCA) for dimensionality reduction. 

## Code
To see the underlying code for this application, please see the [GitHub repo](https://github.com/nkk36/Nearest-Neighbors).

## Limitations and Future Updates
If you are interested in contributing or have any questions/suggestions feel free to email me at <nkallfa36@gmail.com>.

