psql --username=freecodecamp --dbname=postgres
create database universe;
\c universe;

create table galaxy(galaxy_id serial not null primary key,
                    galaxy_name varchar(30) unique not null,
                    galaxy_type varchar(20),
                    galaxy_mass numeric(50,3),
                    galaxy_description text,
                    galaxy_velocity int,
                    galaxy_age int);

create table planet(planet_id serial not null primary key,
                    planet_name varchar(30) unique not null,
                    planet_type varchar(20),
                    planet_weight numeric(20,3),
                    planet_description text,
                    planet_radius int,
                    planet_age int,
                    has_life boolean,
                    has_water boolean,
                    star_id int foreign key references star(star_id));
                    
create table star(star_id serial not null primary key,
                  star_name varchar(30) unique not null,
                  star_type varchar(20),
                  star_weight numeric(20,3),
                  star_description text,
                  star_radius int,
                  star_age int,
                  galaxy_id int foreign key references galaxy(galaxy_id));

create table moon(moon_id serial not null primary key,
                  moon_name varchar(30) unique not null,
                  moon_type varchar(20),
                  moon_weight numeric(20,3),
                  moon_description text,
                  moon_radius int,
                  moon_age int,
                  has_life boolean,
                  has_water boolean,
                  planet_id int foreign key references planet(planet_id));

create table blackhole(blackhole_id serial not null primary key,
                  blackhole_name varchar(30) unique not null,
                  blackhole_description text,
                  blackhole_radius int,
                  blackhole_age int,
                  galaxy_id int foreign key references galaxy(galaxy_id));