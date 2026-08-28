# Jax's Word Dojo

A spaced-repetition vocabulary trainer for Jax, hosted on GitHub Pages.

- **Words** load live from a [Google Sheet](https://docs.google.com/spreadsheets/d/190c37nH4QqdHu7QLtROKx7KDNq_FQhCkDU6jOFRKs54/edit?gid=1376137610) (columns: Word, Part of speech, Meaning, Synonym, Antonym, Example sentence). Add rows there and they appear on the next page load. Rows without a Meaning are skipped, and the Parent tab reports how many are waiting.
- **Three new words a day.** The allowance is per calendar day, not per round, so a second round on the same day is pure review and he never meets more than three unfamiliar words in a day. Each new word gets a teaching card — meaning, synonym, antonym, example — before it is ever tested.
- **Ten questions a round**, mixing pick-the-meaning, pick-the-word, synonyms, antonyms, fill-in-the-blank, real-life usage, analogies, odd-one-out, and letter-tile unscrambles. Early on, when there is little to review, the new words get a second pass with a different question type rather than leaving a short round.
- **Questions are generated live** by Claude through a Supabase Edge Function, calibrated to how well he knows each word. Wrong answers explain why the option he picked was wrong, not just why the right one was right. Distractors are held at an upper-elementary reading level, so the challenge is the target word rather than three unfamiliar options.
- **Scheduling**: Leitner boxes. Each correct first-try answer moves a word up a level with a longer rest (1, 3, 7, 14 days); a miss sends it back to level 1 and repeats it in the round.
- **Parent tab**: mastery and struggle summary, searchable/filterable word list, per-word accuracy and levels, session history, accuracy by question type.
- **Rewards**: a Dragon Ball Z celebration clip at the end of each round, and ki earned toward the seven Dragon Balls; collecting all seven summons the dragon.
- **Scores** sync via Supabase (with localStorage fallback), so progress is shared across devices.

Static files (`index.html` + `generate.js`), no build step. See `DEPLOY.md` for the question-generator setup.

## Credits

Celebration clips are embedded from GIPHY's CDN rather than copied into this
repo. One is picked at random when a round ends, never repeating twice in a row;
the celebratory ones are held back below 70% so the clip matches the message.
A separate clip plays when the Dragon Balls are cashed in. If a clip cannot be
reached, the app falls back to drawn SVG art so the screen still works offline.

A clip may name a lighter GIPHY rendition when the full-size file is too heavy
for a phone — the otter below is 18MB at full size and 1.4MB at 200w, which is
the size it renders at anyway.

- https://giphy.com/gifs/super-saiyan-UBB6f0hKhlShy
- https://giphy.com/gifs/dragon-ball-z-goku-hxCB1Qf11SrU4
- https://giphy.com/gifs/anime-dragon-goku-eUIb94IVB7pIBRoF0A
- https://giphy.com/gifs/thumbs-up-goku-dragonball-z-11YMhfLfGoq5Gg
- https://giphy.com/gifs/like-a-boss-125cxELHOpsLra
- https://giphy.com/gifs/goku-dragon-ball-master-roshi-RihThkWxzFENW
- https://giphy.com/gifs/good-job-congratulations-otter-ely3apij36BJhoZ234
- https://giphy.com/gifs/moodman-quality-nice-work-VhWVAa7rUtT3xKX6Cd
- https://giphy.com/gifs/americasgottalent-thumbs-up-agt-simon-cowell-3o72FcJmLzIdYJdmDe
- https://giphy.com/gifs/anime-shenron-dragonballdaima-mD78vEbuQRibX0VJrH (dragon summon)
