# 🏟️ Sports Event Quiz Web Application

An interactive quiz app built with the **Phoenix Framework**, where users can take quizzes related to sports events. It features real-time updates via **LiveView** and uses **Ecto** with a PostgreSQL database.

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/zimejin07/sports-event-quiz-web-application.git
cd sports-event-quiz-web-application
```

### 2. Install Dependencies

```bash
mix deps.get
```

### 3. Set Up the Database

```bash
mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs
```

> Ensure PostgreSQL is installed and running before running the above commands.

### 4. Start the Phoenix Server

```bash
mix phx.server
```

### 5. Access the App

Open [http://localhost:4000](http://localhost:4000) in your browser.

---

## 🧪 Test Cases

- ✅ Selected answers are stored correctly
- ✅ Quiz completion logic validated
- ✅ Navigation between questions tested
- ✅ `phx-submit="submit_answer"` event properly processes inputs
- ✅ Edge cases (e.g., submitting with no answer selected) handled

---

## 🖼️ Design Reference

**Question View**  
![question_view](https://github.com/user-attachments/assets/ef2f0adb-6bc3-41e8-809d-e3f6d7f724b1)

**Event Page**  
![event_page](https://github.com/user-attachments/assets/cefdf005-30e4-499b-b4be-2cff56f2d0f4)

---

## 🔧 Potential Improvements

### 1. PostgreSQL Setup Instructions

- Add guides for installing PostgreSQL on macOS, Windows, and Linux
- Include steps to create user/database and set roles/permissions

### 2. Docker Support

- Add a `docker-compose.yml` for PostgreSQL container
- Provide instructions:
  ```bash
  docker-compose up -d
  ```

### 3. UI/UX Enhancements

- Fix overlapping “Live Quiz Available” tag
- Align “Start Quiz” button consistently
- Format timestamps to local user timezone

### 4. Navigation & Stability

- Prevent crash on “Previous” button
- Disable “Next” until an answer is selected
- Preserve LiveView state between questions

### 5. Database Schema

- Store quiz answers as an array of strings (JSON array) for performance and readability

---

## 📚 References

- [Phoenix Framework](https://www.phoenixframework.org/)
- [Phoenix Guides](https://hexdocs.pm/phoenix/overview.html)
- [Phoenix Docs](https://hexdocs.pm/phoenix)
- [Phoenix Forum](https://elixirforum.com/c/phoenix-forum)
- [Phoenix GitHub](https://github.com/phoenixframework/phoenix)

---

## 📜 License

This project is for educational and learning purposes only.
