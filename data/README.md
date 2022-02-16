# The `\data` Directory: Project Data Summary

In our project, we use the following data files and Application Programming Interfaces:

### Data files (TODO: Update/delete)
|Data File Name | Brief Description|
|---------------| -----------------|
|[homelessness-2007-2016.csv](./homelessness-2007-2016.csv) | 6 columns and 86,530 rows. Homelessness point in time data for the years 2007 to 2016, by area (or CoC) in the US and for a variety of different attributes. From Kaggle, user def love(x) |
|[homelessness-count-usa.csv](./homelessness-count-usa.csv) | 6 columns and 25,495 rows. Point in Time homelessness data for the US, by CoC and a variety of different atributes. Covers years 2014 and 2015. From Anchorage Open Data program |
| [pit-homeless-by-coc.csv](./pit-homeless-by-coc.csv) | 152 columns and 397 rows. Additional Point in Time homelessness data, including classification of each CoC. Covers years 2008, 2013, and 2018. From Georgia Geospacial Information Office |
| [combined_homeless.csv](./combined_homeless.csv) | 7 columns and 169068 rows. Combines data from each of three previous datasets and standardizes the naming of the columns. Code for this can be found in summary.R in source directory. More details on columns in the notes |

### Application Programming Interfaces (API) (TODO: Update/delete)

* **New York Times Books API**. The _New York Times_ provides data for Best

## Note: Combined Homeless Documentation
* coc_name - Name of the Continuum of Care (CoC, see Project Proposal, 4.0 Data)
* coc_num - Number for CoC, formatted as state abbreviation, dash, number
* state - Abbreviation for name of state where CoC is located
* coc_cat - Describes category of CoC, such as "Major City" or "Rural CoCs". When unavailable, con_cat is "x"
* year - The year the point in time data was collected
* attribute - The type of population that the observation represents, such as "Total Homeless" or "Unsheltered People in Family". Some are listed as abbreviations of this, with the year, such as "TOT_13" or "SH_TH_13".
* value - The number of individuals in that population.

# NOTE 1: About the `/data` Directory

* Use the `/data` directory to store any data that you using in your project (for example, CSV files)
* Edit this `README.md` file and summarize your data files
* If you are using APIs to access data, summarize them, providing specific information
* See examples above.

# NOTE 2:  Clear and Concise Documentation
* Please remember your audience (prospective employers, open source colleagues, TAs, Instructors). Therefore,
aim for clarity and conciseness.
* When done, be sure to delete these NOTE sections and the example CSV file (which are intended for you, of course, not your audience!)
