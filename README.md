# Jax's Word Dojo

A spaced-repetition vocabulary trainer for Jax, hosted on GitHub Pages.

- **Words** load live from a [Google Sheet](https://docs.google.com/spreadsheets/d/190c37nH4QqdHu7QLtROKx7KDNq_FQhCkDU6jOFRKs54/edit?gid=1376137610) (columns: Word, Part of speech, Meaning, Synonym, Antonym, Example sentence). Add rows there and they appear on the next page load. Rows without a Meaning are skipped, and the Parent tab reports how many are waiting.
- **Five new words a day.** The allowance is per calendar day, not per round, so a second round on the same day is pure review and he never meets more than five unfamiliar words in a day. Each new word gets a teaching card — meaning, synonym, antonym, example — before it is ever tested.
- **Ten questions a round**, mixing pick-the-meaning, pick-the-word, synonyms, antonyms, fill-in-the-blank, real-life usage, analogies, odd-one-out, and letter-tile unscrambles. Early on, when there is little to review, the new words get a second pass with a different question type rather than leaving a short round.
- **Questions are generated live** by Claude through a Supabase Edge Function, calibrated to how well he knows each word. Wrong answers explain why the option he picked was wrong, not just why the right one was right. Distractors are held at an upper-elementary reading level, so the challenge is the target word rather than three unfamiliar options.
- **Scheduling**: Leitner boxes. Each correct first-try answer moves a word up a level with a longer rest (1, 3, 7, 14 days); a miss sends it back to level 1 and repeats it in the round.
- **Parent tab**: mastery and struggle summary, searchable/filterable word list, per-word accuracy and levels, session history, accuracy by question type.
- **Rewards**: a Dragon Ball Z celebration clip at the end of each round, and ki earned toward the seven Dragon Balls; collecting all seven summons the dragon.
- **Scores** sync via Supabase (with localStorage fallback), so progress is shared across devices.

Static files (`index.html` + `generate.js`), no build step. See `DEPLOY.md` for the question-generator setup.

## Credits

Celebration clips are embedded from GIPHY's CDN rather than copied into this
repo, and fall back to drawn SVG art if unreachable. Same set as Wesley's app —
see that repo's README for the full list.
