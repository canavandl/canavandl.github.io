---
date: 2026-03-10
authors:
  - canavandl
---

# Building the Harness: Bokeh and git worktrees

Mitchell Hashimoto described "harness engineering" in his blog post [My AI Adoption Journey](https://mitchellh.com/writing/my-ai-adoption-journey#step-5-engineer-the-harness) as "the idea that anytime you find an agent makes a mistake, you take the time to engineer a solution such that the agent never makes that mistake again."

Worktrees are a git feature that enables concurrent, multi-agent development by creating multiple working directories from a single repository. Since Bokeh is a combined Python and TypeScript package however, isolating these worktrees requires additional setup.

Specifically, Bokeh builds the BokehJS resources and statically links them to the environment's Bokeh version. Using a single Python environment for concurrent development means that it gets confusing which worktree's BokehJS resources are being used. I've repeatedly wasted time by running an example in a bugfix or feature worktree without realizing that I was loading BokehJS from another worktree that lacked my desired changes.

As the conda package manager is deeply integrated into the Bokeh project, the solution is to have a unique conda environment for each worktree. In the spirit of "engineering the harness" this should be automatic. My current solution is a git `post-checkout` hook that detects worktree creation and creates an eponymous conda environment and symlinks the BokehJS static resources. 

Since there's no git hook to detect removing a git worktree, I have a `.claude/scripts/install-worktree-commands` script that's mentioned in CLAUDE.md. The consequence of an orphaned environment when Claude fails to remove a conda environment after deleting a worktree is some wasted disk space, which is a minimal concern.

To tie things together, CLAUDE.md describes that Python commands such as `python` and `pytest` should be invoked as `conda run` commands that include the associated conda environment (i.e. `conda run -n bk-bugfix-14905 pytest tests/`)

Key Takeaways:
- Git hooks (and Claude hooks) are great. It would have been possible to describe the conda environment creation and configuration in my CLAUDE.md, but it's preferable to me to have this implemented deterministically as code.
- Adding workflow descriptions to CLAUDE.md is the right way to document workflows. I've found that context compaction can cause things I've told Claude to remember (i.e. "always use `conda run` commands") to be forgotten.

Note: Claude CLI now offers `WorktreeCreate` and `WorktreeRemove` hooks. I'm currently using Matthew Rocklin's [Claude Chic](https://github.com/mrocklin/claudechic) as a Claude Code frontend which has its own `/worktree` skill, so the hooks aren't triggered for me.