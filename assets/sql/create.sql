CREATE TABLE IF NOT EXISTS usuario(
    id              INTEGER PRIMARY KEY,
    nome            TEXT,
    email           TEXT,
    senha           TEXT,
    imagem          TEXT,
    saldo           REAL,
    minimo          REAL
);

CREATE TABLE IF NOT EXISTS carta(
    id              INTEGER PRIMARY KEY,
    nome            TEXT,
    serie           TEXT,
    titulo          TEXT,
    imagem          TEXT,
    estrelas        INTEGER,
    icone1          INTEGER,
    icone2          INTEGER
);
