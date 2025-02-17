# SportsEventQuizApp

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

Test Implemented:
* Unit Tests for Core Logic
* Validation of question navigation (e.g., progressing to the next question).
* Ensuring selected answers are stored correctly.
* Verifying quiz completion logic.

Testing Events & State Handling
* Ensuring the phx-submit="submit_answer" event processes inputs properly.
* Tested edge cases like submitting without selecting an answer.

![question_view](https://github.com/user-attachments/assets/ef2f0adb-6bc3-41e8-809d-e3f6d7f724b1)

![event_page](https://github.com/user-attachments/assets/cefdf005-30e4-499b-b4be-2cff56f2d0f4)

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
