
CREATE TABLE menu (
    menu_id INTEGER PRIMARY KEY,
    FOREIGN KEY (store_id) references restaurants (restaurant_id),
    FOREIGN KEY (food_id) references  food (food_id)
);

CREATE TABLE food (
    food_id INTEGER PRIMARY KEY,
    FOREIGN KEY (food_ingredient_id) references food_ingredient (food_ingredient_id),
    FOREIGN KEY (category_id) references  category (category_id),
    food_name VARCHAR(25),
    food_description VARCHAR(100),
    price DECIMAL,
    picture_url VARCHAR(100)
);

CREATE TABLE food_category (
    food_category_id INTEGER PRIMARY KEY,
    food_category_name VARCHAR(25)
);

CREATE TABLE food_exclusion (
    food_exclusion_id INTEGER PRIMARY KEY,
    FOREIGN KEY (user_profile_id) references user_profile (user_profile_id),
    FOREIGN KEY (ingredient_id) references  ingredient (ingredient_id)
);

CREATE TABLE favorite (
    favorite_id INTEGER PRIMARY KEY,
    FOREIGN KEY (user_profile_id) references user_profile (user_profile_id),
    FOREIGN KEY (food_id) references  food (food_id)
);

CREATE TABLE user_profile (
    user_id INTEGER PRIMARY KEY,
    FOREIGN KEY (food_exclusion_id) references food_exclusion (food_exclusion_id),
    first_name VARCHAR(25),
    first_name VARCHAR(25),
    user_name VARCHAR(25),
    user_password VARCHAR(25),
    email VARCHAR(50)
);

CREATE TABLE fave_restaurant (
    favorite_restaurant_id INTEGER PRIMARY KEY,
     FOREIGN KEY (user_profile_id) references user_profile (user_profile_id),
    FOREIGN KEY (restaurant_id) references restaurant (restaurant_id)
);
