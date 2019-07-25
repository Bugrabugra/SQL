create table product_segment (
    id serial primary key,
    segment varchar not null,
    discount numeric(4, 2)
);


insert into product_segment
    (segment, discount)
values
    ('Grand Luxury', 0.05),
    ('Luxury', 0.06),
    ('Mass', 0.1);


create table product (
    id serial primary key,
    name varchar   not null,
    price numeric(10, 2),
    net_price numeric(10, 2),
    segment_id int not null,
    foreign key (segment_id)
        references product_segment (id)
);


insert into product
    (name, price, segment_id)
values
    ('vestibulum aliquet', 228.55, 3),
    ('lacinia erat', 366.45, 2),
    ('scelerisque quam turpis', 145.33, 3),
    ('justo lacinia', 551.77, 2),
    ('ultrices mattis odio', 261.58, 3),
    ('hendrerit', 519.62, 2),
    ('in hac habitasse', 843.31, 1),
    ('orci eget orci', 254.18, 3),
    ('pellentesque', 427.78, 2),
    ('sit amet nunc', 936.29, 1),
    ('sed vestibulum', 910.34, 1),
    ('turpis eget', 208.33, 3),
    ('cursus vestibulum', 985.45, 1),
    ('orci nullam', 841.26, 1),
    ('est quam pharetra', 896.38, 1),
    ('posuere', 575.74, 2),
    ('ligula', 530.64, 2),
    ('convallis', 892.43, 1),
    ('nulla elit ac', 161.71, 3);


update product
set net_price = price - price * product_segment.discount
from product_segment
where product.segment_id = product_segment.id;


select *
from product;