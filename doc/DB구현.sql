-- drop user --
drop user date2 cascade;


-- create user --
create user date2 identified by date2 default tablespace users;


-- grant --
grant connect, resource to date2;


-- create table --
-- si
create table date2.si(
    si_id number(10) constraint si_id_pk primary key,
    si_name varchar2(18) constraint si_name_uk unique 
                         constraint si_name_nn not null
);

-- gu
create table date2.gu(
    gu_id number(10) constraint gu_id_pk primary key,
    gu_name varchar2(18) constraint gu_name_uk unique 
                         constraint gu_name_nn not null
);

-- place_group
create table date2.place_group(
    placegroup_id number(10) constraint placegroup_id_pk primary key,
    placegroup_name varchar2(30) constraint placegroup_name_uk unique
                                 constraint placegroup_name_nn not null
);

-- users
create table date2.users(
    user_id number(10) constraint users_userid_pk primary key,
    id varchar2(20) constraint users_id_uk unique
                    constraint users_id_nn not null,
    email varchar2(50) constraint users_email_nn not null,
    password varchar2(65) constraint users_password_nn not null,
    user_name varchar2(40) constraint users_username_nn not null,
    phone_number varchar2(12) constraint users_phonenumber_nn not null,
    nickname varchar2(18) constraint users_nickname_nn not null,
    birthday date,
    created_at date,
    updated_at date
);

-- admins
create table date2.admins(
    user_id number(10) constraint admins_id_fk references date2.users(user_id) on delete cascade
);

-- delete_users
create table date2.delete_users(
    user_id number(10) constraint deleteusers_id_fk references date2.users(user_id)
);

-- my_region
create table date2.my_regions(
    my_region_id number(10) constraint myregions_id_pk primary key,
    user_id number(10) constraint myregions_userid_fk references date2.users(user_id),
    si_id number(10) constraint myregions_siid_fk references date2.si(si_id),
    gu_id number(10) constraint myregions_guid_fk references date2.gu(gu_id)
);

-- places
create table date2.places(
    place_id number(10) constraint places_id_pk primary key,
    si_id number(10) constraint palces_siid_fk references date2.si(si_id), 
    gu_id number(10) constraint palces_guid_fk references date2.gu(gu_id),
    placegroup_id number(10) constraint places_placegroupid_fk references date2.place_group(placegroup_id) , --constratnts
    place_name varchar2(60) constraint places_placename_nn not null,
    introduction varchar2(600) constraint places_introduction_nn not null,
    views number(10),
    created_at date,
    updated_at date
);

-- place_images
create table date2.place_images(
    placeimage_id number(10) constraint placeimages_id_pk primary key,
    place_id number(10) constraint placeimages_placeid_fk references date2.places(place_id),
    file_name varchar2(100) constraint placeimages_filename_nn not null
);

-- details
create table date2.details (
	detail_id number(10) constraint details_id_pk primary key,
	place_id number(10) constraint details_placeid_fk references date2.places(place_id) on delete cascade,
	address varchar2(300) constraint details_address_nn not null,
	tel varchar2(12),
	opening_hours varchar2(6),
	closing_hours varchar2(6),
	dayoff varchar2(100),
	contact varchar2(50),
	parking number(1),
	created_at date,
	updated_at date
);

-- menus
create table date2.menus(
	menu_id number(10) constraint menus_id_pk primary key,
	place_id number(10) constraint menus_placeid_fk references date2.places(place_id) on delete cascade,
	menu_name varchar2 (150) constraint menus_menuname_nn not null,
	price number(12) constraint menus_price_nn not null
);

-- declarations
create table date2.declarations(
	declare_id number(10) constraint declarations_id_pk primary key,
    place_id number(10) constraint declarations_placeid_fk references date2.places(place_id),
    user_id number(10) constraint declarations_userid_fk references date2.users(user_id),
	content varchar2(1000) constraint declarations_content_nn not null,
	confirm number(1) constraint declarations_confirm_nn not null,
    created_at date
);

-- my_places
create table date2.my_places(
	my_place_id number(10) constraint myplaces_id_pk primary key,
	user_id number(10) constraint myplaces_userid_fk references date2.users(user_id),
	place_id number(10) constraint myplaces_placeid_fk references date2.places(place_id) on delete cascade
);

-- reviews
create table date2.reviews (
    review_id number(10) constraint reviews_id_pk primary key,
    place_id number(10) constraint reviews_placesid_fk references date2.places(place_id) on delete cascade,
    user_id number(10) constraint reviews_usersid_fk references date2.users(user_id),
    content varchar2(1500) constraint reviews_content_nn not null,
    star_rating number(10) constraint reviews_starrating_nn not null,
    created_at date
);

-- review_images
create table date2.review_images(
    reviewimages_id number(10) constraint reviewimages_id_pk primary key,
    review_id number(10) constraint reviewimages_reviewid_fk references date2.reviews(review_id),
    file_name varchar2(100) constraint reviewimage_filename_nn not null
);

-- feeds
create table date2.feeds(
	feed_id number(10) constraint feeds_id_pk primary key,
	user_id number(10) constraint feeds_userid_fk references date2.users(user_id),
    title varchar2(100) constraint feeds_title_nn not null,
	content varchar2(1500) constraint feeds_content_nn not null,
	created_at date
);

-- comments
create table date2.comments(
	comment_id number(10) constraint comment_id_pk primary key,
	feed_id number(10) constraint comment_feedid_fk references date2.feeds(feed_id) on delete cascade,
    user_id number(10) constraint comment_userid_fk references date2.users(user_id),
	content varchar2(1500) constraint comment_content_nn not null,
	created_at date
);

-- hashtags
create table date2.hashtags (
    hashtag_id number(10) constraint hashtags_id_pk primary key,
    feed_id number(10) constraint hashtags_feedid_fk references date2.feeds(feed_id) on delete cascade,
    tag varchar2(90)
);

-- feed_likes
create table date2.feed_likes (
    feedlike_id number(10) constraint feedlikes_id_pk primary key,
    feed_id number(10) constraint feedlikes_feedid_fk references date2.feeds(feed_id) on delete cascade,
    user_id number(10) constraint feedlikes_userid_fk references date2.users(user_id)                       
);

-- comment_likes
create table date2.comment_likes (
	commentlike_id number(10) constraint commentlikes_id_pk primary key,
	comment_id number(10) constraint commentlikes_commentid_fk references date2.comments(comment_id) on delete cascade,
    user_id number(10) constraint commentlikes_userid_fk references date2.users(user_id)
);


-- sequence create --
-- si
create sequence date2.si_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- gu
create sequence date2.gu_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- place_group
create sequence date2.placegroup_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- users
create sequence date2.users_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- my_regions
create sequence date2.myregions_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- places
create sequence date2.places_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- place_images
create sequence date2.placeimages_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- details
create sequence date2.details_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- menus
create sequence date2.menus_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;
    
-- declarations
create sequence date2.declarations_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- my_places
create sequence date2.myplaces_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- reviews
create sequence date2.reviews_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- reviewimages
create sequence date2.reviewimages_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- feeds
create sequence date2.feeds_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- comments
create sequence date2.comments_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- hashtags
create sequence date2.hashtags_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- feed_likes
create sequence date2.feedlikes_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;

-- comment_likes
create sequence date2.commentlikes_id_seq
	start with 1
	increment by 1
	nocache
	nocycle;


-- insert --
-- users
insert into date2.users values(date2.users_id_seq.nextval, 'user', 'a@b.com', 'user', 'ÃÖÇÑ¼®', '01075463543', 'ÇÑ¼®', '1998-01-02', sysdate, sysdate);
insert into date2.users values(date2.users_id_seq.nextval, 'user2', 'a@c.com', 'user2', 'ÇÑ¾Æ¸§', '01042345342', '¾Æ¸§', '1999-04-03', sysdate, sysdate);
insert into date2.users values(date2.users_id_seq.nextval, 'user3', 'a@d.com', 'user3', '±è¼±¿ì', '01025545242', '¼±¿ì', '1989-03-04', sysdate, sysdate);
insert into date2.users values(date2.users_id_seq.nextval, 'user4', 'a@e.com', 'user4', '±è½ÂÀÏ', '01025545242', '½ÂÀÏ', '1989-03-04', sysdate, sysdate);
insert into date2.users values(date2.users_id_seq.nextval, 'user5', 'a@f.com', 'user5', 'ÀÌ½Â¿ø', '01025545242', '½Â¿ø', '1989-03-04', sysdate, sysdate);

-- admins
insert all
    into date2.users values(date2.users_id_seq.nextval, 'admin', 'a@g.com', 'admin', '°æ¼­', '01036457459', 'adm1', '1997-08-05', sysdate, sysdate)
    into date2.admins values(date2.users_id_seq.currval)
    select * from dual;
insert all
    into date2.users values(date2.users_id_seq.nextval, 'admin2', 'a@h.com', 'admin2', '±èÇö¼º', '01047543534', 'adm2', '1996-02-04', sysdate, sysdate)
    into date2.admins values(date2.users_id_seq.currval)
    select * from dual;


commit;

