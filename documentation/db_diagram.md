# Database diagram

Diagrama feito no dbdiagram

Link: https://dbdiagram.io/d/Repertoire-Manager-65db7e6f5cd0412774c3b7d3


```
Table periods {
  id int [pk]
  name varchar [not null, unique]
  start_year int [not null]
  end_year int [not null]
}

Table instruments {
  id int [pk]
  name varchar [not null, unique]
}

Table genres {
  id int [pk]
  name varchar [not null, unique]
}

Table composers {
  id int [pk]
  name int [not null, unique]
  period_id int [ref: > periods.id]
  genre_id int [ref: > genres.id]
}

Table pieces {
  id int [pk]
  title varchar [not null]
  opus varchar
  number varchar
  other_identifier varchar
  start_date date
  finish_date date
  difficulty_level int
  status int [default: 0]
  notes text
  user_id int [ref: > users.id]
  composer_id int [ref: > composers.id]
  instrument_id int [ref: > instruments.id]
  period_id int [ref: > periods.id]
  genre_id int [ref: > genres.id]
}

Table users {
  id int [pk]
  username varchar [not null, unique]
  email varchar [not null, unique]
  password varchar [not null, unique]
}
```




![alt text](<Repertoire Manager.png>)