# Project 1 - WOOFER (It's like Twitter... for dogs!)

See it in action here: https://wooferproject.herokuapp.com/

It is a social media platform (basically a Twitter clone) but for users to sign up on behalf of their dogs and "woof" (instead of "tweet") at their dog friends!

![alt text](screenshots/signedout-homepage.png "A screenshot of the WOOFER home page when signed out")

## How to use
- Sign up on the home page, update your doggos details, then you're ready to 'woof'!
- Post your woofs from the home page

![alt text](screenshots/signedin-homepage.png "A screenshot of the WOOFER home page when signed in")

- Find other doggos to follow on the users page
- View a doggos profile and click 'follow' to add their woofs to your home feed!

![alt text](screenshots/usershow.png "A screenshot of the WOOFER show user page")

- Unfollow if you need, delete embarrassing past tweets, and edit or delete your account at any time (Much disappoint. Many sad.)

![alt text](screenshots/useredit.png "A screenshot of the WOOFER edit user page")

## Objectives
- App should have at least 3 models. Currently Users, Woofs & Relationships.
- Views. Use partials to DRY (Don’t Repeat Yourself) up your views.
- Handles invalid data. Forms in your application should validate data and handle incorrect inputs.
- Validate sign up information, verify valid email addresses and secure passwords.
- Use Gems Use a GEM that talks to an API to add functionality to your app. Currently "Cloudinary".
- User Login. Make sure you have basic authentication and authorization set up (if you need it).
- Heroku. Deploy your code to Heroku.

## Built With
- HTML
- CSS (SCSS)
- Ruby on Rails
- Bootstrap

## Scope
WOOFER - Twitter for Dogs - Woof at your doggo friends!
Features will include
- Sign up
- Sign in via email address
- Set up profile with photo (uploaded via Cloudinary), name, bio etc.
- View own profile, and other dogs profile
- Follow and unfollow other dogs
- Post 'woofs' - images as well as text if possible.
- Home feed of 'woofs' from dogs they follow
- Edit or delete profile
- If time permits create a likes model, which would allow users to like 'woofs'.

## Object models
- USER (dogs) have_many WOOFS
- WOOFS belong_to DOG
- RELATIONSHIPS belongs_to :follower_id and belongs_to :followed_id

If time permits
- LIKES belongs_to :liker_id and belongs_to :liked_id

## Wireframes
Built in Sketch.

![alt text](wireframes/home-loggedout.png "Wireframe - Home Logged Out")

![alt text](wireframes/home-loggedin.png "Wireframe - Home Logged In")

![alt text](wireframes/profile.png "Wireframe - Profile Show")



## To do:
- [ ] Add likes model (similarly set up to Relationships) to allow users to like "woofs"
- [ ] Allow users to upload images with their "woofs"
- [ ] Add javascript to make logo animated

## License
This project is licensed under the MIT license.

## Acknowledgments
As usual, thanks to Joel, John and Theo @ General Assembly for the help, mostly with Cloudinary which was a killer!

This project was undertaken as part of the General Assembly Sydney's WDI 26 course, April 2018.
