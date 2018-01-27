CREATE TABLE comments (
    num INTEGER PRIMARY KEY,
    parent INTEGER,
    timestamp INTEGER,
    lasthit INTEGER,
    ip TEXT,
    date TEXT,
    name TEXT,
    trip TEXT,
    email TEXT,
    subject TEXT,
    password TEXT,
    comment TEXT,
    image TEXT,
    size INTEGER,
    md5 TEXT,
    width INTEGER,
    height INTEGER,
    thumbnail TEXT,
    tn_width TEXT,
    tn_height TEXT
);

CREATE TABLE admin (
    num INTEGER PRIMARY KEY,
    type TEXT,
    comment TEXT,
    ival1 TEXT,
    ival2 TEXT,
    sval1 TEXT
);

CREATE TABLE proxy (
    num INTEGER PRIMARY KEY,
    type TEXT,
    ip TEXT,
    timestamp INTEGER,
    date TEXT
);