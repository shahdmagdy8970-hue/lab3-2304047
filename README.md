# Lab 3 – Foreign Keys and Simple SQL

Introduction to Database Systems – Alexandria National University, Fall 2026

- Student:Shahd Magdy Abdelghany –  ID: 2304047

## Repository content

```
lab3-<student-id>/
  problem1_DDL.sql       # Problem 1: COMPANY database (tables, PKs, FKs)
  problem1_DML.sql       # Problem 1: INSERT queries (3 rows in each table)
  problem1_Answers.txt   # Problem 1: SQL + output/error for Q1.1 - Q1.3
  problem2_DDL.sql       # Problem 2: LIBRARY database (author, book)
  problem2_DML.sql       # Problem 2: seed data (3 authors, 6 books)
  website/               # Flask website (Lab 2 + the new library pages)
  README.md
```

## Requirements

- MySQL Server (the `mysql` client must work from the terminal)
- Python 3.10 or newer

## 1. Problem 1 – COMPANY database

Run from the repository folder (enter the MySQL root password when asked):

```bash
mysql -u root -p < problem1_DDL.sql
mysql -u root -p < problem1_DML.sql
```

The DDL starts with `DROP DATABASE IF EXISTS company;` so it can be re-run at any time.
The answers to Q1.1 - Q1.3 are in `problem1_Answers.txt`.

## 2. Problem 2 – LIBRARY database

```bash
mysql -u root -p < problem2_DDL.sql
mysql -u root -p < problem2_DML.sql
```

Tables: `author(author_id, name, country, photo)` and
`book(book_id, title, price, author_id, cover)`.
`book.author_id` is a foreign key to `author.author_id` with `ON DELETE CASCADE`,
so deleting an author deletes all of the author's books.

## 3. Run the website

The website also needs the Lab 2 database (`registration`: users and to-do list) and two small
extra tables in `library` (favorites and the featured book). Run these once, **after** step 2:

```bash
mysql -u root -p < website/lab2_schema.sql
mysql -u root -p < website/library_extra_tables.sql
```

> Note: re-running `problem2_DDL.sql` deletes the `library` database, so run
> `website/library_extra_tables.sql` again after it.

Then, from the repository folder:

```bash
cd website

# create and activate a virtual environment
python -m venv venv
venv\Scripts\activate            # Windows
# source venv/bin/activate       # Linux / macOS

pip install -r requirements.txt

# create the settings file
copy .env.example .env           # Windows
# cp .env.example .env           # Linux / macOS
```

Open `.env` and fill it in:

```
DB_HOST=localhost
DB_USER=root
DB_PASS=<your MySQL password>
DB_NAME_USERS=registration
DB_NAME_LIBRARY=library
SECRET_KEY=<any long random text>
ADMIN_EMAILS=<the email you will register with>
```

Start the server:

```bash
python app.py
```

Open http://127.0.0.1:5000 in the browser.

## 4. Using the website

1. Click **Register** and create an account.
   To get administrator rights, register with the same email you wrote in `ADMIN_EMAILS`
   (typed in English letters, exactly the same). Several admins can be separated by commas.
2. After login you land on the **Books** page:
   - **F2.1** – a table/list of all books (with the `author_id` of each book) and the list of authors.
   - **F2.2** – add a book and add an author (admin only).
   - **F2.3** – edit a book and edit an author (admin only).
   - **F2.4** – remove a book (admin only).
   - **F2.5** – remove an author; all of the author's books are removed too (admin only).
   - **Bonus** – upload a cover for a book and a photo for an author (PNG / JPG / JPEG / WEBP, max 5 MB).
3. Administrators also have an **Admin** button that opens `/admin` (statistics and shortcuts).
   Normal users can only view books and manage their own favorites; the server answers `403`
   if they try to change library data.
4. The **To-Do List** page (Lab 2) is available from the top menu.

## Notes

- Only a user whose email is in `ADMIN_EMAILS` can add, edit or delete library data
  (checked in the Flask backend, not only hidden in the HTML).
- The seed images used by `problem2_DML.sql` are in `website/static/images/`.
- Do not upload `.env` or `venv/` to GitHub (they are listed in `.gitignore`).

## Troubleshooting

| Problem | Fix |
|---|---|
| `Access denied for user 'root'` | `DB_PASS` in `.env` is wrong |
| `Unknown database 'library'` / `'registration'` | run the SQL scripts of steps 2 and 3 |
| `Table 'library.favorites' doesn't exist` | run `website/library_extra_tables.sql` |
| `403 - You do not have permission` | your login email is not exactly the one in `ADMIN_EMAILS`; fix `.env`, restart the server, log out and log in again |
