create table credentials
    (   user_id   number(7) not null,
        user_name     VARCHAR(100) unique,
        pass_word  VARCHAR(20) ,
        role        VARCHAR(20),
        
        constraint crd_pk primary key (user_id),
        constraint crd_chk CHECK ( role IN ('subscriber','admin', 'hr'))) ;


comment on column credentials.user_id is 'Primary key of credentials tabel';
comment on column credentials.user_name is ' Email Id of user';
comment on column credentials.pass_word is 'The Password of user';
comment on table credentials is 'Credentials Information';
comment on column credentials.role is 'the role of the user (subscriber,admin, hr)';

create table countries
    ( country_id    number(7)   not null,
      country_name  varchar(100)   not null,
      constraint country_pk primary key (country_id));
      
comment on column countries.country_id is 'Primary key of country table';
comment on column countries.country_name is 'Country name. not null column  ';
comment on table countries is 'Country Infrormation';


create table hobbies (
       hobby_id   number(7)   not null , 
       hobby_name  varchar(100)  not null , 
       
       constraint hobby_id_pk primary key(hobby_id));
      
comment on column hobbies.hobby_id is 'Primary key of Hobby_Id table';
comment on column hobbies.hobby_name is 'Hobby name. not null column ';
comment on table hobbies is 'Hobbies Information' ;


create table home_skills (
        skill_id     number(7)   not null, 
        skill_name   varchar(100)   not null, 
        
        constraint hskills_id_pk primary key(skill_id)   );

comment on column home_skills.skill_id is 'Primary key of Home_Skills table';
comment on column home_skills.skill_name is 'A not null column that shows the skill name ';
comment on table home_skills is 'Home Skills Information ' ;


  CREATE TABLE RELIGIONS
   (	RELIGION_ID    NUMBER(1,0) NOT NULL , 
      RELIGION_NAME  VARCHAR(50 BYTE) NOT NULL, 
      
      CONSTRAINT REL_PK PRIMARY KEY (RELIGION_ID),
      CONSTRAINT rel_chk CHECK ( RELIGION_NAME IN ('Islam','Christian', 'Jewish'))) ;
      
      
comment on column religions.religion_id is 'Primary key of the Religion table ';
comment on column religions.religion_name is 'A not null column that shows the Religion Name, Islam or Christian ';
comment on table religions is ' Religions Information, Its ID and Name '; 
    


CREATE TABLE profiles (
    user_id NUMBER(7) NOT NULL,
    FIRST_NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50) NOT NULL,
    BIRTHDATE DATE NOT NULL,
    GENDER VARCHAR(1) NOT NULL,
    EDUCATION VARCHAR(50) NOT NULL,
    JOB VARCHAR(50) NOT NULL,
    INCOME NUMBER(38) NOT NULL,
    NATIONALITY NUMBER(7) NOT NULL,
    RESIDENCE NUMBER(7) NOT NULL,
    RELIGION_ID NUMBER NOT NULL,
    MARRIAGES_COUNT NUMBER(2) NULL,
    DIVORCES_COUNT NUMBER(2) NULL,

    CONSTRAINT GENDER CHECK (gender in ('M','F')),
    CONSTRAINT PROF_PK PRIMARY KEY (user_ID),
    CONSTRAINT PROF_REL_FK FOREIGN KEY (RELIGION_ID)
        REFERENCES RELIGIONS(RELIGION_ID),
    CONSTRAINT PROF_NAT_FK FOREIGN KEY (NATIONALITY)
        REFERENCES COUNTRIES(COUNTRY_ID),
    CONSTRAINT PROF_RES_FK FOREIGN KEY (RESIDENCE)
        REFERENCES COUNTRIES(COUNTRY_ID),
        CONSTRAINT PROF_CRED_FK FOREIGN KEY (user_ID)
        REFERENCES credentials(user_ID));
  

comment on column profiles.user_id is 'Primary key of profiles table and Forgein key to user_id column in credentials table';
comment on column profiles.first_name is 'The users First Name';
comment on column profiles.last_name is 'The users Last Name';
comment on column profiles.birthdate is ' The BirthDate of the user';
comment on column profiles.gender is ' A not null column that describes the users gender male or female ';
comment on column profiles.education is ' A not null column that tells the education of each user ';
comment on column profiles.job is 'Current job of the user';
comment on column profiles.income is 'Monthly Income of user ';
comment on column profiles.nationality is 'Shows the user nationality. Forgein key to country_id column in the countries table';
comment on column profiles.RESIDENCE is 'Describes where is the residence for each user. Forgein key to country_id column in the countries table';
comment on column profiles.religion_id is 'The users religion. Forgein key to religion_id column in the religions table';
comment on column profiles.MARRIAGES_COUNT is 'The Marriages number of the user';
comment on column profiles.DIVORCES_COUNT is 'The divorces number of the user';
comment on table profiles is 'Users Profiles information';



create table family_status
    (   user_id            number(7) not null,
        num_siblings  number(2) null,
        order_betwn_siblings  number(2)  null,
        
        constraint fam_stat_pk primary key (user_id),
        constraint family_fk foreign key (user_id)
        references profiles(user_id));
           
comment  on column family_status.user_id is 'Primary key of Family Status Table and Forgein key to user_id column of the profile table';
comment  on column family_status.num_siblings is 'The number of siblings';
comment  on column family_status.order_betwn_siblings is 'The users order among his/her siblings';
comment on table family_status is 'The User Family Status Information';


create table fashion (
        user_id      number(7)   not null ,
        style   VARCHAR(50)    null , 
        hijab    VARCHAR(50)   null , 
        
        constraint fashion_id_pk primary key(user_id) , 
        CONSTRAINT chk_hijab CHECK (hijab IN ('hijabi', 'nonhijabi', 'montakeba' , 'male')),
        constraint chk_style CHECK ( style IN ('casual', 'formal', 'semi formal','sports wear','old money','classic' , 'gothic')),
         constraint fash_fk foreign key (user_id)
        references profiles(user_id));
        


comment on column fashion.user_id is 'Primary key of fashion table and Foreign key to user_id column of the profile table';
comment on column fashion.style is 'describes the style of user if its casual, formal, semi-formal, sports-wear, old-money, classic, gothic';
comment on column fashion.hijab is 'Show if the user is (hijabi, nonhijabi, montakeba, male)';



create table relationship   
    (  user_id           number(7) not null,
      status        VARCHAR(50)  null,
      partners_num  number(2) null,
      children_num  number(2) null,
      kid_wish      VARCHAR(1)   null,
      
      constraint relation_pk primary key (user_id),
      constraint wish  check (kid_wish in ('Y','N') ),
      constraint options check (status in('single', 'married', 'divorced', 
                                          'widowed', 'engaged')),
      constraint rel_fk foreign key (user_id)
        references profiles(user_id) );

comment on column relationship.user_id is 'Primary key of relationship tabel and Foreign key to user_id column of the profile table';
comment on column relationship.status is 'Checks the user status single, married, divorced, widowed or engaged';
comment on column relationship.partners_num is 'The number of users partners ';
comment on column relationship.children_num is 'The user childern number if exits';
comment on column relationship.kid_wish is 'shows the user desire for having children';
comment on table relationship is ' Relationship Infromation of user';



create table social_class (
         user_id            number(7)    not null , 
         user_class         VARCHAR(2CHAR)      not null , 
         bank_balance  number(38)   not null ,
         car_type      VARCHAR(100)    null ,
         
         constraint class_id_pk primary key(user_id),
         constraint sclas_fk foreign key (user_id)
        references profiles(user_id) );

comment on column social_class.user_id is 'Primary key of social class tabel and Foreign key to user_id column of the profile table';
comment on column social_class.user_class is 'A not null column that tells which social class the user belong to';
comment on column social_class.bank_balance is 'Show the amount of money that user have in bank account';
comment on column social_class.car_type is 'Describes the type of user car';
comment on table social_class is 'Social Class Information';




CREATE TABLE user_hobbies (
    user_id  NUMBER(7) NOT NULL,
    hobby_id NUMBER(7) NOT NULL,

    CONSTRAINT hobbies_user_id_fk FOREIGN KEY (user_id) REFERENCES profiles (user_id),
    CONSTRAINT hobbies_hobby_id_fk FOREIGN KEY (hobby_id) REFERENCES hobbies (hobby_id),
    CONSTRAINT unique_user_hobby UNIQUE (user_id, hobby_id)
);

COMMENT ON COLUMN user_hobbies.user_id IS 'Foreign key for user_id column of profile table';
COMMENT ON COLUMN user_hobbies.hobby_id IS 'Foreign key for hobby_id column of hobby_id table';
COMMENT ON TABLE user_hobbies IS 'The User Hobbies Information';


CREATE TABLE user_home_skills (
    user_id  NUMBER(7) NOT NULL,
    skill_id NUMBER(7) NOT NULL,

    CONSTRAINT pk_user_home_skills PRIMARY KEY (user_id, skill_id),
    CONSTRAINT home_user_id_fk FOREIGN KEY (user_id) REFERENCES profiles (user_id),
    CONSTRAINT home_skills_id_fk FOREIGN KEY (skill_id) REFERENCES home_skills (skill_id)
);

COMMENT ON COLUMN user_home_skills.user_id IS 'Primary key and Foreign key referencing user_id column in the profile table';
COMMENT ON COLUMN user_home_skills.skill_id IS 'Primary key and Foreign key referencing skill_id column in the home_skills table';
COMMENT ON TABLE user_home_skills IS 'Home Skills Information for the User';


create table character 
  ( user_id     number(7)   not null,
    skin_color  VARCHAR(40)     null,
    height      number(3)    null,
    weight      number(3)    null,
    eye_color   VARCHAR(50)    null,
    hair_color  VARCHAR(50)    null,
    hair_length VARCHAR(50)    null,
    hair_type   VARCHAR(50)   null,
    mustache    VARCHAR(1)     null,
    beard       VARCHAR(1)    null,
    eye_glasses VARCHAR(1)    null,
    
    CONSTRAINT char_user_pk PRIMARY KEY (user_id),
    constraint char_id_fk foreign key (user_id) references PROFILES(user_id) ,
    constraint y_n check (mustache in ('Y','N') and 
                           beard in ('Y','N') and
                            eye_glasses in ('Y','N')));

comment on column character.user_id is 'Primary key for character table and Foreign key of user_id column of profile table';
comment on column character.skin_color is 'The skin color of user';
comment on column character.height is 'The height of user';
comment on column character.weight is 'The weight of user';
comment on column character.eye_color is 'The eye color of user';
comment on column character.hair_color is 'The hair color of user';
comment on column character.hair_length is 'The hair length of user';
comment on column character.hair_type is 'The hair type of user';
comment on column character.mustache is 'Checks if the user have mustache or not';
comment on column character.beard is 'Checks if the user have beard or not';
comment on column character.eye_glasses is 'Checks if the user have glasses or not';
