alias SportsEventQuizApp.Repo
alias SportsEventQuizApp.Event
alias SportsEventQuizApp.Question

# Insert an Event
event = Repo.insert!(%Event{
  name: "Manchester City vs Manchester United",
  start_time: ~N[2024-06-01 18:00:00],
  info: "Answer 5/5 questions and win 50 USDT"
})

# Insert Questions for the Event
Repo.insert!(%Question{
  event_id: event.id,
  text: "How many goals will be scored?",
  options: %{"0" => "0", "1" => "1", "2" => "2", "3" => "3", "4" => "4", "5+" => "5+"}
})

Repo.insert!(%Question{
  event_id: event.id,
  text: "Who will score first?",
  options: %{"Man City" => "Man City", "Man United" => "Man United", "No Goal" => "No Goal"}
})

