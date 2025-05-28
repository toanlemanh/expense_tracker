CREATE TABLE IF NOT EXISTS icon (
  icon_id INTEGER PRIMARY KEY AUTOINCREMENT,
  icon_image_path TEXT,
  icon_title TEXT,
  icon_type TEXT
);

CREATE TABLE IF NOT EXISTS transaction_book (
  transaction_book_id INTEGER PRIMARY KEY AUTOINCREMENT,
  transaction_book_title TEXT NOT NULL,
  transaction_book_icon_id INTEGER NOT NULL,
  transaction_book_main_color TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS wallet (
  wallet_id INTEGER PRIMARY KEY AUTOINCREMENT,
  wallet_title TEXT,
  wallet_balance REAL,
  wallet_remark TEXT,
  wallet_icon_id INTEGER NOT NULL,
  wallet_main_color TEXT,
  is_wallet_trackable INTEGER,
  wallet_tracking_email TEXT
);

CREATE TABLE IF NOT EXISTS category (
  category_id INTEGER PRIMARY KEY AUTOINCREMENT,
  category_title TEXT NOT NULL,
  category_icon_id INTEGER NOT NULL,
  category_main_color TEXT NOT NULL,
  category_transaction_type INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS lmt_transaction (
  transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
  transaction_title TEXT,
  transaction_category_id INTEGER,
  transaction_wallet_id INTEGER,
  transaction_book_id INTEGER,
  transaction_amount REAL,
  transaction_created_datetime INTEGER,
  transaction_type INTEGER,
  is_transaction_wallet_transfer INTEGER,
  transaction_transfer_charge REAL,
  transaction_transfer_from_wallet_id INTEGER,
  transaction_transfer_to_wallet_id INTEGER
);

-- Insert into transaction_book
INSERT INTO transaction_book (transaction_book_title, transaction_book_icon_id, transaction_book_main_color)
VALUES
('Personal Finance', 2, '#FF5733');

-- Insert into wallet
INSERT INTO wallet (wallet_title, wallet_balance, wallet_remark, wallet_icon_id, wallet_main_color, is_wallet_trackable, wallet_tracking_email)
VALUES
('Main Wallet', 1000.00, 'My primary spending wallet', 1, '#4CAF50', 1, 'track@example.com');

-- Insert into category
INSERT INTO category (category_title, category_icon_id, category_main_color, category_transaction_type)
VALUES
('Food & Dining', 3, '#FFC107', 1),
('Income', 3, '#00C853', 2);

-- Insert into transaction
INSERT INTO lmt_transaction (
  transaction_title,
  transaction_category_id,
  transaction_wallet_id,
  transaction_book_id,
  transaction_amount,
  transaction_created_datetime,
  transaction_type,
  is_transaction_wallet_transfer,
  transaction_transfer_charge,
  transaction_transfer_from_wallet_id,
  transaction_transfer_to_wallet_id
)
VALUES
('Dinner at restaurant', 1, 1, 1, 25.50, strftime('%s','now'), 1, 0, 0.0, NULL, NULL),
('Monthly Salary', 2, 1, 1, 1500.00, strftime('%s','now'), 2, 0, 0.0, NULL, NULL);