# Walmart Sales & Business Insights – SQL & Python Analysis

_Analyzing Walmart’s sales, payment methods, customer ratings, and revenue trends using SQL and Python to support business strategy and decision-making._

---

## Table of Contents
- <a href="#overview">Overview</a>  
- <a href="#business-problem">Business Problem</a>  
- <a href="#dataset">Dataset</a>  
- <a href="#tools--technologies">Tools & Technologies</a>  
- <a href="#project-structure">Project Structure</a>  
- <a href="#data-cleaning--preparation">Data Cleaning & Preparation</a>  
- <a href="#exploratory-data-analysis-eda">Exploratory Data Analysis (EDA)</a>  
- <a href="#research-questions--key-findings">Research Questions & Key Findings</a>  
- <a href="#how-to-run-this-project">How to Run This Project</a>  
- <a href="#final-recommendations">Final Recommendations</a>  
- <a href="#author--contact">Author & Contact</a>  

---

<h2><a class="anchor" id="overview"></a>Overview</h2>

This project provides an in-depth analysis of Walmart’s retail operations. Using **SQL** and **Python**, the analysis answers critical business questions related to sales performance, customer preferences, profitability, and operational efficiency.  

---

<h2><a class="anchor" id="business-problem"></a>Business Problem</h2>

The retail industry faces challenges in understanding customer behavior, optimizing inventory, and improving profitability. This project addresses:  
- Customer preferences in **payment methods**  
- Branch-level **category performance**  
- Identifying **peak sales days & shifts**  
- Measuring **category profitability**  
- Detecting **branches with revenue decline**  

---

<h2><a class="anchor" id="dataset"></a>Dataset</h2>

- Walmart transactional data (sales, payments, ratings, categories, revenue)  
- Structured in a relational database (`walmart` table)  
- Columns include: `branch`, `city`, `category`, `payment_method`, `quantity`, `unit_price`, `total`, `profit_margin`, `rating`, `date`, `time`  

---

<h2><a class="anchor" id="tools--technologies"></a>Tools & Technologies</h2>

- **SQL (MySQL)** → Joins, Aggregations, Window Functions, CTEs  
- **Python** → Pandas, SQLAlchemy, PyMySQL  
- **Visualization** → Power BI / Matplotlib / Seaborn (optional)  
- **Documentation** → GitHub, PDF Report  

---

<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>


---

<h2><a class="anchor" id="data-cleaning--preparation"></a>Data Cleaning & Preparation</h2>

- Converted `date` field into proper **datetime** format  
- Extracted **day names** and **shifts** from `date` & `time`  
- Derived `total_profit = unit_price × quantity × profit_margin`  
- Removed rows with missing or invalid values  

---

<h2><a class="anchor" id="exploratory-data-analysis-eda"></a>Exploratory Data Analysis (EDA)</h2>

- **Payment Analysis**: Identified most common methods & item quantities sold  
- **Ratings Distribution**: Analyzed branch/category ratings  
- **Revenue Trends**: Year-over-year revenue comparisons (2022 vs 2023)  
- **Shift Sales**: Morning vs Afternoon vs Evening patterns  
- **Profitability**: High vs low-profit categories  

---

<h2><a class="anchor" id="research-questions--key-findings"></a>Research Questions & Key Findings</h2>

1. **Payment Methods**: Credit cards dominate, but significant sales from e-wallets too  
2. **Highest-Rated Categories**: Differ per branch; localized promotion strategy recommended  
3. **Busiest Days**: Peak transactions on weekends; staffing adjustments needed  
4. **Quantity Sold by Payment**: Cash transactions showed lower ticket sizes than cards  
5. **Ratings by City**: Regional differences highlight need for city-specific strategies  
6. **Profit by Category**: Electronics and Health products yield highest profits  
7. **Preferred Payment per Branch**: Digital wallets dominate in metro branches  
8. **Shift Analysis**: Evening sales strongest, morning sales weakest  
9. **Revenue Decline Branches**: Identified 5 branches with significant YoY revenue drops  

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Visual Studio Code (VS Code), Python, SQL (MySQL and PostgreSQL)
   - **Goal**: Create a structured workspace within VS Code and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
      - Use the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into your project.

### 3. Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
   - **Storage**: Save the data in the `data/` folder for easy reference and access.

### 4. Install Required Libraries and Load Data
   - **Libraries**: Install necessary Python libraries using:
     ```bash
     pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
     ```
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Load Data into MySQL and PostgreSQL
   - **Set Up Connections**: Connect to MySQL and PostgreSQL using `sqlalchemy` and load the cleaned data into each database.
   - **Table Creation**: Set up tables in both MySQL and PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
   - **Documentation**: Keep clear notes of each query's objective, approach, and results.

### 10. Project Publishing and Documentation
   - **Documentation**: Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.
   - **Project Publishing**: Publish the completed project on GitHub or any other version control platform, including:
     - The `README.md` file (this document).
     - Jupyter Notebooks (if applicable).
     - SQL query scripts.
     - Data files (if possible) or steps to access them.

---

## Requirements

- **Python 3.8+**
- **SQL Databases**: MySQL, PostgreSQL
- **Python Libraries**:
  - `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`, `psycopg2`
- **Kaggle API Key** (for data downloading)

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url>
   ```
2. Install Python libraries:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your Kaggle API, download the data, and follow the steps to load and analyze.

---

## Project Structure

---

WALMART-SALES-DATA-ANALYSIS/
│
├── my_env/                       # Virtual environment (not uploaded to GitHub)
├── .gitignore                    # Git ignore file
├── README.md                     # Project documentation
├── requirements.txt              # Python dependencies
├── MySQL Queries.sql             # SQL queries for analysis
├── project.ipynb                 # Jupyter notebook for analysis & visualization
├── Walmart Business Problems.pdf # Business questions & objectives
├── walmart_clean_data.csv        # Cleaned dataset
├── Walmart.csv                   # Raw dataset
└── walmart-10k-sales-datasets.zip# Compressed dataset

---


## Results and Insights

This section will include your analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

## Future Enhancements

Possible extensions to this project:
- Integration with a dashboard tool (e.g., Power BI or Tableau) for interactive visualization.
- Additional data sources to enhance analysis depth.
- Automation of the data pipeline for real-time data ingestion and analysis.

---

## License

This project is licensed under the MIT License. 

---

## Acknowledgments

- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.

---
<h2><a class="anchor" id="author--contact"></a>Author & Contact</h2>

Balaji
Aspiring Data Analyst | Fresher  
Email: balaji.analytics2k@gmail.com  
GitHub: https://github.com/MrCoder2K  

*About Me:*  
- Recently completed hands-on projects in **SQL, Python, and Power BI**  
- Strong interest in **data analysis, business intelligence, and visualization**  
- Currently building a portfolio of **real-world analytics projects**  
- Open to **internship and entry-level opportunities** in data analytics

