# Regenerating example sentences

`sentences.js` is generated once and committed, because a sentence for a word
never changes — there is no reason to ask for it again on every page load. Words
added to the sheet after the last run fall back to whatever example the sheet
itself provides, so the app keeps working either way.

Re-run only when enough new words have accumulated to be worth it:

1. Pull the sheet into a JSON array of `{id, word, pos, meaning, example}`.
2. `./generate-sentences.sh <name> <words.json> "<Name>" "<age>"` — posts to the
   `generate-questions` function in `sentences` mode, in chunks of 12.
3. Merge the returned `{wordId, sentence}` pairs into `sentences.js`, keeping the
   existing entries.

Check that every sentence actually contains its word before committing.
