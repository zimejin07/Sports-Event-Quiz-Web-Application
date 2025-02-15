alias SportsEventQuizApp.Repo
alias SportsEventQuizApp.Event
alias SportsEventQuizApp.Question

# Insert Event 1: Manchester City vs Manchester United
event1 = Repo.insert!(%Event{
  name: "Manchester City vs Manchester United",
  start_time: ~N[2024-06-01 18:00:00],
  info: "Answer 5/5 questions and win 50 USDT"
})

# Insert Questions for Event 1
Repo.insert!(%Question{
  event_id: event1.id,
  text: "How many goals will be scored?",
  options: %{"0" => "0", "1" => "1", "2" => "2", "3" => "3", "4" => "4", "5+" => "5+"}
})

Repo.insert!(%Question{
  event_id: event1.id,
  text: "Who will score first?",
  options: %{"Man City" => "Man City", "Man United" => "Man United", "No Goal" => "No Goal"}
})

Repo.insert!(%Question{
  event_id: event1.id,
  text: "Who will win the match?",
  options: %{"Man City" => "Man City", "Man United" => "Man United", "Draw" => "Draw"}
})

Repo.insert!(%Question{
  event_id: event1.id,
  text: "How many yellow cards will be shown?",
  options: %{"0" => "0", "1" => "1", "2" => "2", "3+" => "3+"}
})

Repo.insert!(%Question{
  event_id: event1.id,
  text: "Which player will receive a red card?",
  options: %{"No Red Card" => "No Red Card", "Player A" => "Player A", "Player B" => "Player B", "Player C" => "Player C"}
})

# Insert Event 2: Chelsea vs Arsenal
event2 = Repo.insert!(%Event{
  name: "Chelsea vs Arsenal",
  start_time: ~N[2024-06-05 20:00:00],
  info: "Answer 5/5 questions and win 50 USDT"
})

# Insert Questions for Event 2
Repo.insert!(%Question{
  event_id: event2.id,
  text: "How many goals will be scored?",
  options: %{"0" => "0", "1" => "1", "2" => "2", "3" => "3", "4" => "4", "5+" => "5+"}
})

Repo.insert!(%Question{
  event_id: event2.id,
  text: "Who will score first?",
  options: %{"Chelsea" => "Chelsea", "Arsenal" => "Arsenal", "No Goal" => "No Goal"}
})

Repo.insert!(%Question{
  event_id: event2.id,
  text: "Who will win the match?",
  options: %{"Chelsea" => "Chelsea", "Arsenal" => "Arsenal", "Draw" => "Draw"}
})

Repo.insert!(%Question{
  event_id: event2.id,
  text: "How many yellow cards will be shown?",
  options: %{"0" => "0", "1" => "1", "2" => "2", "3+" => "3+"}
})

Repo.insert!(%Question{
  event_id: event2.id,
  text: "Which player will receive a red card?",
  options: %{"No Red Card" => "No Red Card", "Player X" => "Player X", "Player Y" => "Player Y", "Player Z" => "Player Z"}
})

# Insert Event 3: Barcelona vs Real Madrid
event3 = Repo.insert!(%Event{
  name: "Barcelona vs Real Madrid",
  start_time: ~N[2024-06-10 22:00:00],
  info: "Answer 5/5 questions and win 50 USDT"
})

# Insert Questions for Event 3
Repo.insert!(%Question{
  event_id: event3.id,
  text: "How many goals will be scored?",
  options: %{"0" => "0", "1" => "1", "2" => "2", "3" => "3", "4" => "4", "5+" => "5+"}
})

Repo.insert!(%Question{
  event_id: event3.id,
  text: "Who will score first?",
  options: %{"Barcelona" => "Barcelona", "Real Madrid" => "Real Madrid", "No Goal" => "No Goal"}
})

Repo.insert!(%Question{
  event_id: event3.id,
  text: "Who will win the match?",
  options: %{"Barcelona" => "Barcelona", "Real Madrid" => "Real Madrid", "Draw" => "Draw"}
})

Repo.insert!(%Question{
  event_id: event3.id,
  text: "How many yellow cards will be shown?",
  options: %{"0" => "0", "1" => "1", "2" => "2", "3+" => "3+"}
})

Repo.insert!(%Question{
  event_id: event3.id,
  text: "Which player will receive a red card?",
  options: %{"No Red Card" => "No Red Card", "Player M" => "Player M", "Player N" => "Player N", "Player O" => "Player O"}
})

# Insert Event 4: Juventus vs AC Milan
event4 = Repo.insert!(%Event{
  name: "Juventus vs AC Milan",
  start_time: ~N[2024-06-12 18:30:00],
  info: "Answer 5/5 questions and win 50 USDT"
})

# Insert Questions for Event 4
Repo.insert!(%Question{
  event_id: event4.id,
  text: "How many goals will be scored?",
  options: %{"0" => "0", "1" => "1", "2" => "2", "3" => "3", "4" => "4", "5+" => "5+"}
})

Repo.insert!(%Question{
  event_id: event4.id,
  text: "Who will score first?",
  options: %{"Juventus" => "Juventus", "AC Milan" => "AC Milan", "No Goal" => "No Goal"}
})

Repo.insert!(%Question{
  event_id: event4.id,
  text: "Who will win the match?",
  options: %{"Juventus" => "Juventus", "AC Milan" => "AC Milan", "Draw" => "Draw"}
})

Repo.insert!(%Question{
  event_id: event4.id,
  text: "How many yellow cards will be shown?",
  options: %{"0" => "0", "1" => "1", "2" => "2", "3+" => "3+"}
})

Repo.insert!(%Question{
  event_id: event4.id,
  text: "Which player will receive a red card?",
  options: %{"No Red Card" => "No Red Card", "Player Q" => "Player Q", "Player R" => "Player R", "Player S" => "Player S"}
})
