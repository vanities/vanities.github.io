````markdown
---
layout: post
title: "The Vibe Coder"
date: 2025-04-09 00:14:00 -0500
categories: jekyll update
---

With the rise of AI coding, begat the [Vibe Coder](https://serce.me/posts/2025-31-03-there-is-no-vibe-engineering), with vibe coding leading the charge into a new era of software development. Vibe coding is not _Clean Code_. It’s not meticulously crafted TDD. It’s not your senior engineer nitpicking your tabs vs spaces on your PR.

It’s a vibe.

And that vibe? It’s usually one of ✨just make it work✨, often fueled by AI pair programmers that never sleep and never argue.

"Make it work" is missing the "make it good" part. It’s the difference between a quick hack and a well-structured solution. It’s the difference between a codebase that’s easy to maintain and one that’s a tangled mess.

But as I’ve transitioned from classic pair programming to AI-assisted development, I’ve noticed some troubling patterns that pull us away from the collaborative art of software building and push us into a new kind of chaos.

I'm not [Insane](https://0x1.pt/2025/04/06/the-insanity-of-being-a-software-engineer/) you're insane.

---

## Pitfalls of Vibe Coding with AI

### 1. Recreating environment variables that already exist in the code base

How many `.env` files must be duplicated before we learn? AI doesn’t always understand the context of your project’s config, and suddenly you’ve got redundant or conflicting variables floating around.

```js
// 😬 the same API key despite existing process.env.AUTH_TOKEN
const apiKey = process.env.API_TOKEN;

// 👇 When this was already in your config
const apiKey = process.env.AUTH_TOKEN;
```
````

### 2. Hardcoding environment variables into the code

It feels like AI just loves hardcoding things. Maybe it's trying to be helpful, but embedding secrets or config directly in code is a massive red flag.

```python
# 😵‍💫
S3_BUCKET = "my-private-bucket"
AWS_ACCESS_KEY = "AKIAFAKEKEY123"

# 🤓 should’ve been:
import os
S3_BUCKET = os.getenv("S3_BUCKET")
```

This isn’t just messy—it’s dangerous.

### 3. Rewriting instead of reusing components, functions, or API calls

One of the most frustrating signs of unchecked AI contributions: you have three functions that do 90% the same thing, just with slightly different names and structure. Why? Because AI doesn’t remember your app like a teammate does.

```ts
// 😓 nearly identical to existing `fetchUserData()`
// But now it’s called `getUserInfo` and lives in a random utils file
async function getUserInfo(userId: string) {
  const res = await fetch(`/api/users/${userId}`);
  return res.json();
}
```

Code reuse is a vibe. Copy-paste AI code is not.

### 4. Disregarding the style and scaffold of a repo

Your repo has a design system. A folder structure. A rhythm. AI doesn’t care.

```jsx
// 😬 using inline styles in a project that uses Tailwind
<div style={{ padding: 10, color: 'red' }}>Oops</div>

// 🧠 meanwhile, your whole app is styled like:
<div className="p-2 text-red-500">Ahh, that's better</div>
```

Codebases have culture. AI doesn’t speak it—yet.

### 5. Integrating redundant packages into your repo

Your repo already uses a library. It’s working fine. It’s consistent. But AI? It doesn’t care. It just wants to get the job done — and sometimes that means bolting on a whole new dependency for a one-liner.

```js
// 😬 Who the hell still uses Axios?
import axios from "axios";

const data = await axios.get("/api/stuff");
```

When literally your whole codebase uses:

```ts
const res = await fetch("/api/stuff");
const data = await res.json();
```

Now you’ve got two HTTP clients, inconsistent patterns, and an extra 20kb in your bundle... for what? So the AI could feel clever for suggesting Axios?

### 5. Less code review, refactoring, testing cycle through collaborative work

AI outputs can feel finished. But they rarely are. And without a second human pair of eyes, we skip the crucial steps of review, refinement, and discussion.

Pairing used to bring questions like:

- "Why are we doing it this way?"
- "Can this function be reused?"
- "What edge cases are we missing?"

Now it’s just:

```bash
git add .
git commit -m "Add new endpoint"
git push
```

And that’s how bugs make it to prod.

---

## The Tells: How I Know You're Pasting AI Code

You can try to hide it, but vibe coding leaves a trail...

### 1. `// filename.js` at the top of the file

```js
// utils/helpers.js
export function doSomethingCool() {
  // ...
}
```

Except the file is now named `useCoolStuff.ts`. 😂

### 2. Unnecessary or outdated comments

```ts
// TODO: Add error handling
async function getData() {
  const res = await fetch("/api/data");
  return res.json();
}

// 👆 This comment has survived five commits and the error handling *was* added four days ago.
```

These little AI artifacts build up fast. Suddenly your code is full of mismatched intentions and leftovers from a time when the bot had something different in mind.

---

## Final Thoughts

I’m not against AI-assisted development. In fact, I love it. But if we’re not careful, vibe coding turns into code entropy. And no one wants to debug a codebase written by ten different copilots on autopilot.

Let’s keep the vibe, but bring back the craft.

—
_AM_
