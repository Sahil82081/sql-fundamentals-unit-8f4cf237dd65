-- =========================================================
-- 1. Create loans table
-- =========================================================

CREATE TABLE IF NOT EXISTS loans (
    loan_id INTEGER PRIMARY KEY,
    member_name TEXT,
    book_title TEXT,
    borrow_date TEXT,
    days_borrowed INTEGER
);

-- =========================================================
-- 2. Insert six loans
-- INSERT OR IGNORE prevents duplicates when script runs twice
-- =========================================================

INSERT OR IGNORE INTO loans
    (loan_id, member_name, book_title, borrow_date, days_borrowed)
VALUES
    (1, 'Alice Brown', 'The Hobbit', '2025-04-01', 20),
    (2, 'Bella Chen', '1984', '2025-04-05', 18),
    (3, 'David Evans', 'Emma', '2025-04-07', 14),
    (4, 'Frank Green', 'Dune', '2025-04-08', 10),
    (5, 'Emily Ford', 'Beloved', '2025-04-10', 30),
    (6, 'Chris Adams', 'The Great Gatsby', '2025-04-12', 12);

-- =========================================================
-- 3. FIRST QUERY
-- =========================================================

SELECT
    loan_id,
    member_name,
    book_title,
    borrow_date,
    days_borrowed
FROM loans
ORDER BY days_borrowed DESC;

-- =========================================================
-- 4. Create the view
-- =========================================================

CREATE VIEW IF NOT EXISTS long_loans AS
SELECT
    member_name,
    book_title
FROM loans
WHERE days_borrowed > 14;

-- =========================================================
-- 5. SECOND QUERY
-- =========================================================

SELECT
    member_name,
    book_title
FROM long_loans
ORDER BY member_name;