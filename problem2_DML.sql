
USE library;

INSERT INTO author (name, country, photo) VALUES
    ('Naguib Mahfouz', 'Egypt', 'naguib.jpg'),
    ('Agatha Christie', 'United Kingdom', 'agatha.jpg'),
    ('Paulo Coelho', 'Brazil', 'paulo.jpg');

INSERT INTO book (title, price, author_id, cover) VALUES
    ('Palace Walk', 15.50, 1, 'palace_walk.jpg'),
    ('Midaq Alley', 12.00, 1, 'midaq_alley.jpg'),
    ('Murder on the Orient Express', 18.75, 2, 'orient_express.jpg'),
    ('And Then There Were None', 16.00, 2, 'and_then_there_were_none.jpg'),
    ('The Alchemist', 14.25, 3, 'the_alchemist.jpg'),
    ('Eleven Minutes', 13.00, 3, 'eleven_minutes.jpg');
