# RP1 paper selection

Created almost exclusively using Claude Code. Uses a simple Postrgres schema on Supabase to allow students to choose papers for their RP1 assignment. Security issues are ignored: The table containing selected research papers is globally readable, and inserts by anyone are permitted. Existing rows cannot be changed except by the database owner, via the Supabase interface.

To test locally: `python -m http.server 8000` in the `rp1-paper-selection` directory.