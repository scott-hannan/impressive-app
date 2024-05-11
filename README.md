The purpose of this repo is to create all the bits and bobs that come with deploying even a simple app. I am using it to further my knowledge of each part of the SLDC from formatting code, building containers, creating infrastructure, deploying an app and infrastructure separately, keeping packages up to date. 

There is a lot of things to consider :D - The overall goal of the project, other than learning the individual aspects of what go into an app, is to better learn to plan and make decisions about technologies.


## Phase 1 - Build Containers, Static Analysis, Dependency Management and Project Config

### Initial decisions
* For my container tooling I have chosen Docker. Reason being I am familiar with it, but there are lots more things I'd like to learn about it. I am thinking of using ECR/ECS as a container registry and run-time, we'll see.
* For my CI I've chosen to use github actions, it is the least effort to spin up - anything to stay away from Jenkins.
* For my language I chose Python in order to get some more practice, I chose Django as a framework as it is something I am unfamiliar with and is very well documented / has large community support.
* For my dependency management I chose Poetry to try something new. I really like the user experience so far compared to pip - maybe this feeling won't last forever.

### Goal
The goal of `Phase 1` was very simple: Get a containerized web-app running, and have some basic tooling to make local development easier.

### Thoughts
There is a LOT that goes into starting a project from scratch - I guess this is why boilerplate repos exist. 

### What's Next? 
For phase 2 I think I will focus on getting my container published and using a cloud container run-time to run my containers in a cluster (of 1 for money purposes). This will point me more towards the aspects of the project that are infra/platform.

Things I want to keep in mind:
* When developing an app: What is the best time to instrument an application? Instrument meaning something like open telemetry. 
* How to design the build/deployment flows to keep infrastructure and application code completely separate.
* How to keep the developer experience in mind?
* (for further down): Do I deploy versioned apps (ie. something like packages), or do "on merge to main, that is the new live version?" 
* (for further down): When do I add something like dependa-bot or renovate to manage package versions? (Probably ASAP :D) 

### Phase 1.1
* I am going to use invoke as an interface for tasks that should be run in dev/CI - I want to keep this tooling as lightweight as possible.

* **Captains Log, Day 15**: I spent a lot of time trying to craft the perfect dockerfile, which I now realize was a waste. Not a waste in the sense that I didn't learn anything - but more a waste in the sense of I am trying to optimize before just getting something working. So I scrapped most of the docker shenanigans I was working on. I am left with a simple docker file that installs my non-dev dependencies and runs a django server. This is something I will return to when it _makes sense_.

* Phase one looks to be drawing to an end, lets review our goals.
    * Get a containerized web app running: At least locally, this has been accomplished.
    * Have some basic tooling for development: I made a couple commands to handle docker, there is linting and formatting, there is dependency management and virtualenv. 

### Phase 1 Final Thoughts
* Starting something from the ground up is not a simple task, there is so much to handle.
* I want to push forwards to phase 2 even though there is much, much more to do related to dev tooling, dependencies, images, etc. But I think this is a good start. These things will continue to be tweaked, added and overhauled, but we've got a good base.
* I thought, "hey kubernetes would be cool to try." So, I tried it, and realized for a project of this scope, it was wayyyyy overcomplicated - but hey I learned some stuff so not a loss at all.
* Poetry might not be the best package manager - it complicated the containerization of the app quite a lot. Most of the issues I ran into this phase had to do with poetry. I will leave it because **half of the fun of software development is migrating from one tool to another** ---- So, really looking forward to that :D.
* I think the goal for phase 2 will center more around developing a basic application, rather than the tooling - we can see if the tooling I put in place to dev actually helps! 
* Things outstanding to remember: workflows for building containers (how does this play with invoke), dev-container, *the cloud*  