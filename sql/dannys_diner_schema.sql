-- Create the schema for the week one challenge: Danny's Diner
CREATE SCHEMA IF NOT EXISTS dannys_diner;

-- Create sales table
CREATE TABLE IF NOT EXISTS dannys_diner.sales (
    customer_id TEXT,
    order_date DATE,
    product_id INTEGER
);

-- Create menu table
CREATE TABLE IF NOT EXISTS dannys_diner.menu (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    price NUMERIC
);

-- Create members table
CREATE TABLE IF NOT EXISTS dannys_diner.members (
    customer_id TEXT PRIMARY KEY,
    join_date DATE
);