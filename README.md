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

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
