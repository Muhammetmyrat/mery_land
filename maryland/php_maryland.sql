CREATE TABLE `about_images` (
  `id` serial PRIMARY Key NOT NULL,
  `image_1` CHARACTER VARYING(255) NOT NULL,
  `image_2` CHARACTER VARYING(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);



CREATE TABLE `about_sliders` (
  `id` serial PRIMARY Key NOT NULL,
  `image` CHARACTER VARYING(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE `about_texts` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `title_1` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `content_1` TEXT DEFAULT NULL,
  `title_2` CHARACTER VARYING(255) DEFAULT NULL,
  `content_2` TEXT DEFAULT NULL,
  `button_text` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `addresses` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `address` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `admins` (
  `id` serial PRIMARY Key NOT NULL,
  `email`CHARACTER VARYING(255) NOT NULL,
  `password`CHARACTER VARYING(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE `categories` (
  `id` serial PRIMARY Key NOT NULL,
  `image`CHARACTER VARYING(255) NOT NULL,
  `name`CHARACTER VARYING(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `contactpage_images` (
  `id` serial PRIMARY Key NOT NULL,
  `image`CHARACTER VARYING(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `contactpage_texts` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title`CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `button_text`CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `pl_name`CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `pl_email`CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `pl_subject`CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `pl_message`CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `title_2`CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `content` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `failed_jobs` (
  `id` serial PRIMARY Key NOT NULL,
  `uuid` CHARACTER VARYING(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` TEXT NOT NULL,
  `exception` TEXT NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
);



CREATE TABLE `footer_texts` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `title_1` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `title_2` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `title_3` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `title_4` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `title_5` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `homepage_texts` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `title_1` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `content_1` TEXT DEFAULT NULL,
  `title_2` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `content_2` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE `home_page_sliders` (
  `id` serial PRIMARY Key NOT NULL,
  `image` CHARACTER VARYING(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `languages` (
  `id` serial PRIMARY Key NOT NULL,
  `name` CHARACTER VARYING(255) NOT NULL,
  `short_name` CHARACTER VARYING(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `menu_abouts` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `name` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE `menu_contacts` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `name` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `menu_homes` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `name` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `menu_products` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `name` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE `menu_services` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `name` CHARACTER VARYING(255) DEFAULT 'uytget',
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);


CREATE TABLE `migrations` (
  `id` serial PRIMARY Key NOT NULL,
  `migration` CHARACTER VARYING(255) NOT NULL,
  `batch` INT NOT NULL
);

CREATE TABLE `notifications` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `notification_1` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `notification_2` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `notification_3` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `notification_4` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);


CREATE TABLE `partners` (
  `id` serial PRIMARY Key NOT NULL,
  `image` CHARACTER VARYING(255) NOT NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);


CREATE TABLE `password_resets` (
  `email` CHARACTER VARYING(255) NOT NULL,
  `token` CHARACTER VARYING(255) NOT NULL,
  `created_at` timestamp DEFAULT current_timestamp
);


CREATE TABLE `personal_access_tokens` (
  `id` serial PRIMARY Key NOT NULL,
  `tokenable_type` CHARACTER VARYING(255) NOT NULL,
  `tokenable_id` INT NOT NULL,
  `name` CHARACTER VARYING(255) NOT NULL,
  `token` CHARACTER VARYING(255) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp DEFAULT current_timestamp,
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);

CREATE TABLE `phones` (
  `id` serial PRIMARY Key NOT NULL,
  `phone` CHARACTER VARYING(255)  NOT NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);

CREATE TABLE `productpage_images` (
  `id` serial PRIMARY Key NOT NULL,
  `image` CHARACTER VARYING(255)  NOT NULL,
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);

CREATE TABLE `productpage_texts` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `title` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);


CREATE TABLE `products` (
  `id` serial PRIMARY Key NOT NULL,
  `category_id` INT DEFAULT NULL,
  `image` CHARACTER VARYING(255) NOT NULL,
  `name` CHARACTER VARYING(255) NOT NULL DEFAULT 'gerekdal',
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);


CREATE TABLE `services` (
  `id` serial PRIMARY Key NOT NULL,
  `image` CHARACTER VARYING(255) NOT NULL,
  `name` CHARACTER VARYING(255) NOT NULL DEFAULT 'gerekdal',
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);


CREATE TABLE `servicespage_texts` (
  `id` serial PRIMARY Key NOT NULL,
  `lang_id`INT DEFAULT NULL,
  `title` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` timestamp DEFAULT current_timestamp,
  `updated_at` timestamp DEFAULT current_timestamp
);


CREATE TABLE `settings` (
  `id` SERIAL PRIMARY KEY NOT NULL,
  `logo` CHARACTER VARYING(255)  NOT NULL,
  `logo_black` CHARACTER VARYING(255)  NOT NULL,
  `favicon` CHARACTER VARYING(255)  NOT NULL,
  `email` CHARACTER VARYING(255)  NOT NULL,
  `whatsapp` CHARACTER VARYING(255)  NOT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
) 

CREATE TABLE `translatioin_homepage_sliders` (
  `id` SERIAL PRIMARY KEY NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `homepageslider_id` INT DEFAULT NULL,
  `title` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `content` TEXT  DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
)


CREATE TABLE `translation_categories` (
  `id` SERIAL PRIMARY KEY NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `category_id` INT DEFAULT NULL,
  `title` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `created_at` TIMESTAMP DEFAULT current_timestamp,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
) 


CREATE TABLE `translation_products` (
  `id` SERIAL PRIMARY KEY NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `product_id` INT DEFAULT NULL,
  `title` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `content` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
)


CREATE TABLE `translation_services` (
  `id` SERIAL PRIMARY KEY NOT NULL,
  `lang_id` INT DEFAULT NULL,
  `service_id` INT DEFAULT NULL,
  `title` CHARACTER VARYING(255) NOT NULL DEFAULT 'uytget',
  `content` TEXT DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
)


CREATE TABLE `users` (
  `id` SERIAL PRIMARY KEY NOT NULL,
  `name` CHARACTER VARYING(255)  NOT NULL,
  `email` CHARACTER VARYING(255) NOT NULL,
  `email_verified_at` TIMESTAMP  DEFAULT NULL,
  `password` CHARACTER VARYING(255) NOT NULL,
  `remember_token` CHARACTER VARYING(100) DEFAULT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT current_timestamp
)

 