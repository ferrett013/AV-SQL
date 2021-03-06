drop table if exists partner_profiles.afl_cio_map;
create table partner_profiles.afl_cio_map as
select b.name as countyname, coalesce(column2,0) as mem_count, geom from shapefiles.counties b 
left join (
        select * from (values ('Adams', 26142),
('Alamosa', 324),
('Arapahoe', 27620),
('Archuleta', 210),
('Baca', 62),
('Bent', 59),
('Boulder', 5689),
('Broomfield', 2213),
('Chaffee', 545),
('Cheyenne', 16),
('Clear Creek', 321),
('Conejos', 221),
('Costilla', 66),
('Crowley', 89),
('Custer', 155),
('Delta', 884),
('Denver', 26515),
('Dolores', 31),
('Douglas', 11357),
('Eagle', 438),
('El Paso', 16507),
('Elbert', 1392),
('Fremont', 1774),
('Garfield', 789),
('Gilpin', 145),
('Grand', 301),
('Gunnison', 235),
('Hinsdale', 11),
('Huerfano', 246),
('Jackson', 19),
('Jefferson', 28132),
('Kiowa', 14),
('Kit Carson', 83),
('La Plata', 737),
('Lake', 227),
('Larimer', 7868),
('Las Animas', 1167),
('Lincoln', 78),
('Logan', 665),
('Mesa', 4843),
('Mineral', 19),
('Moffat', 914),
('Montezuma', 370),
('Montrose', 1185),
('Morgan', 1406),
('Otero', 706),
('Ouray', 63),
('Park', 670),
('Phillips', 25),
('Pitkin', 113),
('Prowers', 191),
('Pueblo', 12662),
('Rio Blanco', 156),
('Rio Grande', 242),
('Routt', 504),
('Saguache', 76),
('San Juan', 17),
('San Miguel', 61),
('Sedgwick', 55),
('Summit', 471),
('Teller', 633),
('Washington', 79),
('Weld', 8783),
('Yuma', 83)) a
) a on b.name=a.column1
order by 1
;
select * from partner_profiles.afl_cio_map