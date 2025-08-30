import pandas as pd

data = {
    'OrderID': [101, 102, 103, 104, 105, 106, 107, 108],
    'Product': ['Laptop', 'Mouse', 'Laptop', 'Keyboard', 'Monitor', 'Mouse', 'Monitor', 'Laptop'],
    'Region': ['North', 'East', 'South', 'West', 'North', 'East', 'West', 'South'],
    'Quantity': [2, 10, 1, 3, 4, 7, 2, 1],
    'Price': [50000, 700, 52000, 1200, 8000, 650, 8500, 54000]
}

df = pd.DataFrame(data)
df['Total'] = df['Quantity'] * df['Price']
print("Sales Data:\n", df)
# 1. Total sales
print("\nTotal Sales (₹):", df['Total'].sum())

# 2. Sales by region
print("\nSales by Region:\n", df.groupby('Region')['Total'].sum())

# 3. Best-selling product
best_product = df.groupby('Product')['Quantity'].sum().idxmax()
print("\nBest-Selling Product:", best_product)

# 4. Highest order value
highest_order = df.loc[df['Total'].idxmax()]
print("\nHighest Order:\n", highest_order)
import matplotlib.pyplot as plt
import seaborn as sns

# Bar Chart: Sales by Region
region_sales = df.groupby('Region')['Total'].sum()
plt.figure(figsize=(6, 4))
region_sales.plot(kind='bar', color=['#FF7F50', '#6A5ACD', '#20B2AA', '#FFD700'])
plt.title('Sales by Region')
plt.xlabel('Region')
plt.ylabel('Total Sales (₹)')
plt.tight_layout()
plt.show()
# Pie Chart: Product Share
product_sales = df.groupby('Product')['Total'].sum()
plt.figure(figsize=(6, 6))
product_sales.plot(kind='pie', autopct='%1.1f%%', startangle=140)
plt.title('Sales Share by Product')
plt.ylabel('')
plt.tight_layout()
plt.show()

# Heatmap: Correlation
plt.figure(figsize=(6, 4))
sns.heatmap(df.corr(numeric_only=True), annot=True, cmap="coolwarm", fmt=".2f")
plt.title('Correlation Heatmap')
plt.tight_layout()
plt.show()

df.to_csv("final_sales_report.csv", index=False)
print("\nFinal Sales Report saved as final_sales_report.csv")
df.to_csv("final_sales_report.csv", index=False)
print("\nFinal Sales Report saved as final_sales_report.csv")