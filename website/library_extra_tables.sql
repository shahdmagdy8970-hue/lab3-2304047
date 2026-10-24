USE library;

CREATE TABLE IF NOT EXISTS favorites (
    favorite_id INT NOT NULL AUTO_INCREMENT,
    user_id     INT NOT NULL,
    book_id     INT NOT NULL,
    PRIMARY KEY (favorite_id),
    UNIQUE KEY uq_user_book (user_id, book_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS library_settings (
    setting_key   VARCHAR(50) NOT NULL,
    setting_value VARCHAR(255),
    PRIMARY KEY (setting_key)
);
