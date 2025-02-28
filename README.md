Sports Event Quiz App

Instructions for Running the Sports Event Quiz App

1. Clone the Repository

If you haven't already cloned the repository, use the following command:

        git clone https://github.com/zimejin07/sports-event-quiz-web-application.git

        cd sports-event-quiz-web-application

2. Install Dependencies

         mix deps.get

3. The app uses an Ecto database to store event data:
   
         mix ecto.create

         mix ecto.migrate

Insert Seed Data:

    mix run priv/repo/seeds.exs

4. Start the Phoenix Server:

        mix phx.server

5. Access the Application

     http://localhost:4000

Test Cases: 

*      Ensuring selected answers are stored correctly.

*      Verifying the quiz completion logic.Validation of question navigation 

*      Verifying the quiz completion logic.

*      Ensuring that the phx-submit="submit_answer" event processes inputs correctly.

*      Edge cases like submitting without selecting an answer have been tested.

Design Reference:

![question_view](https://github.com/user-attachments/assets/ef2f0adb-6bc3-41e8-809d-e3f6d7f724b1)


![event_page](https://github.com/user-attachments/assets/cefdf005-30e4-499b-b4be-2cff56f2d0f4)

---

### **Potential Improvements**  

1. **PostgreSQL Setup Instructions**  
   - To include steps to install PostgreSQL on macOS, Windows, and Linux.  
   - To provide commands to start the PostgreSQL service.  
   - To include SQL commands to create a user, database, and set permissions.  

2. **Docker Support**  
   - Add a `docker-compose.yml` file to easily spin up a PostgreSQL container.  
   - Include instructions to run `docker-compose up -d` for quick database setup.  

3. **Fix UI/UX Issues**  
   - Ensure the "Live Quiz Available" tag doesn’t overlap with the quiz button when the event name is long.  
   - Align the "Start Quiz" button to the bottom of the card, regardless of event name length.  
   - Format timestamps properly for the user’s timezone instead of displaying raw values.  

4. **Fix Navigation & Stability Issues**  
   - Prevent the "Previous" button from crashing the page.  
   - Disable the "Next" button until an answer is selected to avoid crashes.  
   - Ensure LiveView state is preserved when navigating between questions.  

5. **Improve Database Schema**  
   - Store answers as a JSON object as an array of strings for better readability and query performance instead of storing answers as a JSON object.  

---

References

Official Phoenix Framework Website: https://www.phoenixframework.org/

Phoenix Guides: https://hexdocs.pm/phoenix/overview.html

Phoenix Docs: https://hexdocs.pm/phoenix

Phoenix Forum: https://elixirforum.com/c/phoenix-forum

Phoenix GitHub Source: https://github.com/phoenixframework/phoenix


