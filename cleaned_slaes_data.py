import pandas as pd

# Load CSV
df = pd.read_csv("cleaned_sales_data.csv")

# Total Sales per City
print(df.groupby('City')['Total_Sale_Amount'].sum().sort_values(ascending=False))

# Top 5 Products
print(df.groupby('Product_Name')['Total_Sale_Amount'].sum().sort_values(ascending=False).head(5))

# Orders with Discount > 20%
print(df[df['Discount_Percent']>20][['Order_ID','Customer_Name','Product_Name','Discount_Percent','Total_Sale_Amount']])

# Average Rating per Category
print(df.groupby('Product_Category')['Customer_Rating'].mean())

# Monthly Sales Trend
month_order = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
monthly_sales = df.groupby('Month_Name')['Total_Sale_Amount'].sum().reindex(month_order)
print(monthly_sales)

# Returned Orders by City
print(df[df['Delivery_Status']=='Returned'].groupby('City')['Order_ID'].count())