# Personal Financial Control Databank

Relational database for personal financial control, plus a set of SQL queries that answer the questions from the assignment (TDE 4) of the **Database Architecture** course at PUC.

The database models users, accounts, financial assets, transactions, budgets/goals, investments and loans. The queries show how to read this data using joins, aggregations and filters.

## Repository structure

```
.
├── bank/
│   ├── create.sql                  # Creates the database structure (tables and constraints)
│   └── seed.sql                    # Populates the tables with sample data
└── queries/
    ├── accounts-and-users.sql      # Users and their accounts
    ├── recent-transactions.sql     # Most recent transactions
    ├── investments.sql             # Investments overview
    ├── loans.sql                   # Loans overview
    └── quotes.sql                  # Progress toward financial goals (deposited vs. target)
```

## Requirements

- A PostgreSQL server (the queries use `FILTER (WHERE ...)` in aggregates)
- Any SQL client: `psql`, DBeaver, pgAdmin or a VS Code SQL extension

## How to run

1. Create an empty database:

   ```sql
   CREATE DATABASE personal_financial_control;
   ```

2. Create the tables:

   ```bash
   psql -U your_user -d personal_financial_control -f bank/create.sql
   ```

3. Populate them with sample data:

   ```bash
   psql -U your_user -d personal_financial_control -f bank/seed.sql
   ```

4. Run any query from the `queries/` folder:

   ```bash
   psql -U your_user -d personal_financial_control -f queries/quotes.sql
   ```

## Queries

| File | What it answers |
| --- | --- |
| `accounts-and-users.sql` | Which accounts belong to each user |
| `recent-transactions.sql` | The latest transactions recorded |
| `investments.sql` | Investments and their related data |
| `loans.sql` | Loans and their status |
| `quotes.sql` | For each goal: amount deposited, target amount and progress in % |

## Concepts practiced

- `INNER JOIN` across multiple tables
- Aggregations with `SUM` and `GROUP BY`
- Conditional aggregation with `FILTER (WHERE ...)`
- Database structure scripts (DDL) and data population scripts (DML)

## Author

Maicon Quevedo, Software Engineering student at PUC.